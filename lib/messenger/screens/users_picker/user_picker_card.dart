import 'package:flutter/material.dart';
import '../../cubits/cached/chats/cached_chats_cubit.dart';
import '../../cubits/custom/online_cubit/online_cubit.dart';
import '../../model/user.dart';
import '../chat_info/components/participant_card.dart';
import 'radio_btn.dart';

class UserPickerCard extends StatelessWidget {
  final User user;
  final void Function(User, bool) onSelect;
  final OnlineCubit onlineCubit;
  final CachedChatsCubit cachedChatsCubit;
  final bool enabled;
  const UserPickerCard(
    this.user, {
    Key? key,
    required this.onSelect,
    required this.onlineCubit,
    required this.cachedChatsCubit,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelect(user, !enabled);
      },
      child: Padding(
        padding: const EdgeInsets.only(
            top: 3.0, bottom: 3.0, left: 15.0, right: 5.0),
        child: ParticipantCard(
          user: user,
          trailingWidget: UserPickerRadio(
            enabled: enabled,
            onTap: (enabled) => onSelect(user, enabled),
          ),
          onlineCubit: onlineCubit,
          cachedChatsCubit: cachedChatsCubit,
        ),
      ),
    );
  }
}
