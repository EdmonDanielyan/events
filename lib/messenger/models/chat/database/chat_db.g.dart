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
  final DateTime updatedAt;
  final bool? notificationsOn;
  final bool? unreadCounterOn;
  final bool? deleted;
  final int? lastMessageSeq;
  ChatTable(
      {required this.id,
      required this.name,
      required this.description,
      required this.avatar,
      required this.ownerId,
      this.participantId,
      required this.updatedAt,
      this.notificationsOn,
      this.unreadCounterOn,
      this.deleted,
      this.lastMessageSeq});
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
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      notificationsOn: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}notifications_on']),
      unreadCounterOn: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}unread_counter_on']),
      deleted: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted']),
      lastMessageSeq: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_message_seq']),
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
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || notificationsOn != null) {
      map['notifications_on'] = Variable<bool?>(notificationsOn);
    }
    if (!nullToAbsent || unreadCounterOn != null) {
      map['unread_counter_on'] = Variable<bool?>(unreadCounterOn);
    }
    if (!nullToAbsent || deleted != null) {
      map['deleted'] = Variable<bool?>(deleted);
    }
    if (!nullToAbsent || lastMessageSeq != null) {
      map['last_message_seq'] = Variable<int?>(lastMessageSeq);
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
      updatedAt: Value(updatedAt),
      notificationsOn: notificationsOn == null && nullToAbsent
          ? const Value.absent()
          : Value(notificationsOn),
      unreadCounterOn: unreadCounterOn == null && nullToAbsent
          ? const Value.absent()
          : Value(unreadCounterOn),
      deleted: deleted == null && nullToAbsent
          ? const Value.absent()
          : Value(deleted),
      lastMessageSeq: lastMessageSeq == null && nullToAbsent
          ? const Value.absent()
          : Value(lastMessageSeq),
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
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      notificationsOn: serializer.fromJson<bool?>(json['notificationsOn']),
      unreadCounterOn: serializer.fromJson<bool?>(json['unreadCounterOn']),
      deleted: serializer.fromJson<bool?>(json['deleted']),
      lastMessageSeq: serializer.fromJson<int?>(json['lastMessageSeq']),
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
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'notificationsOn': serializer.toJson<bool?>(notificationsOn),
      'unreadCounterOn': serializer.toJson<bool?>(unreadCounterOn),
      'deleted': serializer.toJson<bool?>(deleted),
      'lastMessageSeq': serializer.toJson<int?>(lastMessageSeq),
    };
  }

  ChatTable copyWith(
          {String? id,
          String? name,
          String? description,
          String? avatar,
          int? ownerId,
          int? participantId,
          DateTime? updatedAt,
          bool? notificationsOn,
          bool? unreadCounterOn,
          bool? deleted,
          int? lastMessageSeq}) =>
      ChatTable(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        avatar: avatar ?? this.avatar,
        ownerId: ownerId ?? this.ownerId,
        participantId: participantId ?? this.participantId,
        updatedAt: updatedAt ?? this.updatedAt,
        notificationsOn: notificationsOn ?? this.notificationsOn,
        unreadCounterOn: unreadCounterOn ?? this.unreadCounterOn,
        deleted: deleted ?? this.deleted,
        lastMessageSeq: lastMessageSeq ?? this.lastMessageSeq,
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
          ..write('updatedAt: $updatedAt, ')
          ..write('notificationsOn: $notificationsOn, ')
          ..write('unreadCounterOn: $unreadCounterOn, ')
          ..write('deleted: $deleted, ')
          ..write('lastMessageSeq: $lastMessageSeq')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      description,
      avatar,
      ownerId,
      participantId,
      updatedAt,
      notificationsOn,
      unreadCounterOn,
      deleted,
      lastMessageSeq);
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
          other.updatedAt == this.updatedAt &&
          other.notificationsOn == this.notificationsOn &&
          other.unreadCounterOn == this.unreadCounterOn &&
          other.deleted == this.deleted &&
          other.lastMessageSeq == this.lastMessageSeq);
}

