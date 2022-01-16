// import 'dart:io';
// import 'dart:ui';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:get_it/get_it.dart';
// import 'package:ink_mobile/models/chat/database/chat_db.dart';
// import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
// import 'package:ink_mobile/models/token.dart';
// import 'package:ink_mobile/providers/certificate_reader.dart';
// import 'package:ink_mobile/providers/lock_app.dart';
// import 'package:mocktail/mocktail.dart';

// import 'fakes.dart';

// class MockChatDatabase extends Mock implements ChatDatabase {}

// class MockCertificateReader extends Mock implements CertificateReader {}

// class MockLockApp extends Mock implements LockApp {}

// class FakeDatabaseData {
//   final Map<int, UserTable> users = {};
//   final Map<String, ChatTable> chats = {};
//   final List<ParticipantTable> participates = [];
//   final List<ChannelTable> channels = [];
//   final List<MessageTable> messages = [];

//   @override
//   String toString() {
//     return '''
//     Summary records count: 
//     Users(${users.length}) 
//     Participates(${participates.length})
//     Chats(${chats.length})
//     Channels(${channels.length})
//     Messages(${messages.length})
//     ''';
//   }
// }

// class MockSecureStorage extends SecureStorage {
//   Map<String, String> secureStorageData = {};

//   Future<String?> read(String key) async {
//     return Future.value(secureStorageData[key]);
//   }

//   Future<void> deleteAll() {
//     secureStorageData.clear();
//     return Future.value();
//   }

//   Future<void> write({required String key, required String value}) {
//     secureStorageData[key] = value;
//     return Future.value();
//   }

//   Future<bool> containsKey(String key) {
//     return Future.value(secureStorageData.containsKey(key));
//   }
// }

// MockChatDatabase mockChatDatabase(GetIt sl, FakeDatabaseData databaseData) {
//   var chatDataBase = MockChatDatabase();
//   when(() => chatDataBase.selectChatById(any()))
//       .thenAnswer((realInvocation) async {
//     var chatId = realInvocation.positionalArguments[0] as String;
//     return databaseData.chats[chatId];
//   });

//   when(() => chatDataBase.insertParticipant(any()))
//       .thenAnswer((realInvocation) async {
//     databaseData.participates
//         .add(realInvocation.positionalArguments[0] as ParticipantTable);
//     return 1;
//   });

//   when(() => chatDataBase.updateMessageById(any(), any()))
//       .thenAnswer((realInvocation) async {
//     var messageId = realInvocation.positionalArguments[0];
//     var message = realInvocation.positionalArguments[1] as MessageTable;
//     databaseData.messages.removeWhere((element) => element.id == messageId);
//     databaseData.messages.add(message);
//     return 1;
//   });

//   when(() => chatDataBase.selectParticipantById(any(), any()))
//       .thenAnswer((realInvocation) async {
//     var userId = realInvocation.positionalArguments[0] as int?;
//     var chatId = realInvocation.positionalArguments[1] as String?;
//     var result = databaseData.participates
//         .where(
//             (element) => element.chatId == chatId && element.userId == userId)
//         .toList();
//     return result.isNotEmpty ? result.first : null;
//   });

//   when(() => chatDataBase.selectUserById(any()))
//       .thenAnswer((realInvocation) => Future.value(null));

//   when(() => chatDataBase.insertChat(any())).thenAnswer((realInvocation) async {
//     var chat = realInvocation.positionalArguments[0] as ChatTable;
//     databaseData.chats[chat.id] = chat;
//     return 1;
//   });

//   when(() => chatDataBase.insertUser(any())).thenAnswer((realInvocation) async {
//     var userTable = realInvocation.positionalArguments[0] as UserTable;
//     databaseData.users[userTable.id] = userTable;
//     return 1;
//   });

//   when(() => chatDataBase.insertChannel(any()))
//       .thenAnswer((realInvocation) async {
//     var channel = realInvocation.positionalArguments[0] as ChannelTable;
//     databaseData.channels.add(channel);
//     return 1;
//   });

//   when(() => chatDataBase.getAllChannels())
//       .thenAnswer((realInvocation) async => databaseData.channels);
//   when(() => chatDataBase.getAllChats())
//       .thenAnswer((realInvocation) async => databaseData.chats.values.toList());
//   when(() => chatDataBase.getAllUsers())
//       .thenAnswer((realInvocation) async => databaseData.users.values.toList());
//   when(() => chatDataBase.getAllParticipants())
//       .thenAnswer((realInvocation) async => databaseData.participates);
//   when(() => chatDataBase.getAllMessages())
//       .thenAnswer((realInvocation) async => databaseData.messages);

//   when(() => chatDataBase.getChatMessages(any()))
//       .thenAnswer((realInvocation) async {
//     var chatId = realInvocation.positionalArguments[0] as String;
//     var where =
//         databaseData.messages.where((element) => element.chatId == chatId);
//     return where.map<MessageWithUser>((message) {
//       var user = databaseData.users[message.userId] ?? FakeUserTable();
//       return MessageWithUser(message: message, user: user);
//     }).toList();
//   });

//   //No unsent messages
//   when(() => chatDataBase.getUnsentMessages(any())).thenAnswer((_) async => []);

//   when(() => chatDataBase.insertMessage(any()))
//       .thenAnswer((realInvocation) async {
//     databaseData.messages
//         .add(realInvocation.positionalArguments[0] as MessageTable);
//     return 1;
//   });

//   when(() => chatDataBase.getChannelByChannelName(any()))
//       .thenAnswer((realInvocation) async {
//     var result = databaseData.channels.where((element) {
//       return element.id == realInvocation.positionalArguments[0];
//     }).toList();
//     return result.isNotEmpty ? result.first : null;
//   });
//   sl
//     ..unregister<ChatDatabase>()
//     ..registerSingleton<ChatDatabase>(chatDataBase);

//   return chatDataBase;
// }

// MockCertificateReader mockCertificateReader(GetIt sl, String certPath) {
//   var certificateReader = MockCertificateReader();

//   when(() => certificateReader.natsCertificateData).thenAnswer((invocation) {
//     return (File(sl<String>(instanceName: "natsCertificatePath")).readAsBytesSync());
//   });

//   when(() => certificateReader.apiCertificateData).thenAnswer((invocation) {
//     return (File(sl<String>(instanceName: "apiCertificatePath")).readAsBytesSync());
//   });

//   sl
//     ..unregister<CertificateReader>()
//     ..registerLazySingleton<CertificateReader>(() => certificateReader);
//   return certificateReader;
// }

// MockLockApp mockLockApp(GetIt sl) {
//   var lockApp = MockLockApp();
//   when(() => lockApp.canCheckBiometrics())
//       .thenAnswer((realInvocation) => Future.value(true));

//   when(() => lockApp.authenticate())
//       .thenAnswer((realInvocation) => Future.value(true));
//   sl
//     ..unregister<LockApp>()
//     ..registerLazySingleton<LockApp>(() => lockApp);
//   return lockApp;
// }

// Future<AppLocalizations> mockLocalization(GetIt sl) async {
//   AppLocalizations appLocalizations = await AppLocalizations.delegate.load(Locale('ru'));
//   sl..registerSingleton<AppLocalizations>(appLocalizations);
//   return appLocalizations;
// }

// MockSecureStorage mockSecureStorage(GetIt sl){
//   var secureStorage = MockSecureStorage();
//   sl
//     ..unregister<SecureStorage>()
//     ..registerLazySingleton<SecureStorage>(() {
//       return secureStorage;
//     });

//   return secureStorage;
// }
