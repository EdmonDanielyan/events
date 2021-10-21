import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/cubit/news_comments/news_comments_cubit.dart';
import 'package:ink_mobile/cubit/news_comments/news_comments_state.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/news_comments/components/comment.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body extends StatefulWidget {
  final NewsCommentsCubit newsCommentsCubit;
  const Body({Key? key, required this.newsCommentsCubit}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late AppLocalizations _strings;
  int countLoad = 0;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;

    return SingleChildScrollView(
      controller: controller,
      child: BlocConsumer<NewsCommentsCubit, NewsCommentState>(
          bloc: widget.newsCommentsCubit,
          listener: (context, state) {
            if (state.type == NewsCommentStateType.LOADED) {
              countLoad += 1;
              if (countLoad > 1) ScrollBottom(controller).scrollSmooth();
            }
          },
          builder: (context, state) {
            widget.newsCommentsCubit.focusNode.unfocus();

            switch (state.type) {
              case NewsCommentStateType.LOADING:
                {
                  var arg = ModalRoute.of(context)!.settings.arguments as Map;

                  var newsId;
                  if (arg.isNotEmpty) {
                    newsId = arg['id'];
                  }

                  widget.newsCommentsCubit.load(newsId);
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
                  List<Widget> items = _buildComments(state.data!);
                  return Container(
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
                        MediaQuery.removePadding(
                          context: context,
                          removeBottom: true,
                          child: ListView.builder(
                            shrinkWrap: true,
                            controller:
                                ScrollController(keepScrollOffset: false),
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
                    onTap: widget.newsCommentsCubit.refresh,
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
          newsCommentsCubit: widget.newsCommentsCubit,
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
              dateTime: childrenComment.timeCreate,
              newsCommentsCubit: widget.newsCommentsCubit,
            ),
          ),
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
