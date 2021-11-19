import 'package:flutter/material.dart';
import 'package:ink_mobile/components/highlight_text.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/providers/message_provider.dart';
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
  final bool indicatorIsOn;
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
    this.indicatorIsOn = true,
  }) : super(key: key);

  static late AppLocalizations _strings;

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;

    if (indicatorIsOn && user != null && UseMessageProvider.initialized) {
      UseMessageProvider.messageProvider.subscribeToUserOnline(user!);
    }

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal:
              horizontalPadding ?? ChatInfoDesignEntities.horizontalPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _avatarWidget(),
          SizedBox(width: titleGap ?? ChatInfoDesignEntities.titleGap - 7),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameWidget(context),
                _onlineStatusWidget(),
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

  Widget _avatarWidget() {
    return CustomCircleAvatar(
      avatarHeight: avatarSize ?? ChatInfoDesignEntities.iconSize + 7,
      avatarWidth: avatarSize ?? ChatInfoDesignEntities.iconSize + 7,
      url: overrideAvatar ?? user?.avatar,
      indicator: indicatorIsOn && user != null && user!.online ? true : false,
      indicatorSize: 8.0,
      name: user?.name ?? "",
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

  Widget _onlineStatusWidget() {
    if (indicatorIsOn) {
      return Text(
        user != null && user!.online ? _strings.online : _strings.offline,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12.0,
        ),
      );
    }

    return SizedBox();
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
