import 'package:flutter/material.dart';
import 'package:ink_mobile/cubit/profile/sources/fetch/network.dart';
import 'package:ink_mobile/extensions/get_user_success.dart';
import 'package:ink_mobile/messenger/api/rest_client/chat/get_list/response.dart';
import 'package:ink_mobile/messenger/api/rest_client/chat/invite/request.dart';
import 'package:ink_mobile/messenger/api/rest_client/chat/remove_participant/request.dart';
import 'package:ink_mobile/messenger/api/rest_client/rest_client.dart';
import 'package:ink_mobile/messenger/api/services/chat/get_list_handle.dart';
import 'package:ink_mobile/messenger/functions/create_info_message.dart';
import 'package:ink_mobile/messenger/handler/create_chat.dart';
import 'package:ink_mobile/messenger/handler/fetch/chats.dart';
import 'package:ink_mobile/messenger/handler/senders/invite_chat_link_new.dart';
import 'package:ink_mobile/messenger/handler/senders/invite_link.dart';
import 'package:ink_mobile/messenger/handler/senders/send_message_handler.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:ink_mobile/setup.dart';
import 'package:collection/collection.dart';

import '../components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart';
import '../messenger/cubits/cached/chats/cached_chats_cubit.dart';
import '../messenger/cubits/cached/users/cached_users_cubit.dart';
import '../messenger/cubits/custom/online_cubit/online_cubit.dart';
import '../messenger/handler/senders/invite_chat_sender_handler.dart';
import '../messenger/model/chat.dart';
import '../messenger/screens/chat/opener.dart';

