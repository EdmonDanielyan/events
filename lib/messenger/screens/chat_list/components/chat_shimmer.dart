import 'package:flutter/material.dart';
import 'package:ink_mobile/components/custom_circle_avatar.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_divider.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_message.dart';
import 'package:ink_mobile/messenger/screens/chat_list/components/chat_name.dart';
import 'package:shimmer/shimmer.dart';

class ChatListTileShimmer extends StatefulWidget {
  final String highlightValue;
  final EdgeInsetsGeometry? contentPadding;
  final double leadingGap;
  final void Function()? onTap;
  const ChatListTileShimmer({
    Key? key,
    this.highlightValue = "",
    this.contentPadding,
    this.leadingGap = 15.0,
    this.onTap,
  }) : super(key: key);

  @override
  State<ChatListTileShimmer> createState() => _ChatListTileSchimmerState();
}

class _ChatListTileSchimmerState extends State<ChatListTileShimmer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: widget.contentPadding,
          margin: EdgeInsets.only(bottom: 7.0, top: 7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _avatarWidget(),
                  SizedBox(width: widget.leadingGap),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.withOpacity(0.5),
                                highlightColor: Colors.grey.withOpacity(0.2),
                                child: ChatName(
                                    name: localizationInstance.loadingChats),
                              ),
                            ),
                            SizedBox(width: 2.0),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: _displayBody(),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0)
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 0.0,
                    child: Opacity(
                        child: CustomCircleAvatar(url: ""), opacity: 0.0),
                  ),
                  SizedBox(width: widget.leadingGap),
                  Expanded(child: ChatDivider())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatarWidget() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.grey.withOpacity(0.2),
      child: CustomCircleAvatar(
        url: "",
        name: "",
      ),
    );
  }

  Widget _displayBody() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.grey.withOpacity(0.2),
      child: ChatMessage(
        message: localizationInstance.loadingMessages,
      ),
    );
  }
}
