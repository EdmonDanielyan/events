import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:web_socket_channel/web_socket_channel.dart';

import 'common.dart';
import 'inbox.dart';
import 'message.dart';
import 'subscription.dart';

enum _ReceiveState {
  idle, //op=msg -> msg
  msg, //newline -> idle

}

///status of the nats client
enum Status {
  /// discontected or not connected
  disconnected,

  ///connected to server
  connected,

  ///alread close by close or server
  closed,

  ///automatic reconnection to server
  reconnecting,

  ///connecting by connect() method
  connecting,

  // draining_subs,
  // draining_pubs,
}

class _Pub {
  final String? subject;
  final List<int> data;
  final String? replyTo;

  _Pub(this.subject, this.data, this.replyTo);
}

///NATS client
class Client {
  WebSocketChannel? _channel;
  Socket? _socket;

  Info? _info;
  late Completer _pingCompleter;
  late Completer _connectCompleter;

  var _status = Status.disconnected;

  final _statusController = StreamController<Status>();

  ///status of the client
  Status get status => _status;

  /// Stream status for status update
  Stream<Status> get statusStream => _statusController.stream;

  var _connectOption = ConnectOption(verbose: false);

  ///server info
  Info? get info => _info;

  final _subs = <int, Subscription>{};
  final _backendSubs = <int, bool>{};
  final _pubBuffer = <_Pub>[];

  int _ssid = 0;

  List<int> _buffer = [];
  _ReceiveState _receiveState = _ReceiveState.idle;
  String _receiveLine1 = '';

  /// Connect to NATS server
  Future connect(Uri uri,
      {ConnectOption? connectOption,
      int timeout = 5,
      bool retry = true,
      int retryInterval = 10}) async {
    _connectCompleter = Completer();
    if (status != Status.disconnected && status != Status.closed) {
      return Future.error('Error: status not disconnected and not closed');
    }

    if (connectOption != null) _connectOption = connectOption;

    void loop() async {
      for (var i = 0; i == 0 || retry; i++) {
        if (i == 0) {
          _setStatus(Status.connecting);
        } else {
          _setStatus(Status.reconnecting);
          await Future.delayed(Duration(seconds: retryInterval));
        }

        try {
          _channel = WebSocketChannel.connect(uri);
          _setStatus(Status.connected);
          _connectCompleter.complete();

          _addConnectOption(_connectOption);
          _backendSubscriptAll();
          _flushPubBuffer();

          _buffer = [];
          _channel!.stream.listen((d) {
            _buffer.addAll(d);
            while (
                _receiveState == _ReceiveState.idle && _buffer.contains(13)) {
              _processOp();
            }
          }, onDone: () {
            _setStatus(Status.disconnected);
            _channel!.sink.close();
          }, onError: (err) {
            _setStatus(Status.disconnected);
            _channel!.sink.close();
          });
          return;
        } catch (err) {
          await close();
          _connectCompleter.completeError(err);
        }
      }
    }

    loop();
    return _connectCompleter.future;
  }

  void _backendSubscriptAll() {
    _backendSubs.clear();
    _subs.forEach((sid, s) async {
      _sub(s.subject, sid, queueGroup: s.queueGroup);
      // s.backendSubscription = true;
      _backendSubs[sid] = true;
    });
  }

  void _flushPubBuffer() {
    _pubBuffer.forEach((p) {
      _pub(p);
    });
  }

  void _processOp() async {
    ///find endline
    var nextLineIndex = _buffer.indexWhere((c) {
      if (c == 13) {
        return true;
      }
      return false;
    });
    if (nextLineIndex == -1) return;
    var line =
        String.fromCharCodes(_buffer.sublist(0, nextLineIndex)); // retest
    if (_buffer.length > nextLineIndex + 2) {
      _buffer.removeRange(0, nextLineIndex + 2);
    } else {
      _buffer = [];
    }

    ///decode operation
    var i = line.indexOf(' ');
    String op, data;
    if (i != -1) {
      op = line.substring(0, i).trim().toLowerCase();
      data = line.substring(i).trim();
    } else {
      op = line.trim().toLowerCase();
      data = '';
    }

    ///process operation
    switch (op) {
      case 'msg':
        _receiveState = _ReceiveState.msg;
        _receiveLine1 = line;
        _processMsg();
        _receiveLine1 = '';
        _receiveState = _ReceiveState.idle;
        break;
      case 'info':
        _info = Info.fromJson(jsonDecode(data));
        break;
      case 'ping':
        if (status == Status.connected) {
          _add('pong');
        }
        break;
      case '-err':
        _processErr(data);
        break;
      case 'pong':
        _pingCompleter.complete();
        break;
      case '+ok':
        //do nothing
        break;
    }
  }