// TODO: replace these methods to functions/navigation_utils?
class NavigationMethods {
  static void backToMainScreen(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      final mainScreenKey = "/app_layer";
      Navigator.of(context)
          .popUntil((route) => route.settings.name == mainScreenKey);
    }
    getIt<NewBottomNavBarCubit>().goToPage(NavBarItems.home);
  }

  static void openNewsList(BuildContext context, {dynamic arguments}) {
    backToMainScreen(context);
    final newsListKey = "/news_list";
    Navigator.of(context).pushNamed(newsListKey, arguments: arguments);
  }

  static void openNewsDetail(BuildContext context, int articleID) {
    openNewsList(context);
    final newsArticleKey = "/news_detail";
    Navigator.of(context)
        .pushNamed(newsArticleKey, arguments: {"id": articleID});
  }

  static void openEventsList(BuildContext context, {dynamic arguments}) {
    backToMainScreen(context);
    final eventsListKey = "/events_list";
    Navigator.of(context).pushNamed(eventsListKey, arguments: arguments);
  }

  static void openEventDetail(BuildContext context, int eventID) {
    openEventsList(context);
    final eventDetailKey = "/event_detail";
    Navigator.of(context).pushNamed(eventDetailKey, arguments: {"id": eventID});
  }

  static void openAnnouncementsList(BuildContext context, {dynamic arguments}) {
    backToMainScreen(context);
    final announcementsListKey = "/announcements_list";
    Navigator.of(context).pushNamed(announcementsListKey, arguments: arguments);
  }

  static void openAnnouncementDetail(BuildContext context, int announcementID) {
    openAnnouncementsList(context);
    final announcementDetailKey = "/announcement_detail";
    Navigator.of(context)
        .pushNamed(announcementDetailKey, arguments: {"id": announcementID});
  }

  static void openNotificationChat(BuildContext context, {dynamic arguments}) {
    final chatsCubit = getIt<CachedChatsCubit>();
    final chat = chatsCubit.state.chats.firstWhereOrNull(
        (selectedChat) => selectedChat.type == ChatType.notifications);
    if (chat != null) {
      _openChat(context, chat.id);
    }
  }

  static void openChatByID(BuildContext context, int chatID) {
    final chatsCubit = getIt<CachedChatsCubit>();
    final chat = chatsCubit.state.chats
        .firstWhereOrNull((selectedChat) => selectedChat.id == chatID);
    if (chat != null) {
      _openChat(context, chatID);
    }
  }

  static Future<void> openChatByUserID(BuildContext context, int userID) async {
    backToMainScreen(context);
    getIt<NewBottomNavBarCubit>().goToPage(NavBarItems.messages);
    final cachedUsersCubit = getIt<CachedUsersCubit>();
    User? user = cachedUsersCubit.getUser(userID);
    if (user == null) {
      await Token.setNewTokensIfExpired();
      final response =
          await getIt<ProfileFetchNetworkRequest>(param1: userID)();
      UserProfileData userData = response.mapResponse();
      user = User.fromUserProfileData(userData);
    }
    CreateChatHandler(
      [user],
      context,
      chatsCubit: getIt<CachedChatsCubit>(),
      onlineCubit: getIt<OnlineCubit>(),
      cachedUsersCubit: cachedUsersCubit,
    ).call();
  }

  static void _openChat(BuildContext context, int chatID) {
    backToMainScreen(context);
    getIt<NewBottomNavBarCubit>().goToPage(NavBarItems.messages);
    ChatScreenOpener(
      context,
      chatID,
      getIt<CachedChatsCubit>(),
      onlineCubit: getIt<OnlineCubit>(),
      cachedUsersCubit: getIt<CachedUsersCubit>(),
    )();
  }

  static void openSearch(BuildContext context) {
    backToMainScreen(context);
    getIt<NewBottomNavBarCubit>().goToPage(NavBarItems.search);
  }

  static void openSearchWithMessage(BuildContext context) {
    backToMainScreen(context);
    getIt<NewBottomNavBarCubit>().goToPage(NavBarItems.search);
  }

  static void openUserPageById(BuildContext context, int userID) {
    openNewsList(context);
    final userKey = "/personal";
    Navigator.of(context).pushNamed(userKey, arguments: {"id": userID});
  }

  static void openChatInviteLink(BuildContext context, int chatID) async {
    // final response = await const MainApi().client.getChatList();
    // final chatListResponse =
    //     GetChatListResponse.fromJson(response as Map<String, dynamic>);
    // final itog = chatListResponse.data as List<int>;
    // if (itog.contains(chatID)) {
    //   openChatByID(context, chatID);
    // } else {
    final chatsCubit = getIt<CachedChatsCubit>();
    await chatsCubit.fetchChats();
    final response = await chatsCubit.getChatById(chatID);
    if (response is Chat) {
      _openChat(context, chatID);
    } else {
      // await chatsCubit.fetchChats();
      // // await FetchChats().call();
      // final contains = chatsCubit.getChatById(chatID);
      // final me = chatsCubit.me;
      // if (contains!.participants.contains(me)) {
      //   _openChat(context, chatID);
      // } else {
      String userId = await Token.getUserId();
      // print(userId);
      // int.parse(userId);
      // print(userId);
      final List<int> users = [int.parse(userId)];
      await InviteLinkSenderHandler(chatID, users).call();
      await chatsCubit.fetchChats();
      // await FetchChats().call();
      openChatByLink(context, chatID, int.parse(userId));
    }
    // await Token.getUserId();
  }

  static void openChatByLink(
      BuildContext context, int chatID, int userID) async {
    final chatsCubit = getIt<CachedChatsCubit>();
    final chat = chatsCubit.getChatById(chatID);
    // final chat = chatsCubit.state.chats
    //     .firstWhereOrNull((selectedChat) => selectedChat.id == chatID);
    // final cachedUsersCubit = getIt<CachedUsersCubit>();
    User? user = chatsCubit.me;
    if (user == null) {
      await Token.setNewTokensIfExpired();
      final response =
          await getIt<ProfileFetchNetworkRequest>(param1: userID)();
      UserProfileData userData = response.mapResponse();
      user = User.fromUserProfileData(userData);
    }
    if (chat != null) {
      final messageBody = user.name + ' добавлен в чат';
      final msg = CreateInfoMessage(chatID, messageBody).call();
      SendMessageHandler([msg], chat).call();
      _openChat(context, chatID);
    }
  }
}
