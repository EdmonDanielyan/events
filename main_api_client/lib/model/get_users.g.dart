// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'get_users.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GetUsers> _$getUsersSerializer = new _$GetUsersSerializer();

class _$GetUsersSerializer implements StructuredSerializer<GetUsers> {
  @override
  final Iterable<Type> types = const [GetUsers, _$GetUsers];
  @override
  final String wireName = 'GetUsers';

  @override
  Iterable<Object> serialize(Serializers serializers, GetUsers object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    return result;
  }

  @override
  GetUsers deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetUsersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'users':
          result.users.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GetUsers extends GetUsers {
  @override
  final BuiltList<int> users;

  factory _$GetUsers([void Function(GetUsersBuilder) updates]) =>
      (new GetUsersBuilder()..update(updates))._build();

  _$GetUsers._({this.users}) : super._();

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
    return $jf($jc(0, users.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetUsers')..add('users', users))
        .toString();
  }
}

class GetUsersBuilder implements Builder<GetUsers, GetUsersBuilder> {
  _$GetUsers _$v;

  ListBuilder<int> _users;
  ListBuilder<int> get users => _$this._users ??= new ListBuilder<int>();
  set users(ListBuilder<int> users) => _$this._users = users;

  GetUsersBuilder() {
    GetUsers._initializeBuilder(this);
  }

  GetUsersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users?.toBuilder();
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
  void update(void Function(GetUsersBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  GetUsers build() => _build();

  _$GetUsers _build() {
    _$GetUsers _$result;
    try {
      _$result = _$v ?? new _$GetUsers._(users: _users?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
