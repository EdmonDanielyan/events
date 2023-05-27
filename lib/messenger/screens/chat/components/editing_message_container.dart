import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/cubits/custom/message_cubit.dart';
import 'package:ink_mobile/messenger/model/message.dart';

class EditingMessageContainer extends StatelessWidget {
  final MessageCubit editingMessage;
  const EditingMessageContainer({
    Key? key,
    required this.editingMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageCubit, Message?>(
      bloc: editingMessage,
      builder: (context, state) {
        if (state == null) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                IconLinks.EDIT_ICON,
                color: Palette.textBlack50,
                height: 28.0,
                width: 28.0,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(state.body, maxLines: 1, overflow: TextOverflow.ellipsis,style: FontStyles.rubikP2(color: Palette.textBlack50),),
              ),
              const SizedBox(width: 10.0),
              InkWell(
                onTap: () => editingMessage.set(null),
                child: Icon(
                  Icons.close,
                  size: 28.0,
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
