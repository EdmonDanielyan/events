import 'package:flutter/material.dart';
import 'package:ink_mobile/components/highlight_text.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/design_entities.dart';
import 'package:ink_mobile/components/custom_circle_avatar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ParticipantCard extends StatelessWidget {
  final String trailingLable;
  final UserTable? user;
  final double? horizontalPadding;
  final double? titleGap;
  final double? avatarSize;
  final String highlightTxt;
  final String? overrideTitle;
  final String? overrideAvatar;
  const ParticipantCard({
    Key? key,
    required this.user,
    this.highlightTxt = "",
    this.horizontalPadding,
    this.titleGap,
    this.avatarSize,
    this.overrideTitle,
    this.overrideAvatar,
    this.trailingLable = "",
  }) : super(key: key);

  static late AppLocalizations _strings;

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;

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
          if (trailingLable.isNotEmpty) ...[
            _trailingLableWidget(trailingLable),
          ],
        ],
      ),
    );
  }

  Widget avatarWidget() {
    return CustomCircleAvatar(
      avatarHeight: avatarSize ?? ChatInfoDesignEntities.iconSize + 7,
      avatarWidth: avatarSize ?? ChatInfoDesignEntities.iconSize + 7,
      url: overrideAvatar ?? user?.avatar,
      indicator: true,
      indicatorSize: 8.0,
    );
  }

  Widget nameWidget(BuildContext context) {
    return HighlightText(
      txt: overrideTitle ?? (user?.name ?? ""),
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
      true ? _strings.online : _strings.offline,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 12.0,
      ),
    );
  }

  Widget _trailingLableWidget(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 12.0,
      ),
    );
  }
}
