//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_users.g.dart';

abstract class GetUsers implements Built<GetUsers, GetUsersBuilder> {
  @nullable
  @BuiltValueField(wireName: r'users')
  BuiltList<int> get users;

  // Boilerplate code needed to wire-up generated code
  GetUsers._();

  static void _initializeBuilder(GetUsersBuilder b) => b;

  factory GetUsers([void updates(GetUsersBuilder b)]) = _$GetUsers;
  static Serializer<GetUsers> get serializer => _$getUsersSerializer;
}
