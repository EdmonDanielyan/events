import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/messenger/handler/create_chat.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/models/birthday_data.dart';
import 'package:ink_mobile/models/jwt_payload.dart';
import 'package:ink_mobile/screens/birthdays/components/birthday_avatar.dart';
import 'package:ink_mobile/screens/birthdays/components/birthday_body.dart';
import 'package:ink_mobile/setup.dart';

import 'congratulate.dart';

class BirthdayTodayElement extends StatelessWidget {
  final int index;

  const BirthdayTodayElement({
    Key? key,
    required this.index,
    required this.birthday,
  }) : super(key: key);

  final BirthdayData birthday;

  Future<void> _congratulate(BuildContext context) async {
    CreateChatHandler(
      [
        User(
          id: birthday.id,
          name: "${birthday.name ?? ""}".trim(),
          avatarUrl: birthday.pathToAvatar ?? "",
        )
      ],
      context,
      chatsCubit: getIt<CachedChatsCubit>(),
      onlineCubit: getIt<OnlineCubit>(),
      cachedUsersCubit: getIt<CachedUsersCubit>(),
    ).call();
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
                    const SizedBox(height: 5.0),
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
                            fontSize: SizeConfig(context, 14.0)
                                .getProportionateScreenHeight,
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
              BirthdayCongratulate(
                onTap: () => _congratulate(context),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
