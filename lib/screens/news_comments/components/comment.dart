import 'package:flutter/material.dart';
import 'package:ink_mobile/ink_icons.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:intl/intl.dart';
import 'package:ink_mobile/cubit/news_comments/news_comments_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/extensions/int_extension.dart';

class Comment extends StatefulWidget {
  Comment(
      {Key? key,
      required this.id,
      this.avatar,
      this.name,
      required this.text,
      required this.barrelChecked,
      required this.barrelsCount,
      required this.dateTime})
      : super(key: key);

  final int id;
  final String? avatar;
  final String? name;
  final String text;
  bool barrelChecked;
  int barrelsCount;
  final DateTime dateTime;
  late NewsCommentsCubit cubit;

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  static const String DEFAULT_AVATAR =
      'assets/images/avatars/avatar_default.png';

  late Color _textColor;

  late LanguageStrings _strings;

  @override
  Widget build(BuildContext context) {
    widget.cubit = BlocProvider.of<NewsCommentsCubit>(context);
    _textColor = Theme.of(context).accentColor;
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: getAvatarImage(),
                    ),
                  )),
              Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(bottom: 5),
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.name ?? '',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                      Text(
                        widget.text,
                        style: TextStyle(color: _textColor, fontSize: 16),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                    child: GestureDetector(
                                  onTap: () async {
                                    await _onLike(context);
                                    setState(() {});
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        InkIcons.barrel,
                                        color: widget.barrelChecked
                                            ? Theme.of(context).primaryColor
                                            : _textColor,
                                      ),
                                      Text(
                                        widget.barrelsCount > 1000
                                            ? widget.barrelsCount
                                                .toThousandsString()
                                            : widget.barrelsCount.toString(),
                                        style: TextStyle(
                                            color: widget.barrelChecked
                                                ? Theme.of(context).primaryColor
                                                : _textColor,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ))),
                            Expanded(
                                flex: 4,
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    child: TextButton(
                                        onPressed: () {
                                          _onAnswerButtonTap();
                                        },
                                        child: Text(
                                          _strings.answer,
                                          style: TextStyle(
                                              color: _textColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )))),
                            Expanded(
                                flex: 6,
                                child: Text(
                                  DateFormat('dd.MM.yyyy HH:mm')
                                      .format(widget.dateTime),
                                  style: TextStyle(color: _textColor),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }

  void _onAnswerButtonTap() {
    NewsCommentsCubit _cubit = widget.cubit;

    _cubit.commentInputController.text =
        widget.name != null ? "${widget.name}, " : "";

    _cubit.commentInputController.selection = TextSelection.fromPosition(
        TextPosition(offset: _cubit.commentInputController.text.length));
    _cubit.answerId = widget.id;
    _cubit.focusNode.requestFocus();
  }

  Future<void> _onLike(BuildContext context) async {
    await widget.cubit.like(widget.id).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(_strings.errorOccuried),
        duration: Duration(seconds: 1),
      ));
      return false;
    }).then((value) {
      if (value) {
        if (widget.barrelChecked) {
          widget.barrelsCount--;
        } else {
          widget.barrelsCount++;
        }

        widget.barrelChecked = !widget.barrelChecked;
      }
    });
  }

  ImageProvider getAvatarImage() {
    if (widget.avatar == null) {
      return AssetImage(DEFAULT_AVATAR);
    } else {
      return NetworkImage(
        widget.avatar!,
      );
    }
  }
}
