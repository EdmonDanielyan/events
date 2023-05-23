import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/components/cached_avatar/cached_avatar.dart';
import 'package:ink_mobile/messenger/constants/enums.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart';
import 'package:ink_mobile/messenger/model/user.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/online_builder.dart';
import 'package:ink_mobile/models/absence.dart';
import 'package:ink_mobile/utils/date_comparison_util.dart';

class ParticipantCard extends StatelessWidget {
  final User user;
  final Widget? trailingWidget;
  final Widget? divider;
  final OnlineCubit? onlineCubit;
  final CachedChatsCubit cachedChatsCubit;
  const ParticipantCard({
    Key? key,
    required this.user,
    this.divider,
    this.trailingWidget,
    this.onlineCubit,
    required this.cachedChatsCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            OnlineBuilder(
              onlineCubit ?? OnlineCubit(),
              userId: user.id,
              builder: (context, onlineState, onlineUser) {
                ChatBadge chatBadge = ChatBadge.none;
                String iconLink = "";
                Color backgroundColor = Palette.white;
                Absence? absence = user.absence;
                if (absence != null) {
                  switch (absence.reason) {
                    case AbsenceReason.vacation:
                      chatBadge = ChatBadge.vacation;
                      iconLink = IconLinks.SUN_ICON;
                      backgroundColor = Palette.yellow300;
                      break;
                    case AbsenceReason.businessTrip:
                      chatBadge = ChatBadge.businessTrip;
                      iconLink = IconLinks.PLANE_ICON;
                      backgroundColor = Palette.purple255;
                      break;
                    default:
                      break;
                  }
                }
                if (user.birthday != null &&
                    DateOnlyCompare().isSameDateWithoutYear(
                        user.birthday!, DateTime.now())) {
                  chatBadge = ChatBadge.birthday;
                  iconLink = IconLinks.CAKE_ICON_LINK;
                  backgroundColor = Palette.blue9CF;
                }
                return Badge(
                    isLabelVisible: chatBadge != ChatBadge.none,
                    label: SvgPicture.asset(
                      iconLink,
                      color: Palette.white,
                      height: 12.0,
                      width: 12.0,
                    ),
                    backgroundColor: backgroundColor,
                    smallSize: 20.0,
                    largeSize: 20.0,
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: CachedCircleAvatar(
                      url: onlineUser?.avatarUrl ?? user.avatarUrl,
                      name: onlineUser?.name ?? user.name,
                      avatarHeight: 44.0,
                      avatarWidth: 44.0,
                      indicator: onlineUser != null,
                      indicatorSize: 8.0,
                    ),
                  );
              },
              cachedChatsCubit: cachedChatsCubit,
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: FontStyles.rubikP2Medium(
                      color: Palette.textBlack,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    user.workPosition ?? "",
                    style: FontStyles.rubikP3(color: Palette.textBlack50),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20.0,),
            trailingWidget ?? const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
