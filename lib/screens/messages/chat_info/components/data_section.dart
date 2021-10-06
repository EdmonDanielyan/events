import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';

class ChatInfoDataSection extends StatelessWidget {
  final double horizontalPadding;
  const ChatInfoDataSection({Key? key, this.horizontalPadding = 20.0})
      : super(key: key);
  static late LanguageStrings _strings;
  static double _titleGap = 15.0;

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;

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
    return btnWrapper(
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
        left: horizontalPadding,
      ),
      child: Row(
        children: [
          SizedBox(height: 0.0, child: filesIcon()),
          SizedBox(width: _titleGap),
          Expanded(child: Divider(color: Colors.grey, height: 1.0)),
        ],
      ),
    );
  }

  Widget notificationBtnWidget() {
    return btnWrapper(
      onTap: () {
        print("Notifications");
      },
      icon: Container(
        padding: const EdgeInsets.all(2.0),
        color: Colors.red,
        child: Icon(
          Icons.volume_off_rounded,
          color: Colors.white,
          size: 24,
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
        size: 24,
      ),
    );
  }

  Widget btnWrapper({
    required void Function()? onTap,
    required Widget icon,
    required List<Widget> children,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
        ),
        margin: EdgeInsets.only(bottom: 2.0),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: _titleGap),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
