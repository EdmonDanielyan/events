import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/cubit/news_detail/news_detail_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';


class Content extends StatefulWidget {
  final int viewCount;
  final int commentsCount;
  int likeCount;
  final int id;
  final String text;
  bool isLiked;
  late NewsDetailCubit cubit;

  Content({
    Key? key,
    required this.viewCount,
    required this.commentsCount,
    required this.likeCount,
    required this.id,
    required this.text,
    required this.isLiked
  }) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    widget.cubit = BlocProvider.of<NewsDetailCubit>(context);

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.symmetric(horizontal: BorderSide(color: Color(0xFFE5E5E5), width: 1))
      ),
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.only(bottom: 35),
      child: Column(
        children: [
          Html(data: widget.text),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await _onLike(context);
                        setState(() {});
                      },
                      child: Container(
                        color: Colors.white,
                        child: Row(
                        children: [
                          SvgPicture.asset(
                            IconLinks.BARREL_SVG_LINK,
                            color: widget.isLiked
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).accentColor,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 4),
                              child: Text(
                                  widget.likeCount.toString(),
                                  style: TextStyle(
                                    color: widget.isLiked
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context).accentColor,
                                  )
                                )
                            )
                          ]
                        )
                      )
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 24),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context,
                                  '/news_comment',
                                  arguments: {'id': widget.id}
                              );
                            },
                            child: Container(
                              color: Colors.white,
                              child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        IconLinks.COMMENT_SVG_LINK
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 4),
                                        child: Text(
                                            widget.commentsCount.toString(),
                                            style: TextStyle(
                                              color: Theme.of(context).accentColor,
                                            )
                                        )
                                    )
                                  ]
                              ),
                            )
                        )
                    ),
                    Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  IconLinks.VIEW_COUNT_SVG_LINK,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 4),
                                  child: Text(
                                      widget.viewCount.toString(),
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                      )
                                  )
                                )
                              ]
                            )
                          ]
                        )
                    )
                  ]
              )
          )
        ],
      ),
    );
  }

  Future<void> _onLike(BuildContext context) async {
    await widget.cubit
        .like(widget.id)
        .onError((error, stackTrace) {
          String message;

          if (error is NoConnectionException) {
            message = ErrorMessages.NO_CONNECTION_ERROR_MESSAGE;
          } else {
            message = ErrorMessages.SIMPLE_ERROR_MESSAGE;
          }

          ScaffoldMessenger.of(context)
              .showSnackBar(
                SnackBar(
                  content: Text(
                      message
                  ),
                  duration: Duration(
                      seconds: 1
                  ),
                )
              );
          return false;
        })
        .then((value) {
          if (value) {
            if (widget.isLiked) {
              widget.likeCount--;
            } else {
              widget.likeCount++;
            }

            widget.isLiked = !widget.isLiked;
          }
        });
  }
}