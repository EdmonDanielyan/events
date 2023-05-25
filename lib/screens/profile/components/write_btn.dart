import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/components/buttons/default_button.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/handler/create_chat.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/setup.dart';

class WriteBtn extends StatelessWidget {
  final User user;
  const WriteBtn({Key? key, required this.user}) : super(key: key);

  Future<void> _write(BuildContext context) async {
    CreateChatHandler(
      [user],
      context,
      chatsCubit: getIt<CachedChatsCubit>(),
      onlineCubit: getIt<OnlineCubit>(),
      cachedUsersCubit: getIt<CachedUsersCubit>(),
    ).call();
  }

  @override
  Widget build(BuildContext context) {
    // to prevent scaling
    return Center(
      child: FittedBox(
        child: DefaultButton(
          onTap: () => _write(context),
          title: localizationInstance.writeHint,
          buttonColor: Palette.greenE4A,
          textColor: Palette.white,
          suffixIcon: SvgPicture.asset(
            IconLinks.CHAT_OPEN_ICON,
            height: 20.0,
            width: 20.0,
            color: Palette.white,
          ),
        ),
      ),
    );
  }
}
