import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/highlight_text.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/design_entities.dart';
import 'package:ink_mobile/components/custom_circle_avatar.dart';

class ParticipantCard extends StatelessWidget {
  final ChatUser? owner;
  final List<ChatUser>? admins;
  final ChatUser user;
  final double? horizontalPadding;
  final double? titleGap;
  final double? avatarSize;
  final String highlightTxt;
  const ParticipantCard({
    Key? key,
    required this.user,
    required this.owner,
    required this.admins,
    this.highlightTxt = "",
    this.horizontalPadding,
    this.titleGap,
    this.avatarSize,
  }) : super(key: key);
  static late LanguageStrings _strings;

  String getPrivilegeLable() {
    if (owner != null) {
      if (ChatUserViewModel.isOwner(user, owner!)) return _strings.owner;
    }
    if (admins != null) {
      if (ChatUserViewModel.isAdmin(user, admins!)) return _strings.admin;
    }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    String privelegeLable = getPrivilegeLable();

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal:
              horizontalPadding ?? ChatInfoDesignEntities.horizontalPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          avatarWidget(),
          SizedBox(width: titleGap ?? ChatInfoDesignEntities.titleGap - 7),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameWidget(context),
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
    return CustomCircleAvatar(
      avatarHeight: avatarSize ?? ChatInfoDesignEntities.iconSize + 7,
      avatarWidth: avatarSize ?? ChatInfoDesignEntities.iconSize + 7,
      url: user.avatarUrl,
      indicator: user.online,
      indicatorSize: 8.0,
    );
  }

  Widget nameWidget(BuildContext context) {
    return HighlightText(
      txt: user.name,
      highlightTxt: highlightTxt,
      textStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 14.0,
        fontFamily: Theme.of(context).textTheme.bodyText1!.fontFamily,
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
