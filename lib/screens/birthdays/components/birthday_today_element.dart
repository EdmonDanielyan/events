import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ink_mobile/constants/aseets.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/birthday_data.dart';
import 'package:ink_mobile/models/jwt_payload.dart';
import 'package:ink_mobile/screens/birthdays/components/birthday_avatar.dart';
import 'package:ink_mobile/screens/birthdays/components/birthday_body.dart';

class BirthdayTodayElement extends StatelessWidget {
  final int index;
  const BirthdayTodayElement({
    Key? key,
    required this.index,
    required this.birthday,
  }) : super(key: key);

  final BirthdayData birthday;

  Future<void> _congratulate(BuildContext context) async {
    // if (_messenger.isConnected) {
    //   ChatTable? chat = await _messenger.chatCreation.isSingleChatExists(
    //       ChatUserViewModel.birthdayDataToUserTable(birthday));

    //   if (chat != null) {
    //     OpenChat(chatDatabaseCubit, chat).call();
    //   } else {
    //     ChatTable newChat = await _messenger.chatCreation.createDialogChat(
    //         ChatUserViewModel.birthdayDataToUserTable(birthday));
    //     Navigator.of(context).pop();
    //     OpenChat(chatDatabaseCubit, newChat).call();
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: index == 0 ? const EdgeInsets.symmetric(vertical: 3.0) : null,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BirthdayAvatar(birthday: birthday),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(bottom: 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/personal',
                              arguments: {'id': birthday.id});
                        },
                        child: Text(
                          birthday.name ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    BirthdayBody(birthday: birthday),
                  ],
                ),
              ),
            ),
            if (birthday.id != JwtPayload.myId) ...[
              _congratulateWidget(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _congratulateWidget(BuildContext context) {
    return InkWell(
      onTap: () => _congratulate(context),
      child: Container(
        padding: const EdgeInsets.all(9.0),
        margin: const EdgeInsets.only(right: 1.0),
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            SizedBox(
              width: 40.0,
              height: 35.0,
              child: SvgPicture.asset(GIFT_ICON_SVG, color: Colors.white),
            ),
            const SizedBox(height: 3.0),
            Text(
              localizationInstance.congratulate,
              style: TextStyle(
                color: Colors.white,
                fontSize: 11.0,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
