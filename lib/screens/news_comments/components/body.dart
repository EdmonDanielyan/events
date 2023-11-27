import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/cubit/news_comments/news_comments_cubit.dart';
import 'package:ink_mobile/cubit/news_comments/news_comments_state.dart';
import 'package:ink_mobile/functions/plural.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/screens/news_comments/components/comment.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body extends StatefulWidget {
  final NewsCommentsCubit newsCommentsCubit;
  const Body({Key? key, required this.newsCommentsCubit}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late AppLocalizations _strings;
  int countLoad = 0;
  ScrollController controller = ScrollController();
  int? newsId;

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
            switch (state.type) {
              case NewsCommentStateType.LOADING:
                {
                  widget.newsCommentsCubit.focusNode.unfocus();
                  var arg = ModalRoute.of(context)!.settings.arguments as Map;

                  if (arg.isNotEmpty) {
                    newsId = arg['id'];
                  }

                  widget.newsCommentsCubit.load(newsId!);
                  return const InkPageLoader();
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
                  final commentsCount = state.data!.commentCount;
                  return ColoredBox(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 25, left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 10, bottom: 15),
                            child: Text(
                              "$commentsCount ${Plural(commentsCount).declense(_strings.oneCommentNoun.toUpperCase(), _strings.multipleCommentsNoun.toUpperCase(), _strings.lotOfCommentsNoun.toUpperCase())}",
                              style: TextStyle(
                                  fontSize: SizeConfig(context, 20)
                                      .getProportionateScreenHeight,
                                  fontWeight: FontWeight.w500),
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
    if (newsId == null) {
      var arg = ModalRoute.of(context)!.settings.arguments as Map;

      if (arg.isNotEmpty) {
        newsId = arg['id'];
      }
    }

    List<Widget> comments = [];

    data.comments?.forEach((comment) {
      String? name = comment.authorName;
      String? lastName = comment.authorLastName;

      comments.add(
        Comment(
          id: comment.id,
          authorId: comment.authorId,
          avatar: comment.pathToAvatar,
          name: name != null && lastName != null ? "$lastName $name" : name,
          text: comment.comment,
          barrelChecked: comment.barrelsChecked,
          barrelsCount: comment.barrels,
          dateTime: comment.timeCreate,
          newsCommentsCubit: widget.newsCommentsCubit,
          newsId: newsId!,
        ),
      );

      comment.children?.forEach((childrenComment) {
        String? name = childrenComment.authorName;
        String? lastName = childrenComment.authorLastName;

        comments.add(
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Comment(
              id: childrenComment.id,
              authorId: childrenComment.authorId,
              avatar: childrenComment.pathToAvatar,
              name: name != null && lastName != null ? "$lastName $name" : name,
              text: childrenComment.comment,
              barrelChecked: childrenComment.barrelsChecked,
              barrelsCount: childrenComment.barrels,
              dateTime: childrenComment.timeCreate,
              newsCommentsCubit: widget.newsCommentsCubit,
              newsId: newsId!,
            ),
          ),
        );
      });
    });

    return comments;
  }
}
