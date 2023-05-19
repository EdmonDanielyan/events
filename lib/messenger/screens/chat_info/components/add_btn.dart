import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/components/buttons/default_button.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/messenger/screens/chat_info/components/participant_card.dart';

class ChatInfoAddBtn extends StatelessWidget {
  final void Function(BuildContext)? onPressed;
  final CachedChatsCubit cachedChatsCubit;
  const ChatInfoAddBtn({
    Key? key,
    this.onPressed,
    required this.cachedChatsCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onTap: () => onPressed?.call(context),
      title: "Добавить участников",
      borderColor: Palette.greenE4A,
      textColor: Palette.greenE4A,
      suffixIcon: SvgPicture.asset(
        IconLinks.USER_ADD_ICON,
        height: 20.0,
        width: 20.0,
        color: Palette.greenE4A,
      ),
    );
  }
}
