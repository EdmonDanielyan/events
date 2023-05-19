import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
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
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/personal',
            arguments: {'id': birthday.id});
      },
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Badge(
              child: BirthdayAvatar(birthday: birthday),
              smallSize: 20.0,
              largeSize: 20.0,
              alignment: AlignmentDirectional(0.0, -4.0),
              backgroundColor: Palette.blue9CF,
              label: SvgPicture.asset(
                IconLinks.CAKE_ICON_LINK,
                color: Palette.white,
                height: 12.0,
                width: 12.0,
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    birthday.name ?? '',
                    style: FontStyles.rubikP2Medium(color: Palette.textBlack),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  BirthdayBody(birthday: birthday),
                ],
              ),
            ),
            if (birthday.id != JwtPayload.myId) ...[
              const SizedBox(width: 12.0),
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
