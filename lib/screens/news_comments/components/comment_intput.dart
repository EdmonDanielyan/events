import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_text_input/flutter_native_text_input.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/constants/aseets.dart';
import 'package:ink_mobile/cubit/main_page/news_block_cubit.dart';
import 'package:ink_mobile/cubit/news_comments/news_comments_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/formatters/uppercase_formatter.dart';
import '../../../extensions/list_news_item_data.dart';

class NewsCommentInput extends StatelessWidget {
  NewsCommentInput(
      {Key? key, required this.newsCommentsCubit, required this.newsBlockCubit})
      : super(key: key);
  static late AppLocalizations _strings;
  final NewsBlockCubit newsBlockCubit;
  final NewsCommentsCubit newsCommentsCubit;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Map arg = ModalRoute.of(context)!.settings.arguments as Map;
    int newsId = arg['id'];

    _strings = localizationInstance;

    return SafeArea(
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey[200]!.withOpacity(0.8),
              width: 1.0,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 13.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Platform.isIOS
                    ? Container(
                        padding: const EdgeInsets.only(
                          left: 11.0,
                          right: 28.0,
                          top: 2.0,
                          bottom: 2.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: NativeTextInput(
                          controller: newsCommentsCubit.commentInputController,
                          minLines: 1,
                          maxLines: 5,
                          onChanged: _onChanged,
                          textCapitalization: TextCapitalization.sentences,
                          focusNode: newsCommentsCubit.focusNode,
                          placeholder: _strings.writeCommentHint,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.transparent,
                          ),
                        ),
                      )
                    : TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        focusNode: newsCommentsCubit.focusNode,
                        minLines: 1,
                        maxLines: 5,
                        onChanged: _onChanged,
                        controller: newsCommentsCubit.commentInputController,
                        keyboardType: TextInputType.multiline,
                        inputFormatters: [
                          UpperCaseTextFormatter(),
                        ],
                        decoration: InputDecoration(
                          filled: true,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 13.0),
                          fillColor: Colors.white,
                          hintText: _strings.writeCommentHint,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                      ),
              ),
            ),
            SizedBox(width: 7.0),
            GestureDetector(
              onTap: () async {
                await _onMessageSend(context, newsId);
              },
              child: Container(
                  width: 40,
                  height: 40,
                  child: SvgPicture.asset(SEND_COMMENT_SVG_LINK)),
            ),
            SizedBox(width: 3.0),
          ],
        ),
      ),
    );
  }

  void _onChanged(String value) {
    if (value == '') {
      newsCommentsCubit.answerId = null;
    }
  }

  Future<void> _onMessageSend(BuildContext context, int id) async {
    final getItem = newsBlockCubit.state.data.getItem(id);
    if (getItem != null) {
      final newItem =
          getItem.copyWith(commentCount: (getItem.commentCount ?? 0) + 1);
      newsBlockCubit.updateItem(newItem);
    }

    await newsCommentsCubit.addComment(id).onError((error, stackTrace) {
      String errorMessage;

      if (error is NoConnectionException) {
        errorMessage = _strings.noConnectionError;
      } else {
        errorMessage = _strings.commentSendingError;
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        duration: Duration(seconds: 1),
      ));
    });
  }
}
