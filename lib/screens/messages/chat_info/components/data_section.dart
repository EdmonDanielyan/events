import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/messages/chat_info/components/btn_wrapper.dart';
import 'package:ink_mobile/screens/messages/chat_info/entities/design_entities.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatInfoDataSection extends StatelessWidget {
  const ChatInfoDataSection({Key? key}) : super(key: key);

  static late AppLocalizations _strings;

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          filesAndLinksButton(),
          SizedBox(height: 5.0),
          divider(),
          SizedBox(height: 5.0),
          notificationBtnWidget(),
        ],
      ),
    );
  }

  Widget filesAndLinksButton() {
    return ChatInfoBtnWrapper(
      onTap: () {
        print("Files and links");
      },
      icon: filesIcon(),
      children: [
        Text(
          "${_strings.files} ${_strings.and.toLowerCase()} ${_strings.links.toLowerCase()}",
          maxLines: 1,
        ),
      ],
    );
  }

  Widget divider() {
    return Container(
      padding: EdgeInsets.only(
        left: ChatInfoDesignEntities.horizontalPadding,
      ),
      child: Row(
        children: [
          SizedBox(height: 0.0, child: filesIcon()),
          SizedBox(width: ChatInfoDesignEntities.titleGap),
          Expanded(child: Divider(color: Colors.grey, height: 1.0)),
        ],
      ),
    );
  }

  Widget notificationBtnWidget() {
    return ChatInfoBtnWrapper(
      onTap: () {
        print("Notifications");
      },
      icon: Container(
        padding: const EdgeInsets.all(2.0),
        color: Colors.red,
        child: Icon(
          Icons.volume_off_rounded,
          color: Colors.white,
          size: ChatInfoDesignEntities.iconSize,
        ),
      ),
      children: [
        Text(
          "${_strings.turnOff} ${_strings.notifications.toLowerCase()}",
          maxLines: 1,
        ),
      ],
    );
  }

  Widget filesIcon() {
    return Container(
      padding: const EdgeInsets.all(2.0),
      color: Colors.green[900],
      child: Icon(
        Icons.file_present,
        color: Colors.white,
        size: ChatInfoDesignEntities.iconSize,
      ),
    );
  }
}
