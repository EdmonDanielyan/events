import 'package:flutter/material.dart';
import 'package:ink_mobile/components/cached_image/cached_avatar.dart';
import 'package:ink_mobile/cubit/news_comments/news_comments_cubit.dart';
import 'package:ink_mobile/ink_icons.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/models/jwt_payload.dart';
import 'package:intl/intl.dart';
import 'package:ink_mobile/extensions/int_extension.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_html/flutter_html.dart';
//import 'package:url_launcher/url_launcher.dart';

class Comment extends StatefulWidget {
  const Comment({
    Key? key,
    required this.id,
    required this.authorId,
    this.avatar,
    this.name,
    required this.text,
    required this.barrelChecked,
    required this.barrelsCount,
    required this.dateTime,
    required this.newsCommentsCubit,
    required this.newsId,
  }) : super(key: key);

  final int id;
  final int authorId;
  final String? avatar;
  final String? name;
  final String text;
  final bool barrelChecked;
  final int barrelsCount;
  final DateTime dateTime;
  final NewsCommentsCubit newsCommentsCubit;
  final int newsId;

  @override
  _CommentState createState() => _CommentState(barrelChecked, barrelsCount);
}

class _CommentState extends State<Comment> {
  bool barrelChecked;
  int barrelsCount;
  _CommentState(this.barrelChecked, this.barrelsCount);

  late Color _textColor;

  late AppLocalizations _strings;

  @override
  Widget build(BuildContext context) {
    _textColor = Theme.of(context).colorScheme.secondary;
    _strings = localizationInstance;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/personal',
                            arguments: {'id': widget.authorId});
                      },
                      child: CachedCircleAvatar(
                        avatarHeight: (SizeConfig(context, 50)
                            .getProportionateScreenHeight),
                        url: widget.avatar ?? "",
                        name: widget.name ?? "",
                      ),
                    ),
                  )),
              Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/personal',
                              arguments: {'id': widget.authorId});
                        },
                        child: Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.name ?? '',
                              style: TextStyle(
                                  fontSize: (SizeConfig(context, 12)
                                      .getProportionateScreenHeight),
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      Html(
                          data: widget.text.replaceAll("src=\"/upload",
                              "style='max-width=100px; max-height=100px;' src=\"https://portal.irkutskoil.ru/upload")),

                      /*BBCodeText(
                          data: widget.text,
                          stylesheet: defaultBBStylesheet()
                            ..replaceTag(
                                CustomColorTag(defaultColor: _textColor))),*/

                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: JwtPayload.myId != widget.authorId
                                  ? () async {
                                      await _onLike(context);
                                      setState(() {});
                                    }
                                  : null,
                              child: Row(
                                children: [
                                  Icon(
                                    InkIcons.barrel,
                                    color: barrelChecked
                                        ? Theme.of(context).primaryColor
                                        : _textColor,
                                    size: (SizeConfig(context, 16)
                                        .getProportionateScreenWidth),
                                  ),
                                  Text(
                                    barrelsCount > 1000
                                        ? barrelsCount.toThousandsString()
                                        : barrelsCount.toString(),
                                    style: TextStyle(
                                      color: barrelChecked
                                          ? Theme.of(context).primaryColor
                                          : _textColor,
                                      fontSize: (SizeConfig(context, 15)
                                          .getProportionateScreenHeight),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                onPressed: () {
                                  _onAnswerButtonTap();
                                },
                                child: Text(
                                  _strings.reply,
                                  style: TextStyle(
                                      color: _textColor,
                                      fontSize: (SizeConfig(context, 14)
                                          .getProportionateScreenHeight),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 6,
                              child: Text(
                                DateFormat('dd.MM.yyyy HH:mm')
                                    .format(widget.dateTime),
                                style: TextStyle(
                                    color: _textColor,
                                    fontSize: (SizeConfig(context, 12)
                                        .getProportionateScreenHeight)),
                              ))
                        ],
                      ),
                    ],
                  ))
            ],
          ),
          if (JwtPayload.myId == widget.authorId)
            Row(
              children: [
                TextButton(
                    onPressed: _onEditButtonTap,
                    child: const Text("Редактировать")),
                TextButton(
                    onPressed: () => _onDeleteButtonTap(widget.newsId),
                    child: const Text("Удалить")),
              ],
            ),
        ],
      ),
    );
  }

  void _onAnswerButtonTap() {
    final _cubit = widget.newsCommentsCubit;

    _cubit.commentInputController.text =
        widget.name != null ? "${widget.name}, " : "";

    _cubit.commentInputController.selection = TextSelection.fromPosition(
        TextPosition(offset: _cubit.commentInputController.text.length));
    _cubit.answerId = widget.id;
    _cubit.focusNode.requestFocus();
  }

  void _onEditButtonTap() {
    final _cubit = widget.newsCommentsCubit;

    _cubit.commentInputController.text = widget.text;
    _cubit.commentInputController.selection = TextSelection.fromPosition(
        TextPosition(offset: _cubit.commentInputController.text.length));

    _cubit.isEditing = true;
    _cubit.editingCommentId = widget.id;
    _cubit.focusNode.requestFocus();
  }

  void _onDeleteButtonTap(int newId) {
    final _cubit = widget.newsCommentsCubit;
    _cubit.deleteComment(widget.id, newId);
  }

  Future<void> _onLike(BuildContext context) async {
    await widget.newsCommentsCubit.like(widget.id).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(_strings.errorOccurred),
        duration: const Duration(seconds: 1),
      ));
      return false;
    }).then((value) {
      if (value) {
        setState(() {
          if (barrelChecked) {
            barrelsCount--;
          } else {
            barrelsCount++;
          }

          barrelChecked = !barrelChecked;
        });
      }
    });
  }
}
