import 'package:flutter/material.dart';
import 'package:ink_mobile/components/highlight_text.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/design_entities.dart';
import 'package:ink_mobile/components/custom_circle_avatar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ParticipantCard extends StatelessWidget {
  final UserTable? owner;
  final List<UserTable>? admins;
  final UserTable user;
  final double? horizontalPadding;
  final double? titleGap;
  final double? avatarSize;
  final String highlightTxt;
  const ParticipantCard({
    Key? key,
    required this.user,
    this.owner,
    this.admins,
    this.highlightTxt = "",
    this.horizontalPadding,
    this.titleGap,
    this.avatarSize,
  }) : super(key: key);

  static late AppLocalizations _strings;

  String getPrivilegeLable() {
    // if (owner != null) {
    //   if (ChatUserViewModel.isOwner(user, owner!)) return _strings.owner;
    // }
    // if (admins != null) {
    //   if (ChatUserViewModel.isAdmin(user, admins!)) return _strings.admin;
    // }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;

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
      url: user.avatar,
      //indicator: user.online,
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
    return SizedBox();
    // return Text(
    //   user.online ? _strings.online : _strings.offline,
    //   style: TextStyle(
    //     color: Colors.grey,
    //     fontSize: 12.0,
    //   ),
    // );
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
