import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
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
          return const SizedBox();
        }

        return Container(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 13.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GoogleText(
                      "${state.owner.name}:",
                      maxLines: 1,
                      fontSize: 11.0,
                    ),
                    GoogleText(
                      state.body,
                      maxLines: 1,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10.0),
              InkWell(
                onTap: () => respondingMessage.set(null),
                child: const Icon(Icons.close),
              ),
              const SizedBox(width: 5.0),
            ],
          ),
        );
      },
    );
  }
}
