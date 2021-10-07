import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/design_entities.dart';
import 'package:ink_mobile/screens/messages/chat_list/components/chat_avatar.dart';

class ParticipantCard extends StatelessWidget {
  final ChatUser owner;
  final List<ChatUser> admins;
  final ChatUser user;
  const ParticipantCard({
    Key? key,
    required this.user,
    required this.owner,
    required this.admins,
  }) : super(key: key);
  static late LanguageStrings _strings;

  String getPrivilegeLable() {
    if (ChatUserViewModel.isOwner(user, owner)) return _strings.owner;
    if (ChatUserViewModel.isAdmin(user, admins)) return _strings.admin;

    return "";
  }

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    String privelegeLable = getPrivilegeLable();

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ChatInfoDesignEntities.horizontalPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          avatarWidget(),
          SizedBox(width: ChatInfoDesignEntities.titleGap - 7),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameWidget(),
                onlineStatusWidget(),
              ],
            ),
          ),
          if (privelegeLable.isNotEmpty) ...[
            privilegeStatusWidget(privelegeLable),
          ],
        ],
      ),
    );
  }

  Widget avatarWidget() {
    return SizedBox(
      width: ChatInfoDesignEntities.iconSize + 7,
      height: ChatInfoDesignEntities.iconSize + 7,
      child: ChatAvatar(url: user.avatarUrl),
    );
  }

  Widget nameWidget() {
    return Text(
      user.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14.0,
      ),
    );
  }

  Widget onlineStatusWidget() {
    return Text(
      user.online ? _strings.online : _strings.offline,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 12.0,
      ),
    );
  }

  Widget privilegeStatusWidget(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 12.0,
      ),
    );
  }
}