  void _processErr(String data) {
    close();
  }

  void _processMsg() {
    var s = _receiveLine1.split(' ');
    var subject = s[1];
    var sid = int.parse(s[2]);
    String? replyTo;
    int length;
    if (s.length == 4) {
      length = int.parse(s[3]);
    } else {
      replyTo = s[3];
      length = int.parse(s[4]);
    }
    if (_buffer.length < length) return;
    var payload = Uint8List.fromList(_buffer.sublist(0, length));
    // _buffer = _buffer.sublist(length + 2);
    if (_buffer.length > length + 2) {
      _buffer.removeRange(0, length + 2);
    } else {
      _buffer = [];
    }

    if (_subs[sid] != null) {
      _subs[sid]!.add(Message(subject, sid, payload, this, replyTo: replyTo));
    }
  }

  /// get server max payload
  int? maxPayload() => _info?.maxPayload;

  ///ping server current not implement pong verification
  Future ping() {
    _pingCompleter = Completer();
    _add('ping');
    return _pingCompleter.future;
  }

  void _addConnectOption(ConnectOption c) {
    _add('connect ' + jsonEncode(c.toJson()));
  }

  ///default buffer action for pub
  var defaultPubBuffer = true;

  ///publish by byte (Uint8List) return true if sucess sending or buffering
  ///return false if not connect
  bool pub(String? subject, Uint8List data, {String? replyTo, bool? buffer}) {
    buffer ??= defaultPubBuffer;
    if (status != Status.connected) {
      if (buffer) {
        _pubBuffer.add(_Pub(subject, data, replyTo));
      } else {
        return false;
      }
    }

    if (replyTo == null) {
      _add('pub $subject ${data.length}');
    } else {
      _add('pub $subject $replyTo ${data.length}');
    }
    _addByte(data);

    return true;
  }

  ///publish by string
  bool pubString(String subject, String str,
      {String? replyTo, bool buffer = true}) {
    return pub(subject, utf8.encode(str) as Uint8List,
        replyTo: replyTo, buffer: buffer);
  }

  bool _pub(_Pub p) {
    if (p.replyTo == null) {
      _add('pub ${p.subject} ${p.data.length}');
    } else {
      _add('pub ${p.subject} ${p.replyTo} ${p.data.length}');
    }
    _addByte(p.data);

    return true;
  }

  ///subscribe to subject option with queuegroup
  Subscription sub(String subject, {int? customSsid, String? queueGroup}) {
    //customSsid = null;
    final newSsid = customSsid ?? _ssid;
    if (customSsid == null) {
      _ssid++;
    }
    //print("$subject - $newSsid");

    var s = Subscription(newSsid, subject, this, queueGroup: queueGroup);
    _subs[newSsid] = s;
    if (status == Status.connected) {
      _sub(subject, newSsid, queueGroup: queueGroup);
      _backendSubs[newSsid] = true;
    }
    return s;
  }

  void _sub(String? subject, int sid, {String? queueGroup}) {
    if (queueGroup == null) {
      _add('sub $subject $sid');
    } else {
      _add('sub $subject $queueGroup $sid');
    }
  }

  ///unsubscribe
  bool unSub(Subscription s) {
    var sid = s.sid;

    if (_subs[sid] == null) return false;
    _unSub(sid);
    _subs.remove(sid);
    s.close();
    _backendSubs.remove(sid);
    return true;
  }

  ///unsubscribe by id
  bool unSubById(int sid) {
    if (_subs[sid] == null) return false;
    return unSub(_subs[sid]!);
  }

  //Unsubscribe by Subject
  // ignore: public_member_api_docs
  void unSubscribeBySubject(String subject) {
    _subs.values.where((element) => element.subject == subject).forEach((element) {
      _unSub(element.sid);
    });
  }

  //todo unsub with max msgs

  void _unSub(int sid, {String? maxMsgs}) {
    if (maxMsgs == null) {
      _add('unsub $sid');
    } else {
      _add('unsub $sid $maxMsgs');
    }
  }

