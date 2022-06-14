import 'package:ink_mobile/messenger/messenger/listeners/listener.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketProvider {
  final String url;
  final void Function(dynamic)? onConnect;
  final void Function(dynamic)? onConnectError;
  final void Function(dynamic)? onDisconnect;
  final void Function(dynamic)? onError;
  final List<Listener> handlers;

  const SocketProvider(
    this.url, {
    this.onConnect,
    this.onConnectError,
    this.onDisconnect,
    this.onError,
    this.handlers = const [],
  });

  Socket init() {
    Socket socket = io(
        url,
        OptionBuilder()
            .setTransports(['websocket'])
            .enableForceNewConnection()
            .setExtraHeaders(
              {"userId": 15},
            )
            .build());
    _onConnect(socket);
    _onConnectError(socket);
    _onDisconnect(socket);
    _onHandlers(socket);
    _onError(socket);

    return socket;
  }

  void _onConnect(Socket socket) {
    socket.onConnect((data) {
      if (onConnect != null) {
        onConnect!(data);
      }
    });
  }

  void _onConnectError(Socket socket) {
    socket.onConnectError((data) {
      if (onConnectError != null) {
        onConnectError!(data);
      }
    });
  }

  void _onDisconnect(Socket socket) {
    socket.onDisconnect((data) {
      if (onDisconnect != null) {
        onDisconnect!(data);
      }
    });
  }

  void _onHandlers(Socket socket) {
    if (handlers.isNotEmpty) {
      for (final socketHandler in handlers) {
        socket.on(socketHandler.event, (data) => socketHandler.handler(data));
      }
    }
  }

  void _onError(Socket socket) {
    socket.onError((data) {
      if (onError != null) {
        onError!(data);
      }
    });
  }
}