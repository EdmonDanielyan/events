import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/cubits/custom/message_cubit.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
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
                      fontSize:
                          SizeConfig(context, 9.5).getProportionateScreenHeight,
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
                child: Icon(
                  Icons.close,
                  size: SizeConfig(context, 20).getProportionateScreenHeight,
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
