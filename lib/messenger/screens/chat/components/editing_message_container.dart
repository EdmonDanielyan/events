import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
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

        return Container(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                CupertinoIcons.pencil,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: GoogleText(state.body, maxLines: 1),
              ),
              const SizedBox(width: 10.0),
              InkWell(
                onTap: () => editingMessage.set(null),
                child: const Icon(
                  Icons.close,
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
