import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/cubit/news_comments/news_comments_cubit.dart';
import 'package:ink_mobile/cubit/news_comments/news_comments_state.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/screens/news_comments/components/comment.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  static late LanguageStrings _strings;

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return BlocBuilder<NewsCommentsCubit, NewsCommentState>(
        builder: (context, state) {
      final NewsCommentsCubit newsCommentsCubit =
          BlocProvider.of<NewsCommentsCubit>(context);

      newsCommentsCubit.focusNode.unfocus();

      switch (state.type) {
        case NewsCommentStateType.LOADING:
          {
            var arg = ModalRoute.of(context)!.settings.arguments as Map;

            var newsId;
            if (arg != null) {
              newsId = arg['id'];
            }

            newsCommentsCubit.load(newsId);
            return InkPageLoader();
          }

        case NewsCommentStateType.EMPTY:
          {
            return Center(
              child: Text(_strings.noCommentsNewsSection),
            );
          }

        case NewsCommentStateType.LOADED:
          {
            return Container(
                margin: EdgeInsets.only(bottom: 40),
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    padding: EdgeInsets.only(
                        top: 15, bottom: 25, left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(top: 20, left: 10, bottom: 15),
                          child: Text(
                            _getCommentsTitle(state.data!.commentCount),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Column(children: _buildComments(state.data!))
                      ],
                    ),
                  ),
                ));
          }

        case NewsCommentStateType.ERROR:
          {
            return ErrorRefreshButton(
              onTap: newsCommentsCubit.refresh,
              text: state.errorMessage!,
            );
          }
      }
    });
  }

  List<Widget> _buildComments(NewsCommentsData data) {
    List<Widget> comments = [];

    data.comments?.forEach((comment) {
      comments.add(
        Comment(
            id: comment.id,
            avatar: comment.pathToAvatar,
            name: comment.authorName,
            text: comment.comment,
            barrelChecked: comment.barrelsChecked,
            barrelsCount: comment.barrels,
            dateTime: comment.timeCreate),
      );

      comment.children?.forEach((childrenComment) {
        comments.add(
          Container(
              margin: EdgeInsets.only(left: 25),
              child: Comment(
                  id: childrenComment.id,
                  avatar: childrenComment.pathToAvatar,
                  name: childrenComment.authorName,
                  text: childrenComment.comment,
                  barrelChecked: childrenComment.barrelsChecked,
                  barrelsCount: childrenComment.barrels,
                  dateTime: childrenComment.timeCreate)),
        );
      });
    });

    return comments;
  }

  String _getCommentsTitle(int commentCount) {
    String title;
    if (commentCount == 1) {
      title = " ${_strings.oneCommentNoun.toUpperCase()}";
    } else if (commentCount > 1 && commentCount <= 4) {
      title = " ${_strings.multipleCommentsNoun.toUpperCase()}";
    } else {
      title = " ${_strings.lotOfCommentsNoun.toUpperCase()}";
    }

    return commentCount.toString() + title;
  }
}
