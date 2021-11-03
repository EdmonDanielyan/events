// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ChatTable extends DataClass implements Insertable<ChatTable> {
  final String id;
  final String name;
  final String description;
  final String avatar;
  final int ownerId;
  final int? participantId;
  final DateTime? updatedAt;
  ChatTable(
      {required this.id,
      required this.name,
      required this.description,
      required this.avatar,
      required this.ownerId,
      this.participantId,
      this.updatedAt});
  factory ChatTable.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ChatTable(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      avatar: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar'])!,
      ownerId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}owner_id'])!,
      participantId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}participant_id']),
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['avatar'] = Variable<String>(avatar);
    map['owner_id'] = Variable<int>(ownerId);
    if (!nullToAbsent || participantId != null) {
      map['participant_id'] = Variable<int?>(participantId);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime?>(updatedAt);
    }
    return map;
  }

  ChatTablesCompanion toCompanion(bool nullToAbsent) {
    return ChatTablesCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      avatar: Value(avatar),
      ownerId: Value(ownerId),
      participantId: participantId == null && nullToAbsent
          ? const Value.absent()
          : Value(participantId),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory ChatTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ChatTable(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      avatar: serializer.fromJson<String>(json['avatar']),
      ownerId: serializer.fromJson<int>(json['ownerId']),
      participantId: serializer.fromJson<int?>(json['participantId']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'avatar': serializer.toJson<String>(avatar),
      'ownerId': serializer.toJson<int>(ownerId),
      'participantId': serializer.toJson<int?>(participantId),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  ChatTable copyWith(
          {String? id,
          String? name,
          String? description,
          String? avatar,
          int? ownerId,
          int? participantId,
          DateTime? updatedAt}) =>
      ChatTable(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        avatar: avatar ?? this.avatar,
        ownerId: ownerId ?? this.ownerId,
        participantId: participantId ?? this.participantId,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('ChatTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('avatar: $avatar, ')
          ..write('ownerId: $ownerId, ')
          ..write('participantId: $participantId, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              description.hashCode,
              $mrjc(
                  avatar.hashCode,
                  $mrjc(ownerId.hashCode,
                      $mrjc(participantId.hashCode, updatedAt.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.avatar == this.avatar &&
          other.ownerId == this.ownerId &&
          other.participantId == this.participantId &&
          other.updatedAt == this.updatedAt);
}

class ChatTablesCompanion extends UpdateCompanion<ChatTable> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> avatar;
  final Value<int> ownerId;
  final Value<int?> participantId;
  final Value<DateTime?> updatedAt;
  const ChatTablesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.avatar = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.participantId = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ChatTablesCompanion.insert({
    required String id,
    required String name,
    required String description,
    required String avatar,
    required int ownerId,
    this.participantId = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        description = Value(description),
        avatar = Value(avatar),
        ownerId = Value(ownerId);
  static Insertable<ChatTable> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? avatar,
    Expression<int>? ownerId,
    Expression<int?>? participantId,
    Expression<DateTime?>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (avatar != null) 'avatar': avatar,
      if (ownerId != null) 'owner_id': ownerId,
      if (participantId != null) 'participant_id': participantId,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ChatTablesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? description,
      Value<String>? avatar,
      Value<int>? ownerId,
      Value<int?>? participantId,
      Value<DateTime?>? updatedAt}) {
    return ChatTablesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      avatar: avatar ?? this.avatar,
      ownerId: ownerId ?? this.ownerId,
      participantId: participantId ?? this.participantId,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<int>(ownerId.value);
    }
    if (participantId.present) {
      map['participant_id'] = Variable<int?>(participantId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime?>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatTablesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('avatar: $avatar, ')
          ..write('ownerId: $ownerId, ')
          ..write('participantId: $participantId, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ChatTablesTable extends ChatTables
    with TableInfo<$ChatTablesTable, ChatTable> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ChatTablesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 150),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  late final GeneratedColumn<String?> avatar = GeneratedColumn<String?>(
      'avatar', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _ownerIdMeta = const VerificationMeta('ownerId');
  late final GeneratedColumn<int?> ownerId = GeneratedColumn<int?>(
      'owner_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _participantIdMeta =
      const VerificationMeta('participantId');
  late final GeneratedColumn<int?> participantId = GeneratedColumn<int?>(
      'participant_id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue: Constant(new DateTime.now()));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, avatar, ownerId, participantId, updatedAt];
  @override
  String get aliasedName => _alias ?? 'chat_tables';
  @override
  String get actualTableName => 'chat_tables';
  @override
  VerificationContext validateIntegrity(Insertable<ChatTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    } else if (isInserting) {
      context.missing(_avatarMeta);
    }
    if (data.containsKey('owner_id')) {
      context.handle(_ownerIdMeta,
          ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta));
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('participant_id')) {
      context.handle(
          _participantIdMeta,
          participantId.isAcceptableOrUnknown(
              data['participant_id']!, _participantIdMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ChatTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ChatTable.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ChatTablesTable createAlias(String alias) {
    return $ChatTablesTable(_db, alias);
  }
}

class MessageTable extends DataClass implements Insertable<MessageTable> {
  final String id;
  final String chatId;
  final String message;
  final int userId;
  final bool read;
  final MessageStatus status;
  final DateTime? created;
  MessageTable(
      {required this.id,
      required this.chatId,
      required this.message,
      required this.userId,
      required this.read,
      required this.status,
      this.created});
  factory MessageTable.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MessageTable(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      chatId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_id'])!,
      message: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}message'])!,
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      read: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}read'])!,
      status: $MessageTablesTable.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status']))!,
      created: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['chat_id'] = Variable<String>(chatId);
    map['message'] = Variable<String>(message);
    map['user_id'] = Variable<int>(userId);
    map['read'] = Variable<bool>(read);
    {
      final converter = $MessageTablesTable.$converter0;
      map['status'] = Variable<int>(converter.mapToSql(status)!);
    }
    if (!nullToAbsent || created != null) {
      map['created'] = Variable<DateTime?>(created);
    }
    return map;
  }

  MessageTablesCompanion toCompanion(bool nullToAbsent) {
    return MessageTablesCompanion(
      id: Value(id),
      chatId: Value(chatId),
      message: Value(message),
      userId: Value(userId),
      read: Value(read),
      status: Value(status),
      created: created == null && nullToAbsent
          ? const Value.absent()
          : Value(created),
    );
  }

  factory MessageTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MessageTable(
      id: serializer.fromJson<String>(json['id']),
      chatId: serializer.fromJson<String>(json['chatId']),
      message: serializer.fromJson<String>(json['message']),
      userId: serializer.fromJson<int>(json['userId']),
      read: serializer.fromJson<bool>(json['read']),
      status: serializer.fromJson<MessageStatus>(json['status']),
      created: serializer.fromJson<DateTime?>(json['created']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'chatId': serializer.toJson<String>(chatId),
      'message': serializer.toJson<String>(message),
      'userId': serializer.toJson<int>(userId),
      'read': serializer.toJson<bool>(read),
      'status': serializer.toJson<MessageStatus>(status),
      'created': serializer.toJson<DateTime?>(created),
    };
  }

  MessageTable copyWith(
          {String? id,
          String? chatId,
          String? message,
          int? userId,
          bool? read,
          MessageStatus? status,
          DateTime? created}) =>
      MessageTable(
        id: id ?? this.id,
        chatId: chatId ?? this.chatId,
        message: message ?? this.message,
        userId: userId ?? this.userId,
        read: read ?? this.read,
        status: status ?? this.status,
        created: created ?? this.created,
      );
  @override
  String toString() {
    return (StringBuffer('MessageTable(')
          ..write('id: $id, ')
          ..write('chatId: $chatId, ')
          ..write('message: $message, ')
          ..write('userId: $userId, ')
          ..write('read: $read, ')
          ..write('status: $status, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          chatId.hashCode,
          $mrjc(
              message.hashCode,
              $mrjc(
                  userId.hashCode,
                  $mrjc(read.hashCode,
                      $mrjc(status.hashCode, created.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessageTable &&
          other.id == this.id &&
          other.chatId == this.chatId &&
          other.message == this.message &&
          other.userId == this.userId &&
          other.read == this.read &&
          other.status == this.status &&
          other.created == this.created);
}

class MessageTablesCompanion extends UpdateCompanion<MessageTable> {
  final Value<String> id;
  final Value<String> chatId;
  final Value<String> message;
  final Value<int> userId;
  final Value<bool> read;
  final Value<MessageStatus> status;
  final Value<DateTime?> created;
  const MessageTablesCompanion({
    this.id = const Value.absent(),
    this.chatId = const Value.absent(),
    this.message = const Value.absent(),
    this.userId = const Value.absent(),
    this.read = const Value.absent(),
    this.status = const Value.absent(),
    this.created = const Value.absent(),
  });
  MessageTablesCompanion.insert({
    required String id,
    required String chatId,
    required String message,
    required int userId,
    this.read = const Value.absent(),
    required MessageStatus status,
    this.created = const Value.absent(),
  })  : id = Value(id),
        chatId = Value(chatId),
        message = Value(message),
        userId = Value(userId),
        status = Value(status);
  static Insertable<MessageTable> custom({
    Expression<String>? id,
    Expression<String>? chatId,
    Expression<String>? message,
    Expression<int>? userId,
    Expression<bool>? read,
    Expression<MessageStatus>? status,
    Expression<DateTime?>? created,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chatId != null) 'chat_id': chatId,
      if (message != null) 'message': message,
      if (userId != null) 'user_id': userId,
      if (read != null) 'read': read,
      if (status != null) 'status': status,
      if (created != null) 'created': created,
    });
  }

  MessageTablesCompanion copyWith(
      {Value<String>? id,
      Value<String>? chatId,
      Value<String>? message,
      Value<int>? userId,
      Value<bool>? read,
      Value<MessageStatus>? status,
      Value<DateTime?>? created}) {
    return MessageTablesCompanion(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      message: message ?? this.message,
      userId: userId ?? this.userId,
      read: read ?? this.read,
      status: status ?? this.status,
      created: created ?? this.created,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (chatId.present) {
      map['chat_id'] = Variable<String>(chatId.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (read.present) {
      map['read'] = Variable<bool>(read.value);
    }
    if (status.present) {
      final converter = $MessageTablesTable.$converter0;
      map['status'] = Variable<int>(converter.mapToSql(status.value)!);
    }
    if (created.present) {
      map['created'] = Variable<DateTime?>(created.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessageTablesCompanion(')
          ..write('id: $id, ')
          ..write('chatId: $chatId, ')
          ..write('message: $message, ')
          ..write('userId: $userId, ')
          ..write('read: $read, ')
          ..write('status: $status, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }
}

class $MessageTablesTable extends MessageTables
    with TableInfo<$MessageTablesTable, MessageTable> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MessageTablesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _chatIdMeta = const VerificationMeta('chatId');
  late final GeneratedColumn<String?> chatId = GeneratedColumn<String?>(
      'chat_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _messageMeta = const VerificationMeta('message');
  late final GeneratedColumn<String?> message = GeneratedColumn<String?>(
      'message', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _readMeta = const VerificationMeta('read');
  late final GeneratedColumn<bool?> read = GeneratedColumn<bool?>(
      'read', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (read IN (0, 1))',
      defaultValue: Constant(false));
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumnWithTypeConverter<MessageStatus, int?> status =
      GeneratedColumn<int?>('status', aliasedName, false,
              typeName: 'INTEGER', requiredDuringInsert: true)
          .withConverter<MessageStatus>($MessageTablesTable.$converter0);
  final VerificationMeta _createdMeta = const VerificationMeta('created');
  late final GeneratedColumn<DateTime?> created = GeneratedColumn<DateTime?>(
      'created', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue: Constant(new DateTime.now()));
  @override
  List<GeneratedColumn> get $columns =>
      [id, chatId, message, userId, read, status, created];
  @override
  String get aliasedName => _alias ?? 'message_tables';
  @override
  String get actualTableName => 'message_tables';
  @override
  VerificationContext validateIntegrity(Insertable<MessageTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('chat_id')) {
      context.handle(_chatIdMeta,
          chatId.isAcceptableOrUnknown(data['chat_id']!, _chatIdMeta));
    } else if (isInserting) {
      context.missing(_chatIdMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('read')) {
      context.handle(
          _readMeta, read.isAcceptableOrUnknown(data['read']!, _readMeta));
    }
    context.handle(_statusMeta, const VerificationResult.success());
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  MessageTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MessageTable.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MessageTablesTable createAlias(String alias) {
    return $MessageTablesTable(_db, alias);
  }

  static TypeConverter<MessageStatus, int> $converter0 =
      const EnumIndexConverter<MessageStatus>(MessageStatus.values);
}

class UserTable extends DataClass implements Insertable<UserTable> {
  final int id;
  final String name;
  final String avatar;
  UserTable({required this.id, required this.name, required this.avatar});
  factory UserTable.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return UserTable(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      avatar: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['avatar'] = Variable<String>(avatar);
    return map;
  }

  UserTablesCompanion toCompanion(bool nullToAbsent) {
    return UserTablesCompanion(
      id: Value(id),
      name: Value(name),
      avatar: Value(avatar),
    );
  }

  factory UserTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UserTable(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      avatar: serializer.fromJson<String>(json['avatar']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'avatar': serializer.toJson<String>(avatar),
    };
  }

  UserTable copyWith({int? id, String? name, String? avatar}) => UserTable(
        id: id ?? this.id,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
      );
  @override
  String toString() {
    return (StringBuffer('UserTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('avatar: $avatar')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, avatar.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.avatar == this.avatar);
}

class UserTablesCompanion extends UpdateCompanion<UserTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> avatar;
  const UserTablesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.avatar = const Value.absent(),
  });
  UserTablesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String avatar,
  })  : name = Value(name),
        avatar = Value(avatar);
  static Insertable<UserTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? avatar,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (avatar != null) 'avatar': avatar,
    });
  }

  UserTablesCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? avatar}) {
    return UserTablesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTablesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('avatar: $avatar')
          ..write(')'))
        .toString();
  }
}

class $UserTablesTable extends UserTables
    with TableInfo<$UserTablesTable, UserTable> {
  final GeneratedDatabase _db;
  final String? _alias;
  $UserTablesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 150),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  late final GeneratedColumn<String?> avatar = GeneratedColumn<String?>(
      'avatar', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, avatar];
  @override
  String get aliasedName => _alias ?? 'user_tables';
  @override
  String get actualTableName => 'user_tables';
  @override
  VerificationContext validateIntegrity(Insertable<UserTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    } else if (isInserting) {
      context.missing(_avatarMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    return UserTable.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UserTablesTable createAlias(String alias) {
    return $UserTablesTable(_db, alias);
  }
}

class AdminTable extends DataClass implements Insertable<AdminTable> {
  final String chatId;
  final int userId;
  AdminTable({required this.chatId, required this.userId});
  factory AdminTable.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AdminTable(
      chatId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_id'])!,
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['chat_id'] = Variable<String>(chatId);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  AdminTablesCompanion toCompanion(bool nullToAbsent) {
    return AdminTablesCompanion(
      chatId: Value(chatId),
      userId: Value(userId),
    );
  }

  factory AdminTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AdminTable(
      chatId: serializer.fromJson<String>(json['chatId']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'chatId': serializer.toJson<String>(chatId),
      'userId': serializer.toJson<int>(userId),
    };
  }

  AdminTable copyWith({String? chatId, int? userId}) => AdminTable(
        chatId: chatId ?? this.chatId,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('AdminTable(')
          ..write('chatId: $chatId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(chatId.hashCode, userId.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdminTable &&
          other.chatId == this.chatId &&
          other.userId == this.userId);
}

class AdminTablesCompanion extends UpdateCompanion<AdminTable> {
  final Value<String> chatId;
  final Value<int> userId;
  const AdminTablesCompanion({
    this.chatId = const Value.absent(),
    this.userId = const Value.absent(),
  });
  AdminTablesCompanion.insert({
    required String chatId,
    required int userId,
  })  : chatId = Value(chatId),
        userId = Value(userId);
  static Insertable<AdminTable> custom({
    Expression<String>? chatId,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (chatId != null) 'chat_id': chatId,
      if (userId != null) 'user_id': userId,
    });
  }

  AdminTablesCompanion copyWith({Value<String>? chatId, Value<int>? userId}) {
    return AdminTablesCompanion(
      chatId: chatId ?? this.chatId,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (chatId.present) {
      map['chat_id'] = Variable<String>(chatId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdminTablesCompanion(')
          ..write('chatId: $chatId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $AdminTablesTable extends AdminTables
    with TableInfo<$AdminTablesTable, AdminTable> {
  final GeneratedDatabase _db;
  final String? _alias;
  $AdminTablesTable(this._db, [this._alias]);
  final VerificationMeta _chatIdMeta = const VerificationMeta('chatId');
  late final GeneratedColumn<String?> chatId = GeneratedColumn<String?>(
      'chat_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [chatId, userId];
  @override
  String get aliasedName => _alias ?? 'admin_tables';
  @override
  String get actualTableName => 'admin_tables';
  @override
  VerificationContext validateIntegrity(Insertable<AdminTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('chat_id')) {
      context.handle(_chatIdMeta,
          chatId.isAcceptableOrUnknown(data['chat_id']!, _chatIdMeta));
    } else if (isInserting) {
      context.missing(_chatIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  AdminTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AdminTable.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AdminTablesTable createAlias(String alias) {
    return $AdminTablesTable(_db, alias);
  }
}

class ParticipantTable extends DataClass
    implements Insertable<ParticipantTable> {
  final String chatId;
  final int userId;
  ParticipantTable({required this.chatId, required this.userId});
  factory ParticipantTable.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ParticipantTable(
      chatId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_id'])!,
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['chat_id'] = Variable<String>(chatId);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  ParticipantTablesCompanion toCompanion(bool nullToAbsent) {
    return ParticipantTablesCompanion(
      chatId: Value(chatId),
      userId: Value(userId),
    );
  }

  factory ParticipantTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ParticipantTable(
      chatId: serializer.fromJson<String>(json['chatId']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'chatId': serializer.toJson<String>(chatId),
      'userId': serializer.toJson<int>(userId),
    };
  }

  ParticipantTable copyWith({String? chatId, int? userId}) => ParticipantTable(
        chatId: chatId ?? this.chatId,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('ParticipantTable(')
          ..write('chatId: $chatId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(chatId.hashCode, userId.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParticipantTable &&
          other.chatId == this.chatId &&
          other.userId == this.userId);
}

class ParticipantTablesCompanion extends UpdateCompanion<ParticipantTable> {
  final Value<String> chatId;
  final Value<int> userId;
  const ParticipantTablesCompanion({
    this.chatId = const Value.absent(),
    this.userId = const Value.absent(),
  });
  ParticipantTablesCompanion.insert({
    required String chatId,
    required int userId,
  })  : chatId = Value(chatId),
        userId = Value(userId);
  static Insertable<ParticipantTable> custom({
    Expression<String>? chatId,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (chatId != null) 'chat_id': chatId,
      if (userId != null) 'user_id': userId,
    });
  }

  ParticipantTablesCompanion copyWith(
      {Value<String>? chatId, Value<int>? userId}) {
    return ParticipantTablesCompanion(
      chatId: chatId ?? this.chatId,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (chatId.present) {
      map['chat_id'] = Variable<String>(chatId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParticipantTablesCompanion(')
          ..write('chatId: $chatId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $ParticipantTablesTable extends ParticipantTables
    with TableInfo<$ParticipantTablesTable, ParticipantTable> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ParticipantTablesTable(this._db, [this._alias]);
  final VerificationMeta _chatIdMeta = const VerificationMeta('chatId');
  late final GeneratedColumn<String?> chatId = GeneratedColumn<String?>(
      'chat_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [chatId, userId];
  @override
  String get aliasedName => _alias ?? 'participant_tables';
  @override
  String get actualTableName => 'participant_tables';
  @override
  VerificationContext validateIntegrity(Insertable<ParticipantTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('chat_id')) {
      context.handle(_chatIdMeta,
          chatId.isAcceptableOrUnknown(data['chat_id']!, _chatIdMeta));
    } else if (isInserting) {
      context.missing(_chatIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ParticipantTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ParticipantTable.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ParticipantTablesTable createAlias(String alias) {
    return $ParticipantTablesTable(_db, alias);
  }
}

class ChannelTable extends DataClass implements Insertable<ChannelTable> {
  final String id;
  final PayloadType payloadType;
  final DateTime? createdAt;
  final bool needAck;
  final String from;
  final String to;
  final String sequence;
  final MessageType messageType;
  ChannelTable(
      {required this.id,
      required this.payloadType,
      this.createdAt,
      required this.needAck,
      required this.from,
      required this.to,
      required this.sequence,
      required this.messageType});
  factory ChannelTable.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ChannelTable(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      payloadType: $ChannelTablesTable.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}payload_type']))!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      needAck: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}need_ack'])!,
      from: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}from'])!,
      to: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}to'])!,
      sequence: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sequence'])!,
      messageType: $ChannelTablesTable.$converter1.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}message_type']))!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      final converter = $ChannelTablesTable.$converter0;
      map['payload_type'] = Variable<int>(converter.mapToSql(payloadType)!);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime?>(createdAt);
    }
    map['need_ack'] = Variable<bool>(needAck);
    map['from'] = Variable<String>(from);
    map['to'] = Variable<String>(to);
    map['sequence'] = Variable<String>(sequence);
    {
      final converter = $ChannelTablesTable.$converter1;
      map['message_type'] = Variable<int>(converter.mapToSql(messageType)!);
    }
    return map;
  }

  ChannelTablesCompanion toCompanion(bool nullToAbsent) {
    return ChannelTablesCompanion(
      id: Value(id),
      payloadType: Value(payloadType),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      needAck: Value(needAck),
      from: Value(from),
      to: Value(to),
      sequence: Value(sequence),
      messageType: Value(messageType),
    );
  }

  factory ChannelTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ChannelTable(
      id: serializer.fromJson<String>(json['id']),
      payloadType: serializer.fromJson<PayloadType>(json['payloadType']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      needAck: serializer.fromJson<bool>(json['needAck']),
      from: serializer.fromJson<String>(json['from']),
      to: serializer.fromJson<String>(json['to']),
      sequence: serializer.fromJson<String>(json['sequence']),
      messageType: serializer.fromJson<MessageType>(json['messageType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'payloadType': serializer.toJson<PayloadType>(payloadType),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'needAck': serializer.toJson<bool>(needAck),
      'from': serializer.toJson<String>(from),
      'to': serializer.toJson<String>(to),
      'sequence': serializer.toJson<String>(sequence),
      'messageType': serializer.toJson<MessageType>(messageType),
    };
  }

  ChannelTable copyWith(
          {String? id,
          PayloadType? payloadType,
          DateTime? createdAt,
          bool? needAck,
          String? from,
          String? to,
          String? sequence,
          MessageType? messageType}) =>
      ChannelTable(
        id: id ?? this.id,
        payloadType: payloadType ?? this.payloadType,
        createdAt: createdAt ?? this.createdAt,
        needAck: needAck ?? this.needAck,
        from: from ?? this.from,
        to: to ?? this.to,
        sequence: sequence ?? this.sequence,
        messageType: messageType ?? this.messageType,
      );
  @override
  String toString() {
    return (StringBuffer('ChannelTable(')
          ..write('id: $id, ')
          ..write('payloadType: $payloadType, ')
          ..write('createdAt: $createdAt, ')
          ..write('needAck: $needAck, ')
          ..write('from: $from, ')
          ..write('to: $to, ')
          ..write('sequence: $sequence, ')
          ..write('messageType: $messageType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          payloadType.hashCode,
          $mrjc(
              createdAt.hashCode,
              $mrjc(
                  needAck.hashCode,
                  $mrjc(
                      from.hashCode,
                      $mrjc(to.hashCode,
                          $mrjc(sequence.hashCode, messageType.hashCode))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChannelTable &&
          other.id == this.id &&
          other.payloadType == this.payloadType &&
          other.createdAt == this.createdAt &&
          other.needAck == this.needAck &&
          other.from == this.from &&
          other.to == this.to &&
          other.sequence == this.sequence &&
          other.messageType == this.messageType);
}

class ChannelTablesCompanion extends UpdateCompanion<ChannelTable> {
  final Value<String> id;
  final Value<PayloadType> payloadType;
  final Value<DateTime?> createdAt;
  final Value<bool> needAck;
  final Value<String> from;
  final Value<String> to;
  final Value<String> sequence;
  final Value<MessageType> messageType;
  const ChannelTablesCompanion({
    this.id = const Value.absent(),
    this.payloadType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.needAck = const Value.absent(),
    this.from = const Value.absent(),
    this.to = const Value.absent(),
    this.sequence = const Value.absent(),
    this.messageType = const Value.absent(),
  });
  ChannelTablesCompanion.insert({
    required String id,
    required PayloadType payloadType,
    this.createdAt = const Value.absent(),
    required bool needAck,
    required String from,
    required String to,
    required String sequence,
    required MessageType messageType,
  })  : id = Value(id),
        payloadType = Value(payloadType),
        needAck = Value(needAck),
        from = Value(from),
        to = Value(to),
        sequence = Value(sequence),
        messageType = Value(messageType);
  static Insertable<ChannelTable> custom({
    Expression<String>? id,
    Expression<PayloadType>? payloadType,
    Expression<DateTime?>? createdAt,
    Expression<bool>? needAck,
    Expression<String>? from,
    Expression<String>? to,
    Expression<String>? sequence,
    Expression<MessageType>? messageType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (payloadType != null) 'payload_type': payloadType,
      if (createdAt != null) 'created_at': createdAt,
      if (needAck != null) 'need_ack': needAck,
      if (from != null) 'from': from,
      if (to != null) 'to': to,
      if (sequence != null) 'sequence': sequence,
      if (messageType != null) 'message_type': messageType,
    });
  }

  ChannelTablesCompanion copyWith(
      {Value<String>? id,
      Value<PayloadType>? payloadType,
      Value<DateTime?>? createdAt,
      Value<bool>? needAck,
      Value<String>? from,
      Value<String>? to,
      Value<String>? sequence,
      Value<MessageType>? messageType}) {
    return ChannelTablesCompanion(
      id: id ?? this.id,
      payloadType: payloadType ?? this.payloadType,
      createdAt: createdAt ?? this.createdAt,
      needAck: needAck ?? this.needAck,
      from: from ?? this.from,
      to: to ?? this.to,
      sequence: sequence ?? this.sequence,
      messageType: messageType ?? this.messageType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (payloadType.present) {
      final converter = $ChannelTablesTable.$converter0;
      map['payload_type'] =
          Variable<int>(converter.mapToSql(payloadType.value)!);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime?>(createdAt.value);
    }
    if (needAck.present) {
      map['need_ack'] = Variable<bool>(needAck.value);
    }
    if (from.present) {
      map['from'] = Variable<String>(from.value);
    }
    if (to.present) {
      map['to'] = Variable<String>(to.value);
    }
    if (sequence.present) {
      map['sequence'] = Variable<String>(sequence.value);
    }
    if (messageType.present) {
      final converter = $ChannelTablesTable.$converter1;
      map['message_type'] =
          Variable<int>(converter.mapToSql(messageType.value)!);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChannelTablesCompanion(')
          ..write('id: $id, ')
          ..write('payloadType: $payloadType, ')
          ..write('createdAt: $createdAt, ')
          ..write('needAck: $needAck, ')
          ..write('from: $from, ')
          ..write('to: $to, ')
          ..write('sequence: $sequence, ')
          ..write('messageType: $messageType')
          ..write(')'))
        .toString();
  }
}

class $ChannelTablesTable extends ChannelTables
    with TableInfo<$ChannelTablesTable, ChannelTable> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ChannelTablesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _payloadTypeMeta =
      const VerificationMeta('payloadType');
  late final GeneratedColumnWithTypeConverter<PayloadType, int?> payloadType =
      GeneratedColumn<int?>('payload_type', aliasedName, false,
              typeName: 'INTEGER', requiredDuringInsert: true)
          .withConverter<PayloadType>($ChannelTablesTable.$converter0);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue: Constant(new DateTime.now()));
  final VerificationMeta _needAckMeta = const VerificationMeta('needAck');
  late final GeneratedColumn<bool?> needAck = GeneratedColumn<bool?>(
      'need_ack', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (need_ack IN (0, 1))');
  final VerificationMeta _fromMeta = const VerificationMeta('from');
  late final GeneratedColumn<String?> from = GeneratedColumn<String?>(
      'from', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _toMeta = const VerificationMeta('to');
  late final GeneratedColumn<String?> to = GeneratedColumn<String?>(
      'to', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _sequenceMeta = const VerificationMeta('sequence');
  late final GeneratedColumn<String?> sequence = GeneratedColumn<String?>(
      'sequence', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _messageTypeMeta =
      const VerificationMeta('messageType');
  late final GeneratedColumnWithTypeConverter<MessageType, int?> messageType =
      GeneratedColumn<int?>('message_type', aliasedName, false,
              typeName: 'INTEGER', requiredDuringInsert: true)
          .withConverter<MessageType>($ChannelTablesTable.$converter1);
  @override
  List<GeneratedColumn> get $columns =>
      [id, payloadType, createdAt, needAck, from, to, sequence, messageType];
  @override
  String get aliasedName => _alias ?? 'channel_tables';
  @override
  String get actualTableName => 'channel_tables';
  @override
  VerificationContext validateIntegrity(Insertable<ChannelTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    context.handle(_payloadTypeMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('need_ack')) {
      context.handle(_needAckMeta,
          needAck.isAcceptableOrUnknown(data['need_ack']!, _needAckMeta));
    } else if (isInserting) {
      context.missing(_needAckMeta);
    }
    if (data.containsKey('from')) {
      context.handle(
          _fromMeta, from.isAcceptableOrUnknown(data['from']!, _fromMeta));
    } else if (isInserting) {
      context.missing(_fromMeta);
    }
    if (data.containsKey('to')) {
      context.handle(_toMeta, to.isAcceptableOrUnknown(data['to']!, _toMeta));
    } else if (isInserting) {
      context.missing(_toMeta);
    }
    if (data.containsKey('sequence')) {
      context.handle(_sequenceMeta,
          sequence.isAcceptableOrUnknown(data['sequence']!, _sequenceMeta));
    } else if (isInserting) {
      context.missing(_sequenceMeta);
    }
    context.handle(_messageTypeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ChannelTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ChannelTable.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ChannelTablesTable createAlias(String alias) {
    return $ChannelTablesTable(_db, alias);
  }

  static TypeConverter<PayloadType, int> $converter0 =
      const EnumIndexConverter<PayloadType>(PayloadType.values);
  static TypeConverter<MessageType, int> $converter1 =
      const EnumIndexConverter<MessageType>(MessageType.values);
}

abstract class _$ChatDatabase extends GeneratedDatabase {
  _$ChatDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ChatTablesTable chatTables = $ChatTablesTable(this);
  late final $MessageTablesTable messageTables = $MessageTablesTable(this);
  late final $UserTablesTable userTables = $UserTablesTable(this);
  late final $AdminTablesTable adminTables = $AdminTablesTable(this);
  late final $ParticipantTablesTable participantTables =
      $ParticipantTablesTable(this);
  late final $ChannelTablesTable channelTables = $ChannelTablesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        chatTables,
        messageTables,
        userTables,
        adminTables,
        participantTables,
        channelTables
      ];
}
