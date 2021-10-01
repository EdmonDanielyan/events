import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/cubit/news_comments/news_comments_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';

class NewsCommentInput extends StatelessWidget {
  NewsCommentInput({Key? key}) : super(key: key);
  static const String SEND_COMMENT_SVG_LINK = 'assets/images/send_comment.svg';
  static late LanguageStrings _strings;
  static late NewsCommentsCubit _cubit;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Map arg = ModalRoute.of(context)!.settings.arguments as Map;
    int newsId = arg['id'];

    _cubit = BlocProvider.of<NewsCommentsCubit>(context);

    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;

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
                child: TextField(
                  controller: _cubit.commentInputController,
                  keyboardType: TextInputType.multiline,
                  focusNode: _cubit.focusNode,
                  minLines: 1,
                  maxLines: 5,
                  inputFormatters: [LengthLimitingTextInputFormatter(1000)],
                  style: TextStyle(),
                  onChanged: (String value) {
                    _onChanged(value);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 13.0),
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
      _cubit.answerId = null;
    }
  }

  Future<void> _onMessageSend(BuildContext context, int id) async {
    final NewsCommentsCubit newsCommentsCubit =
        BlocProvider.of<NewsCommentsCubit>(context);

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
