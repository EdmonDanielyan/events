// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetUsers extends GetUsers {
  @override
  final BuiltList<int> users;

  factory _$GetUsers([void Function(GetUsersBuilder)? updates]) =>
      (new GetUsersBuilder()..update(updates))._build();

  _$GetUsers._({required this.users}) : super._() {
    BuiltValueNullFieldError.checkNotNull(users, r'GetUsers', 'users');
  }

  @override
  GetUsers rebuild(void Function(GetUsersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetUsersBuilder toBuilder() => new GetUsersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetUsers && users == other.users;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetUsers')..add('users', users))
        .toString();
  }
}

class GetUsersBuilder implements Builder<GetUsers, GetUsersBuilder> {
  _$GetUsers? _$v;

  ListBuilder<int>? _users;
  ListBuilder<int> get users => _$this._users ??= new ListBuilder<int>();
  set users(ListBuilder<int>? users) => _$this._users = users;

  GetUsersBuilder() {
    GetUsers._defaults(this);
  }

  GetUsersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetUsers other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetUsers;
  }

  @override
  void update(void Function(GetUsersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetUsers build() => _build();

  _$GetUsers _build() {
    _$GetUsers _$result;
    try {
      _$result = _$v ?? new _$GetUsers._(users: users.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        users.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetUsers', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
