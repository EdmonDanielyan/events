// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_full_list.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NotificationFullList extends NotificationFullList {
  @override
  final BuiltList<bool>? chats;

  factory _$NotificationFullList(
          [void Function(NotificationFullListBuilder)? updates]) =>
      (new NotificationFullListBuilder()..update(updates))._build();

  _$NotificationFullList._({this.chats}) : super._();

  @override
  NotificationFullList rebuild(
          void Function(NotificationFullListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationFullListBuilder toBuilder() =>
      new NotificationFullListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationFullList && chats == other.chats;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, chats.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationFullList')
          ..add('chats', chats))
        .toString();
  }
}

class NotificationFullListBuilder
    implements Builder<NotificationFullList, NotificationFullListBuilder> {
  _$NotificationFullList? _$v;

  ListBuilder<bool>? _chats;
  ListBuilder<bool> get chats => _$this._chats ??= new ListBuilder<bool>();
  set chats(ListBuilder<bool>? chats) => _$this._chats = chats;

  NotificationFullListBuilder() {
    NotificationFullList._defaults(this);
  }

  NotificationFullListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _chats = $v.chats?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationFullList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationFullList;
  }

  @override
  void update(void Function(NotificationFullListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationFullList build() => _build();

  _$NotificationFullList _build() {
    _$NotificationFullList _$result;
    try {
      _$result = _$v ?? new _$NotificationFullList._(chats: _chats?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'chats';
        _chats?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NotificationFullList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
