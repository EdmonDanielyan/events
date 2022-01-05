import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ink_mobile/constants/aseets.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/open_chat.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/birthday_data.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/providers/messenger.dart';
import 'package:ink_mobile/setup.dart';

import '../../../setup.dart';

class BirthdayTodayElement extends StatelessWidget {
  final ChatDatabaseCubit chatDatabaseCubit;
  const BirthdayTodayElement(
      {Key? key, required this.birthday, required this.chatDatabaseCubit})
      : super(key: key);

  final BirthdayData birthday;
  static final Messenger _messenger = sl<Messenger>();

  Future<void> _congratulate(BuildContext context) async {
    if (_messenger.isConnected) {
      ChatTable newChat = await _messenger.chatCreation.createChatThroughNats(
          ChatUserViewModel.birthdayDataToUserTable(birthday));
      OpenChat(chatDatabaseCubit, newChat).call(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/personal',
                    arguments: {'id': birthday.id},
                  );
                },
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: birthday.pathToAvatar != null
                      ? NetworkImage(birthday.pathToAvatar!)
                      : AssetImage('assets/images/avatars/avatar_default.png')
                          as ImageProvider,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
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
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: birthday.city,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        TextSpan(
                          text: '. ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: birthday.workPosition,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          _congratulateWidget(context),
        ],
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
          children: [
            const SizedBox(height: 12),
            SizedBox(
              width: 40.0,
              height: 30.0,
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
