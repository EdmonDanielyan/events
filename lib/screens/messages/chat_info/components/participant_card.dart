import 'package:flutter/material.dart';
import 'package:ink_mobile/components/highlight_text.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/design_entities.dart';
import 'package:ink_mobile/components/custom_circle_avatar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ParticipantCard extends StatefulWidget {
  final String trailingLable;
  final UserTable? user;
  final double? horizontalPadding;
  final double? titleGap;
  final double? avatarSize;
  final String highlightTxt;
  final String? overrideTitle;
  final String? overrideAvatar;
  final bool indicatorIsOn;
  final String? avatarName;
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
    this.avatarName,
  }) : super(key: key);

  @override
  State<ParticipantCard> createState() => _ParticipantCardState();
}

class _ParticipantCardState extends State<ParticipantCard> {
  @override
  void initState() {
    super.initState();
    _subscribeToOnline();
  }

  Future<void> _subscribeToOnline() async {
    if (widget.indicatorIsOn &&
        widget.user != null &&
        UseMessageProvider.initialized) {
      await UseMessageProvider.messageProvider
          ?.subscribeToUserOnline(widget.user!);
    }
  }

  late AppLocalizations _strings;

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding ??
              ChatInfoDesignEntities.horizontalPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _avatarWidget(),
          SizedBox(
              width: widget.titleGap ?? ChatInfoDesignEntities.titleGap - 7),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameWidget(context),
                _onlineStatusWidget(),
              ],
            ),
          ),
          if (widget.trailingLable.isNotEmpty) ...[
            _trailingLableWidget(widget.trailingLable),
          ],
        ],
      ),
    );
  }

  Widget _avatarWidget() {
    return CustomCircleAvatar(
      avatarHeight: widget.avatarSize ?? ChatInfoDesignEntities.iconSize + 7,
      avatarWidth: widget.avatarSize ?? ChatInfoDesignEntities.iconSize + 7,
      url: widget.overrideAvatar ?? widget.user?.avatar,
      indicator:
          widget.indicatorIsOn && widget.user != null && widget.user!.online
              ? true
              : false,
      indicatorSize: 8.0,
      name: widget.avatarName ?? (widget.user?.name ?? ""),
    );
  }

  Widget nameWidget(BuildContext context) {
    return HighlightText(
      txt: widget.overrideTitle ?? (widget.user?.name ?? ""),
      highlightTxt: widget.highlightTxt,
      textStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 14.0,
        fontFamily: Theme.of(context).textTheme.bodyText1!.fontFamily,
      ),
    );
  }

  Widget _onlineStatusWidget() {
    if (widget.indicatorIsOn) {
      return Text(
        widget.user != null && widget.user!.online
            ? _strings.online
            : _strings.offline,
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