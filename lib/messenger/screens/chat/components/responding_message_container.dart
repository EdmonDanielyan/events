import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/cubits/custom/message_cubit.dart';
import 'package:ink_mobile/messenger/model/message.dart';

class RespondingMessageContainer extends StatelessWidget {
  final MessageCubit respondingMessage;
  const RespondingMessageContainer({
    Key? key,
    required this.respondingMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageCubit, Message?>(
      bloc: respondingMessage,
      builder: (context, state) {
        if (state == null) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                IconLinks.REPLY_ICON,
                color: Palette.textBlack50,
                height: 28.0,
                width: 28.0,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.owner.name,
                      maxLines: 1,
                      style: FontStyles.rubikP3Medium(color: Palette.greenE4A),
                    ),
                    Text(
                      state.body,
                      maxLines: 1,
                      style: FontStyles.rubikP2(color: Palette.textBlack50),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10.0),
              InkWell(
                onTap: () => respondingMessage.set(null),
                child: Icon(
                  Icons.close,
                  size: 28,
                  color: Palette.greenE4A,
                ),
              ),
              const SizedBox(width: 5.0),
            ],
          ),
        );
      },
    );
  }
}