  // bool _add(String str) {
  //   if (_channel == null) return false; //todo throw error
  //   _channel!.sink.add(utf8.encode(str + '\r\n'));
  //   return true;
  // }

  bool _add(String str) {
    if (_channel != null) {
      _channel!.sink.add(utf8.encode(str + '\r\n'));
      return true;
    } else if (_socket != null) {
      _socket!.add(utf8.encode(str + '\r\n'));
      return true;
    }
    //todo throw
    return false;
  }

  // bool _addByte(List<int> msg) {
  //   if (_channel == null) return false; //todo throw error
  //   _channel!.sink.add(msg);
  //   _channel!.sink.add(utf8.encode('\r\n'));
  //   return true;
  // }

  bool _addByte(List<int> msg) {
    if (_channel != null) {
      _channel!.sink.add(msg);
      _channel!.sink.add(utf8.encode('\r\n'));
      return true;
    } else if (_socket != null) {
      _socket!.add(msg);
      _socket!.add(utf8.encode('\r\n'));
      return true;
    }
    //todo throw
    return false;
  }

  final _inboxs = <String, Subscription>{};

  /// Request will send a request payload and deliver the response message,
  /// TimeoutException on timeout.
  ///
  /// Example:
  /// ```dart
  /// try {
  ///   await client.request('service', Uint8List.fromList('request'.codeUnits),
  ///       timeout: Duration(seconds: 2));
  /// } on TimeoutException {
  ///   timeout = true;
  /// }
  /// ```

  Future<Message> request(String subj, Uint8List data,
      {String? queueGroup, Duration? timeout}) async {
    if (_inboxs[subj] == null) {
      var inbox = newInbox();
      _inboxs[subj] = sub(inbox, queueGroup: queueGroup);
    }

    pub(subj, data, replyTo: _inboxs[subj]!.subject);

    var stream = _inboxs[subj]!.stream!;
    var respond = await stream.take(1).single;

    if (timeout != null) return respond;

    return respond;
  }

  /// requestString() helper to request()
  Future<Message> requestString(String subj, String data,
      {String? queueGroup, Duration? timeout}) {
    return request(subj, Uint8List.fromList(data.codeUnits),
        queueGroup: queueGroup, timeout: timeout);
  }

  void _setStatus(Status newStatus) {
    _status = newStatus;
    _statusController.add(newStatus);
  }

  ///close connection to NATS server unsub to server but still keep subscription list at client
  Future close() async {
    _backendSubs.forEach((_, s) => s = false);
    _inboxs.clear();
    _setStatus(Status.closed);
    await _channel?.sink.close();
    await _socket?.close();
    _buffer = [];
  }

  ///Backward compatible with 0.2.x version
  Future tcpConnect(String host,
      {int port = 4222,
      ConnectOption? connectOption,
      int timeout = 5,
      bool retry = true,
      int retryInterval = 10}) async {
    String? _host;
    late int _port;
    _connectCompleter = Completer();
    if (status != Status.disconnected && status != Status.closed) {
      return Future.error('Error: status not disconnected and not closed');
    }
    _host = host;
    _port = port;

    if (connectOption != null) _connectOption = connectOption;

    void loop() async {
      for (var i = 0; i == 0 || retry; i++) {
        if (i == 0) {
          _setStatus(Status.connecting);
        } else {
          _setStatus(Status.reconnecting);
          await Future.delayed(Duration(seconds: retryInterval));
        }

        try {
          _socket = await Socket.connect(_host, _port,
              timeout: Duration(seconds: timeout));
          _setStatus(Status.connected);
          _connectCompleter.complete();

          _addConnectOption(_connectOption);
          _backendSubscriptAll();
          _flushPubBuffer();

          _buffer = [];
          _socket!.listen((d) {
            _buffer.addAll(d);
            while (
                _receiveState == _ReceiveState.idle && _buffer.contains(13)) {
              _processOp();
            }
          }, onDone: () {
            _setStatus(Status.disconnected);
            _socket!.close();
          }, onError: (err) {
            _setStatus(Status.disconnected);
            _socket!.close();
          });
          return;
        } catch (err) {
          await close();
          _connectCompleter.completeError(err);
        }
      }
    }

    loop();
    return _connectCompleter.future;
  }
}
