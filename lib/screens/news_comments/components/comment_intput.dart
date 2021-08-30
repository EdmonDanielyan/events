import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/cubit/news_comments/news_comments_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';

class NewsCommentInput extends StatelessWidget {
  NewsCommentInput({Key? key}) : super(key: key);
  static const String SEND_COMMENT_SVG_LINK =
      'assets/images/send_comment.svg';

  static const String WRITE_COMMENT = 'Написать комментарий...';

  static const String COMMENT_SENDING_ERROR =
      'Произошла ошибка при отправке комментария';

  late NewsCommentsCubit _cubit;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Map arg = ModalRoute.of(context)!.settings.arguments as Map;
    int newsId = arg['id'];

    _cubit = BlocProvider.of<NewsCommentsCubit>(context);

    return Container(
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              offset: Offset(1.0, 20.0),
              blurRadius: 30.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: 100
                  ),
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 15,
                          top: 10,
                          bottom: 10
                      ),
                      child: TextField(
                          controller: _cubit.commentInputController,
                          keyboardType: TextInputType.multiline,
                          focusNode: _cubit.focusNode,
                          minLines: 1,
                          maxLines: 5,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1000)
                          ],
                          style: TextStyle(),
                          onChanged: (String value) {
                            _onChanged(value);
                          },
                          decoration: InputDecoration(
                              filled: true,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 25
                              ),  // Added this
                              fillColor: Colors.white,
                              hintText: WRITE_COMMENT,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(30)
                                  )
                              )
                          )
                      )
                  )
              ),
            ),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () async {
                    await _onMessageSend(context, newsId);
                  },
                  child: Container(
                      width: 40,
                      height: 40,
                      child: SvgPicture.asset(
                          SEND_COMMENT_SVG_LINK
                      )
                  ),
                )
            )
          ],
        )
    );
  }

  void _onChanged(String value) {
    print(value);
    if (value == '') {
      _cubit.answerId = null;
    }
  }

  Future<void> _onMessageSend(BuildContext context, int id) async {
    final NewsCommentsCubit newsCommentsCubit =
    BlocProvider.of<NewsCommentsCubit>(context);

    await newsCommentsCubit
        .addComment(id)
        .onError((error, stackTrace) {
      String errorMessage;

      if (error is NoConnectionException) {
        errorMessage = ErrorMessages.NO_CONNECTION_ERROR_MESSAGE;
      } else {
        errorMessage = COMMENT_SENDING_ERROR;
      }

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                errorMessage
            ),
            duration: Duration(seconds: 1),
          )
      );
    });
  }

}
