// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:ink_mobile/messenger/components/bottom_sheet/bottom_sheet.dart';
// import 'package:ink_mobile/messenger/constants/urls.dart';
// import 'package:ink_mobile/messenger/cubits/cached/chat_users_picker/chat_users_picker_cubit.dart';
// import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
// import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
// import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
// import 'package:ink_mobile/messenger/cubits/custom/string_cubit.dart';
// import 'package:ink_mobile/messenger/handler/create_chat.dart';
// import 'package:ink_mobile/messenger/handler/remove_chat_handler.dart';
// import 'package:ink_mobile/messenger/handler/senders/remove_participant_sender_handler.dart';
// import 'package:ink_mobile/messenger/model/chat.dart';
// import 'package:ink_mobile/messenger/model/user.dart';
// import 'package:ink_mobile/messenger/providers/app_token.dart';
// import 'package:ink_mobile/messenger/providers/messenger.dart';
// import 'package:ink_mobile/messenger/screens/chat/opener.dart';
// import 'package:ink_mobile/messenger/screens/chat_list/chat_list_screen.dart';
// import 'package:ink_mobile/messenger/screens/users_picker/users_picker_screen.dart';
// import 'package:ink_mobile/setup.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final chatsCubit = getIt<CachedChatsCubit>();
//   final createChat = StringCubit("");
//   final onlineCubit = getIt<OnlineCubit>();
//   final cachedUsersCubit = getIt<CachedUsersCubit>();
//   final chatUsersPickerCubit = getIt<ChatUsersPickerCubit>();

//   void _onType(String query, Chat? chat) {}

//   @override
//   void initState() {
//     super.initState();

//     String token = "";
//     User user;
//     if (Platform.isAndroid) {
//       user = const User(id: 1, name: "Ибрагим");
//       token =
//           "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjF9.8lSCknTnRANlJ0AVzCgO2yF838WYA7bLaAR7vAKnofo";
//     } else {
//       user = const User(id: 2, name: "Ибрагим 2");
//       token =
//           "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjJ9.QYdTqJ5SfsUkimZkmwxuMmWUx1tnY7szfN2g5UT0qDg";
//     }
//     chatsCubit.updateMe(user);
//     getIt<AppTokenProvider>().setToken(token);
//     getIt<MessengerProvider>()
//         .init(Urls.messengerUrl, user.id, apiUrl: Urls.baseUrls.first);

//     cachedUsersCubit.addUsers(UsersExample.getList);

//     chatUsersPickerCubit.addUsers(UsersExample.getList);
//     chatUsersPickerCubit.addListenerToTyping(_onType);
//   }

//   void _createChat(List<User> users, BuildContext context) {
//     CreateChatHandler(
//       users,
//       context,
//       chatsCubit: chatsCubit,
//       onlineCubit: onlineCubit,
//       cachedUsersCubit: cachedUsersCubit,
//     ).call();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Мессенджер"),
//         actions: [
//           IconButton(
//             onPressed: () => getIt<MessengerProvider>().dispose(),
//             icon: const Icon(Icons.exit_to_app),
//           ),
//           IconButton(
//             onPressed: () => getIt<MessengerProvider>().init(
//               Urls.messengerUrl,
//               chatsCubit.myId,
//               apiUrl: Urls.baseUrls.first,
//             ),
//             icon: const Icon(Icons.play_arrow),
//           ),
//           IconButton(
//             onPressed: () {
//               createChat.setNew("");
//               CustomBottomSheet(
//                 context: context,
//                 child: UsersPickerScreen(
//                   submitTxtCubit: createChat,
//                   onChange: (users) {
//                     createChat.setNew(
//                       users.isEmpty
//                           ? ""
//                           : users.length > 1
//                               ? "Создать группу"
//                               : "Написать",
//                     );
//                   },
//                   onSubmit: (_context, users) {
//                     Navigator.of(_context).pop();
//                     _createChat(users, context);
//                   },
//                   onlineCubit: onlineCubit,
//                   cachedChatsCubit: chatsCubit,
//                 ),
//               );
//             },
//             icon: const Icon(Icons.add),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ChatList(
//               cubit: chatsCubit,
//               onDismissed: (chat) {
//                 RemoveParticipantHandler(chat, chatsCubit.myId, [chatsCubit.me])
//                     .call();
//                 RemoveChatHandler(chat)();
//               },
//               onTap: (chat) => ChatScreenOpener(
//                 context,
//                 chat.id,
//                 chatsCubit,
//                 onlineCubit: onlineCubit,
//                 cachedUsersCubit: cachedUsersCubit,
//               )(),
//               cachedUsersCubit: cachedUsersCubit,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