class ChatTablesCompanion extends UpdateCompanion<ChatTable> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> avatar;
  final Value<int> ownerId;
  final Value<int?> participantId;
  final Value<DateTime> updatedAt;
  final Value<bool?> notificationsOn;
  final Value<bool?> unreadCounterOn;
  final Value<bool?> deleted;
  final Value<int?> lastMessageSeq;
  const ChatTablesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.avatar = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.participantId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.notificationsOn = const Value.absent(),
    this.unreadCounterOn = const Value.absent(),
    this.deleted = const Value.absent(),
    this.lastMessageSeq = const Value.absent(),
  });
  ChatTablesCompanion.insert({
    required String id,
    required String name,
    required String description,
    required String avatar,
    required int ownerId,
    this.participantId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.notificationsOn = const Value.absent(),
    this.unreadCounterOn = const Value.absent(),
    this.deleted = const Value.absent(),
    this.lastMessageSeq = const Value.absent(),
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
    Expression<DateTime>? updatedAt,
    Expression<bool?>? notificationsOn,
    Expression<bool?>? unreadCounterOn,
    Expression<bool?>? deleted,
    Expression<int?>? lastMessageSeq,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (avatar != null) 'avatar': avatar,
      if (ownerId != null) 'owner_id': ownerId,
      if (participantId != null) 'participant_id': participantId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (notificationsOn != null) 'notifications_on': notificationsOn,
      if (unreadCounterOn != null) 'unread_counter_on': unreadCounterOn,
      if (deleted != null) 'deleted': deleted,
      if (lastMessageSeq != null) 'last_message_seq': lastMessageSeq,
    });
  }

  ChatTablesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? description,
      Value<String>? avatar,
      Value<int>? ownerId,
      Value<int?>? participantId,
      Value<DateTime>? updatedAt,
      Value<bool?>? notificationsOn,
      Value<bool?>? unreadCounterOn,
      Value<bool?>? deleted,
      Value<int?>? lastMessageSeq}) {
    return ChatTablesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      avatar: avatar ?? this.avatar,
      ownerId: ownerId ?? this.ownerId,
      participantId: participantId ?? this.participantId,
      updatedAt: updatedAt ?? this.updatedAt,
      notificationsOn: notificationsOn ?? this.notificationsOn,
      unreadCounterOn: unreadCounterOn ?? this.unreadCounterOn,
      deleted: deleted ?? this.deleted,
      lastMessageSeq: lastMessageSeq ?? this.lastMessageSeq,
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
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (notificationsOn.present) {
      map['notifications_on'] = Variable<bool?>(notificationsOn.value);
    }
    if (unreadCounterOn.present) {
      map['unread_counter_on'] = Variable<bool?>(unreadCounterOn.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool?>(deleted.value);
    }
    if (lastMessageSeq.present) {
      map['last_message_seq'] = Variable<int?>(lastMessageSeq.value);
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
          ..write('updatedAt: $updatedAt, ')
          ..write('notificationsOn: $notificationsOn, ')
          ..write('unreadCounterOn: $unreadCounterOn, ')
          ..write('deleted: $deleted, ')
          ..write('lastMessageSeq: $lastMessageSeq')
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
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 150),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String?> avatar = GeneratedColumn<String?>(
      'avatar', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _ownerIdMeta = const VerificationMeta('ownerId');
  @override
  late final GeneratedColumn<int?> ownerId = GeneratedColumn<int?>(
      'owner_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _participantIdMeta =
      const VerificationMeta('participantId');
  @override
  late final GeneratedColumn<int?> participantId = GeneratedColumn<int?>(
      'participant_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now().toUtc()));
  final VerificationMeta _notificationsOnMeta =
      const VerificationMeta('notificationsOn');
  @override
  late final GeneratedColumn<bool?> notificationsOn = GeneratedColumn<bool?>(
      'notifications_on', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (notifications_on IN (0, 1))',
      defaultValue: Constant(true));
  final VerificationMeta _unreadCounterOnMeta =
      const VerificationMeta('unreadCounterOn');
  @override
  late final GeneratedColumn<bool?> unreadCounterOn = GeneratedColumn<bool?>(
      'unread_counter_on', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (unread_counter_on IN (0, 1))',
      defaultValue: Constant(true));
  final VerificationMeta _deletedMeta = const VerificationMeta('deleted');
  @override
  late final GeneratedColumn<bool?> deleted = GeneratedColumn<bool?>(
      'deleted', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (deleted IN (0, 1))',
      defaultValue: Constant(false));
  final VerificationMeta _lastMessageSeqMeta =
      const VerificationMeta('lastMessageSeq');
  @override
  late final GeneratedColumn<int?> lastMessageSeq = GeneratedColumn<int?>(
      'last_message_seq', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        avatar,
        ownerId,
        participantId,
        updatedAt,
        notificationsOn,
        unreadCounterOn,
        deleted,
        lastMessageSeq
      ];
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
    if (data.containsKey('notifications_on')) {
      context.handle(
          _notificationsOnMeta,
          notificationsOn.isAcceptableOrUnknown(
              data['notifications_on']!, _notificationsOnMeta));
    }
    if (data.containsKey('unread_counter_on')) {
      context.handle(
          _unreadCounterOnMeta,
          unreadCounterOn.isAcceptableOrUnknown(
              data['unread_counter_on']!, _unreadCounterOnMeta));
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('last_message_seq')) {
      context.handle(
          _lastMessageSeqMeta,
          lastMessageSeq.isAcceptableOrUnknown(
              data['last_message_seq']!, _lastMessageSeqMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
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
  final int userId;
  final String chatId;
  final String message;
  final String? repliedMessageId;
  final MessageSentStatus sentStatus;
  final MessageActions actionsStatus;
  final bool read;
  final StoredMessageType type;
  final DateTime? timestamp;
  final int? sequence;
  MessageTable(
      {required this.id,
      required this.userId,
      required this.chatId,
      required this.message,
      this.repliedMessageId,
      required this.sentStatus,
      required this.actionsStatus,
      required this.read,
      required this.type,
      this.timestamp,
      this.sequence});
  factory MessageTable.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MessageTable(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      chatId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_id'])!,
      message: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}message'])!,
      repliedMessageId: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}replied_message_id']),
      sentStatus: $MessageTablesTable.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sent_status']))!,
      actionsStatus: $MessageTablesTable.$converter1.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}actions_status']))!,
      read: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}read'])!,
      type: $MessageTablesTable.$converter2.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type']))!,
      timestamp: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}timestamp']),
      sequence: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sequence']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<int>(userId);
    map['chat_id'] = Variable<String>(chatId);
    map['message'] = Variable<String>(message);
    if (!nullToAbsent || repliedMessageId != null) {
      map['replied_message_id'] = Variable<String?>(repliedMessageId);
    }
    {
      final converter = $MessageTablesTable.$converter0;
      map['sent_status'] = Variable<int>(converter.mapToSql(sentStatus)!);
    }
    {
      final converter = $MessageTablesTable.$converter1;
      map['actions_status'] = Variable<int>(converter.mapToSql(actionsStatus)!);
    }
    map['read'] = Variable<bool>(read);
    {
      final converter = $MessageTablesTable.$converter2;
      map['type'] = Variable<int>(converter.mapToSql(type)!);
    }
    if (!nullToAbsent || timestamp != null) {
      map['timestamp'] = Variable<DateTime?>(timestamp);
    }
    if (!nullToAbsent || sequence != null) {
      map['sequence'] = Variable<int?>(sequence);
    }
    return map;
  }

  MessageTablesCompanion toCompanion(bool nullToAbsent) {
    return MessageTablesCompanion(
      id: Value(id),
      userId: Value(userId),
      chatId: Value(chatId),
      message: Value(message),
      repliedMessageId: repliedMessageId == null && nullToAbsent
          ? const Value.absent()
          : Value(repliedMessageId),
      sentStatus: Value(sentStatus),
      actionsStatus: Value(actionsStatus),
      read: Value(read),
      type: Value(type),
      timestamp: timestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(timestamp),
      sequence: sequence == null && nullToAbsent
          ? const Value.absent()
          : Value(sequence),
    );
  }

  factory MessageTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MessageTable(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      chatId: serializer.fromJson<String>(json['chatId']),
      message: serializer.fromJson<String>(json['message']),
      repliedMessageId: serializer.fromJson<String?>(json['repliedMessageId']),
      sentStatus: serializer.fromJson<MessageSentStatus>(json['sentStatus']),
      actionsStatus: serializer.fromJson<MessageActions>(json['actionsStatus']),
      read: serializer.fromJson<bool>(json['read']),
      type: serializer.fromJson<StoredMessageType>(json['type']),
      timestamp: serializer.fromJson<DateTime?>(json['timestamp']),
      sequence: serializer.fromJson<int?>(json['sequence']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<int>(userId),
      'chatId': serializer.toJson<String>(chatId),
      'message': serializer.toJson<String>(message),
      'repliedMessageId': serializer.toJson<String?>(repliedMessageId),
      'sentStatus': serializer.toJson<MessageSentStatus>(sentStatus),
      'actionsStatus': serializer.toJson<MessageActions>(actionsStatus),
      'read': serializer.toJson<bool>(read),
      'type': serializer.toJson<StoredMessageType>(type),
      'timestamp': serializer.toJson<DateTime?>(timestamp),
      'sequence': serializer.toJson<int?>(sequence),
    };
  }

  MessageTable copyWith(
          {String? id,
          int? userId,
          String? chatId,
          String? message,
          String? repliedMessageId,
          MessageSentStatus? sentStatus,
          MessageActions? actionsStatus,
          bool? read,
          StoredMessageType? type,
          DateTime? timestamp,
          int? sequence}) =>
      MessageTable(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        chatId: chatId ?? this.chatId,
        message: message ?? this.message,
        repliedMessageId: repliedMessageId ?? this.repliedMessageId,
        sentStatus: sentStatus ?? this.sentStatus,
        actionsStatus: actionsStatus ?? this.actionsStatus,
        read: read ?? this.read,
        type: type ?? this.type,
        timestamp: timestamp ?? this.timestamp,
        sequence: sequence ?? this.sequence,
      );
  @override
  String toString() {
    return (StringBuffer('MessageTable(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('chatId: $chatId, ')
          ..write('message: $message, ')
          ..write('repliedMessageId: $repliedMessageId, ')
          ..write('sentStatus: $sentStatus, ')
          ..write('actionsStatus: $actionsStatus, ')
          ..write('read: $read, ')
          ..write('type: $type, ')
          ..write('timestamp: $timestamp, ')
          ..write('sequence: $sequence')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, chatId, message, repliedMessageId,
      sentStatus, actionsStatus, read, type, timestamp, sequence);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessageTable &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.chatId == this.chatId &&
          other.message == this.message &&
          other.repliedMessageId == this.repliedMessageId &&
          other.sentStatus == this.sentStatus &&
          other.actionsStatus == this.actionsStatus &&
          other.read == this.read &&
          other.type == this.type &&
          other.timestamp == this.timestamp &&
          other.sequence == this.sequence);
}

class MessageTablesCompanion extends UpdateCompanion<MessageTable> {
  final Value<String> id;
  final Value<int> userId;
  final Value<String> chatId;
  final Value<String> message;
  final Value<String?> repliedMessageId;
  final Value<MessageSentStatus> sentStatus;
  final Value<MessageActions> actionsStatus;
  final Value<bool> read;
  final Value<StoredMessageType> type;
  final Value<DateTime?> timestamp;
  final Value<int?> sequence;
  const MessageTablesCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.chatId = const Value.absent(),
    this.message = const Value.absent(),
    this.repliedMessageId = const Value.absent(),
    this.sentStatus = const Value.absent(),
    this.actionsStatus = const Value.absent(),
    this.read = const Value.absent(),
    this.type = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.sequence = const Value.absent(),
  });
  MessageTablesCompanion.insert({
    required String id,
    required int userId,
    required String chatId,
    required String message,
    this.repliedMessageId = const Value.absent(),
    required MessageSentStatus sentStatus,
    required MessageActions actionsStatus,
    this.read = const Value.absent(),
    required StoredMessageType type,
    this.timestamp = const Value.absent(),
    this.sequence = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        chatId = Value(chatId),
        message = Value(message),
        sentStatus = Value(sentStatus),
        actionsStatus = Value(actionsStatus),
        type = Value(type);
  static Insertable<MessageTable> custom({
    Expression<String>? id,
    Expression<int>? userId,
    Expression<String>? chatId,
    Expression<String>? message,
    Expression<String?>? repliedMessageId,
    Expression<MessageSentStatus>? sentStatus,
    Expression<MessageActions>? actionsStatus,
    Expression<bool>? read,
    Expression<StoredMessageType>? type,
    Expression<DateTime?>? timestamp,
    Expression<int?>? sequence,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (chatId != null) 'chat_id': chatId,
      if (message != null) 'message': message,
      if (repliedMessageId != null) 'replied_message_id': repliedMessageId,
      if (sentStatus != null) 'sent_status': sentStatus,
      if (actionsStatus != null) 'actions_status': actionsStatus,
      if (read != null) 'read': read,
      if (type != null) 'type': type,
      if (timestamp != null) 'timestamp': timestamp,
      if (sequence != null) 'sequence': sequence,
    });
  }

  MessageTablesCompanion copyWith(
      {Value<String>? id,
      Value<int>? userId,
      Value<String>? chatId,
      Value<String>? message,
      Value<String?>? repliedMessageId,
      Value<MessageSentStatus>? sentStatus,
      Value<MessageActions>? actionsStatus,
      Value<bool>? read,
      Value<StoredMessageType>? type,
      Value<DateTime?>? timestamp,
      Value<int?>? sequence}) {
    return MessageTablesCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      chatId: chatId ?? this.chatId,
      message: message ?? this.message,
      repliedMessageId: repliedMessageId ?? this.repliedMessageId,
      sentStatus: sentStatus ?? this.sentStatus,
      actionsStatus: actionsStatus ?? this.actionsStatus,
      read: read ?? this.read,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      sequence: sequence ?? this.sequence,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (chatId.present) {
      map['chat_id'] = Variable<String>(chatId.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (repliedMessageId.present) {
      map['replied_message_id'] = Variable<String?>(repliedMessageId.value);
    }
    if (sentStatus.present) {
      final converter = $MessageTablesTable.$converter0;
      map['sent_status'] = Variable<int>(converter.mapToSql(sentStatus.value)!);
    }
    if (actionsStatus.present) {
      final converter = $MessageTablesTable.$converter1;
      map['actions_status'] =
          Variable<int>(converter.mapToSql(actionsStatus.value)!);
    }
    if (read.present) {
      map['read'] = Variable<bool>(read.value);
    }
    if (type.present) {
      final converter = $MessageTablesTable.$converter2;
      map['type'] = Variable<int>(converter.mapToSql(type.value)!);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime?>(timestamp.value);
    }
    if (sequence.present) {
      map['sequence'] = Variable<int?>(sequence.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessageTablesCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('chatId: $chatId, ')
          ..write('message: $message, ')
          ..write('repliedMessageId: $repliedMessageId, ')
          ..write('sentStatus: $sentStatus, ')
          ..write('actionsStatus: $actionsStatus, ')
          ..write('read: $read, ')
          ..write('type: $type, ')
          ..write('timestamp: $timestamp, ')
          ..write('sequence: $sequence')
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
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _chatIdMeta = const VerificationMeta('chatId');
  @override
  late final GeneratedColumn<String?> chatId = GeneratedColumn<String?>(
      'chat_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _messageMeta = const VerificationMeta('message');
  @override
  late final GeneratedColumn<String?> message = GeneratedColumn<String?>(
      'message', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _repliedMessageIdMeta =
      const VerificationMeta('repliedMessageId');
  @override
  late final GeneratedColumn<String?> repliedMessageId =
      GeneratedColumn<String?>('replied_message_id', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _sentStatusMeta = const VerificationMeta('sentStatus');
  @override
  late final GeneratedColumnWithTypeConverter<MessageSentStatus, int?>
      sentStatus = GeneratedColumn<int?>('sent_status', aliasedName, false,
              type: const IntType(), requiredDuringInsert: true)
          .withConverter<MessageSentStatus>($MessageTablesTable.$converter0);
  final VerificationMeta _actionsStatusMeta =
      const VerificationMeta('actionsStatus');
  @override
  late final GeneratedColumnWithTypeConverter<MessageActions, int?>
      actionsStatus = GeneratedColumn<int?>(
              'actions_status', aliasedName, false,
              type: const IntType(), requiredDuringInsert: true)
          .withConverter<MessageActions>($MessageTablesTable.$converter1);
  final VerificationMeta _readMeta = const VerificationMeta('read');
  @override
  late final GeneratedColumn<bool?> read = GeneratedColumn<bool?>(
      'read', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (read IN (0, 1))',
      defaultValue: Constant(false));
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<StoredMessageType, int?> type =
      GeneratedColumn<int?>('type', aliasedName, false,
              type: const IntType(), requiredDuringInsert: true)
          .withConverter<StoredMessageType>($MessageTablesTable.$converter2);
  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime?> timestamp = GeneratedColumn<DateTime?>(
      'timestamp', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: Constant(new DateTime.now()));
  final VerificationMeta _sequenceMeta = const VerificationMeta('sequence');
  @override
  late final GeneratedColumn<int?> sequence = GeneratedColumn<int?>(
      'sequence', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        chatId,
        message,
        repliedMessageId,
        sentStatus,
        actionsStatus,
        read,
        type,
        timestamp,
        sequence
      ];
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
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
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
    if (data.containsKey('replied_message_id')) {
      context.handle(
          _repliedMessageIdMeta,
          repliedMessageId.isAcceptableOrUnknown(
              data['replied_message_id']!, _repliedMessageIdMeta));
    }
    context.handle(_sentStatusMeta, const VerificationResult.success());
    context.handle(_actionsStatusMeta, const VerificationResult.success());
    if (data.containsKey('read')) {
      context.handle(
          _readMeta, read.isAcceptableOrUnknown(data['read']!, _readMeta));
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    }
    if (data.containsKey('sequence')) {
      context.handle(_sequenceMeta,
          sequence.isAcceptableOrUnknown(data['sequence']!, _sequenceMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, chatId};
  @override
  MessageTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MessageTable.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MessageTablesTable createAlias(String alias) {
    return $MessageTablesTable(_db, alias);
  }

  static TypeConverter<MessageSentStatus, int> $converter0 =
      const EnumIndexConverter<MessageSentStatus>(MessageSentStatus.values);
  static TypeConverter<MessageActions, int> $converter1 =
      const EnumIndexConverter<MessageActions>(MessageActions.values);
  static TypeConverter<StoredMessageType, int> $converter2 =
      const EnumIndexConverter<StoredMessageType>(StoredMessageType.values);
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
  int get hashCode => Object.hash(id, name, avatar);
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
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 150),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String?> avatar = GeneratedColumn<String?>(
      'avatar', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
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

class ParticipantTable extends DataClass
    implements Insertable<ParticipantTable> {
  final String chatId;
  final int userId;
  final bool admin;
  ParticipantTable(
      {required this.chatId, required this.userId, required this.admin});
  factory ParticipantTable.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ParticipantTable(
      chatId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}chat_id'])!,
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      admin: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}admin'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['chat_id'] = Variable<String>(chatId);
    map['user_id'] = Variable<int>(userId);
    map['admin'] = Variable<bool>(admin);
    return map;
  }

  ParticipantTablesCompanion toCompanion(bool nullToAbsent) {
    return ParticipantTablesCompanion(
      chatId: Value(chatId),
      userId: Value(userId),
      admin: Value(admin),
    );
  }

  factory ParticipantTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ParticipantTable(
      chatId: serializer.fromJson<String>(json['chatId']),
      userId: serializer.fromJson<int>(json['userId']),
      admin: serializer.fromJson<bool>(json['admin']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'chatId': serializer.toJson<String>(chatId),
      'userId': serializer.toJson<int>(userId),
      'admin': serializer.toJson<bool>(admin),
    };
  }

  ParticipantTable copyWith({String? chatId, int? userId, bool? admin}) =>
      ParticipantTable(
        chatId: chatId ?? this.chatId,
        userId: userId ?? this.userId,
        admin: admin ?? this.admin,
      );
  @override
  String toString() {
    return (StringBuffer('ParticipantTable(')
          ..write('chatId: $chatId, ')
          ..write('userId: $userId, ')
          ..write('admin: $admin')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(chatId, userId, admin);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParticipantTable &&
          other.chatId == this.chatId &&
          other.userId == this.userId &&
          other.admin == this.admin);
}

class ParticipantTablesCompanion extends UpdateCompanion<ParticipantTable> {
  final Value<String> chatId;
  final Value<int> userId;
  final Value<bool> admin;
  const ParticipantTablesCompanion({
    this.chatId = const Value.absent(),
    this.userId = const Value.absent(),
    this.admin = const Value.absent(),
  });
  ParticipantTablesCompanion.insert({
    required String chatId,
    required int userId,
    this.admin = const Value.absent(),
  })  : chatId = Value(chatId),
        userId = Value(userId);
  static Insertable<ParticipantTable> custom({
    Expression<String>? chatId,
    Expression<int>? userId,
    Expression<bool>? admin,
  }) {
    return RawValuesInsertable({
      if (chatId != null) 'chat_id': chatId,
      if (userId != null) 'user_id': userId,
      if (admin != null) 'admin': admin,
    });
  }

  ParticipantTablesCompanion copyWith(
      {Value<String>? chatId, Value<int>? userId, Value<bool>? admin}) {
    return ParticipantTablesCompanion(
      chatId: chatId ?? this.chatId,
      userId: userId ?? this.userId,
      admin: admin ?? this.admin,
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
    if (admin.present) {
      map['admin'] = Variable<bool>(admin.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParticipantTablesCompanion(')
          ..write('chatId: $chatId, ')
          ..write('userId: $userId, ')
          ..write('admin: $admin')
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
  @override
  late final GeneratedColumn<String?> chatId = GeneratedColumn<String?>(
      'chat_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _adminMeta = const VerificationMeta('admin');
  @override
  late final GeneratedColumn<bool?> admin = GeneratedColumn<bool?>(
      'admin', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (admin IN (0, 1))',
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [chatId, userId, admin];
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
    if (data.containsKey('admin')) {
      context.handle(
          _adminMeta, admin.isAcceptableOrUnknown(data['admin']!, _adminMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {chatId, userId};
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
  final int sequence;
  ChannelTable({required this.id, required this.sequence});
  factory ChannelTable.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ChannelTable(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      sequence: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sequence'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['sequence'] = Variable<int>(sequence);
    return map;
  }

  ChannelTablesCompanion toCompanion(bool nullToAbsent) {
    return ChannelTablesCompanion(
      id: Value(id),
      sequence: Value(sequence),
    );
  }

  factory ChannelTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ChannelTable(
      id: serializer.fromJson<String>(json['id']),
      sequence: serializer.fromJson<int>(json['sequence']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sequence': serializer.toJson<int>(sequence),
    };
  }

  ChannelTable copyWith({String? id, int? sequence}) => ChannelTable(
        id: id ?? this.id,
        sequence: sequence ?? this.sequence,
      );
  @override
  String toString() {
    return (StringBuffer('ChannelTable(')
          ..write('id: $id, ')
          ..write('sequence: $sequence')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sequence);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChannelTable &&
          other.id == this.id &&
          other.sequence == this.sequence);
}

class ChannelTablesCompanion extends UpdateCompanion<ChannelTable> {
  final Value<String> id;
  final Value<int> sequence;
  const ChannelTablesCompanion({
    this.id = const Value.absent(),
    this.sequence = const Value.absent(),
  });
  ChannelTablesCompanion.insert({
    required String id,
    this.sequence = const Value.absent(),
  }) : id = Value(id);
  static Insertable<ChannelTable> custom({
    Expression<String>? id,
    Expression<int>? sequence,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sequence != null) 'sequence': sequence,
    });
  }

  ChannelTablesCompanion copyWith({Value<String>? id, Value<int>? sequence}) {
    return ChannelTablesCompanion(
      id: id ?? this.id,
      sequence: sequence ?? this.sequence,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sequence.present) {
      map['sequence'] = Variable<int>(sequence.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChannelTablesCompanion(')
          ..write('id: $id, ')
          ..write('sequence: $sequence')
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
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _sequenceMeta = const VerificationMeta('sequence');
  @override
  late final GeneratedColumn<int?> sequence = GeneratedColumn<int?>(
      'sequence', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: Constant(0));
  @override
  List<GeneratedColumn> get $columns => [id, sequence];
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
    if (data.containsKey('sequence')) {
      context.handle(_sequenceMeta,
          sequence.isAcceptableOrUnknown(data['sequence']!, _sequenceMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChannelTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ChannelTable.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ChannelTablesTable createAlias(String alias) {
    return $ChannelTablesTable(_db, alias);
  }
}

abstract class _$ChatDatabase extends GeneratedDatabase {
  _$ChatDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ChatTablesTable chatTables = $ChatTablesTable(this);
  late final $MessageTablesTable messageTables = $MessageTablesTable(this);
  late final $UserTablesTable userTables = $UserTablesTable(this);
  late final $ParticipantTablesTable participantTables =
      $ParticipantTablesTable(this);
  late final $ChannelTablesTable channelTables = $ChannelTablesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [chatTables, messageTables, userTables, participantTables, channelTables];
}
