import 'package:flutter/material.dart';
import 'package:ink_mobile/models/chat/selected_message.dart';

class RespondMessageContainer extends StatelessWidget {
  final void Function()? onCancel;
  final SelectedMessage selectedMessage;
  final double horizontalPadding;
  const RespondMessageContainer({
    Key? key,
    this.horizontalPadding = 7.0,
    this.onCancel,
    required this.selectedMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _titleWidget(),
              ),
              _cancelWidget(),
            ],
          ),
          SizedBox(height: 2.0),
          _textWidget(),
        ],
      ),
    );
  }

  Widget _titleWidget() {
    return Text(
      selectedMessage.title,
      style: TextStyle(
        color: selectedMessage.titleColor,
        fontSize: 12.0,
      ),
    );
  }

  Widget _cancelWidget() {
    return InkWell(
      onTap: onCancel,
      child: Icon(
        Icons.cancel,
        size: 14,
      ),
    );
  }

  Widget _textWidget() {
    return Text(
      selectedMessage.body,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 12.0,
      ),
    );
  }
}
