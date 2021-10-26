import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/cubit/news_comments/news_comments_cubit.dart';
import 'package:ink_mobile/cubit/news_comments/news_comments_state.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/screens/news_comments/components/comment.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  static late LanguageStrings _strings;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late LanguageStrings _strings;

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    int countLoad = 0;
    ScrollController controller = ScrollController();

    return SingleChildScrollView(
      controller: controller,
      child: BlocConsumer<NewsCommentsCubit, NewsCommentState>(
          listener: (context, state) {
        if (state.type == NewsCommentStateType.LOADED) {
          countLoad += 1;
          if (countLoad > 1) scrollToBottom(controller);
        }
      }, builder: (context, state) {
        final NewsCommentsCubit newsCommentsCubit =
            BlocProvider.of<NewsCommentsCubit>(context);

        switch (state.type) {
          case NewsCommentStateType.LOADING:
            {
              newsCommentsCubit.focusNode.unfocus();
              var arg = ModalRoute.of(context)!.settings.arguments as Map;

              var newsId;
              if (arg.isNotEmpty) {
                newsId = arg['id'];
              }

              newsCommentsCubit.load(newsId);
              return InkPageLoader();
            }

          case NewsCommentStateType.EMPTY:
            {
              return Center(
                child: Text(Body._strings.noCommentsNewsSection),
              );
            }

          case NewsCommentStateType.LOADED:
            {
              List<Widget> items = _buildComments(state.data!);
              return Container(
                decoration: BoxDecoration(color: Colors.white),
                padding:
                    EdgeInsets.only(top: 15, bottom: 25, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 10, bottom: 15),
                      child: Text(
                        _getCommentsTitle(state.data!.commentCount),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    MediaQuery.removePadding(
                      context: context,
                      removeBottom: true,
                      child: ListView.builder(
                        shrinkWrap: true,
                        controller: ScrollController(keepScrollOffset: false),
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) =>
                            items[index],
                      ),
                    ),
                  ],
                ),
              );
            }

          case NewsCommentStateType.ERROR:
            {
              return ErrorRefreshButton(
                onTap: newsCommentsCubit.refresh,
                text: state.errorMessage!,
              );
            }
        }
      }),
    );
  }

  List<Widget> _buildComments(NewsCommentsData data) {
    List<Widget> comments = [];

    data.comments?.forEach((comment) {
      comments.add(
        Comment(
          id: comment.id,
          authorId: comment.authorId,
          avatar: comment.pathToAvatar,
          name: comment.authorName,
          text: comment.comment,
          barrelChecked: comment.barrelsChecked,
          barrelsCount: comment.barrels,
          dateTime: comment.timeCreate,
        ),
      );

      comment.children?.forEach((childrenComment) {
        comments.add(
          Container(
              margin: EdgeInsets.only(left: 25),
              child: Comment(
                  id: childrenComment.id,
                  authorId: childrenComment.authorId,
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
