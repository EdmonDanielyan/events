import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/cubit/news_detail/news_detail_cubit.dart';
import 'package:ink_mobile/functions/launch_url.dart';

class Content extends StatefulWidget {
  final int viewCount;
  final int commentsCount;
  final int likeCount;
  final int id;
  final String text;
  final bool isLiked;
  final NewsDetailCubit cubit;
  final void Function() onLike;

  const Content({
    Key? key,
    required this.viewCount,
    required this.commentsCount,
    required this.likeCount,
    required this.id,
    required this.text,
    required this.isLiked,
    required this.cubit,
    required this.onLike,
  }) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(
          horizontal: BorderSide(color: Color(0xFFE5E5E5), width: 1),
        ),
      ),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Html(
            data: widget.text,
            onLinkTap: (
              String? url,
              RenderContext context,
              Map<String, String> attributes,
              _,
            ) {
              launchUrl(url!);
            },
            style: {
              "a": Style(
                  color: Colors.blue, textDecoration: TextDecoration.none),
              "b": Style(fontWeight: FontWeight.normal)
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    widget.onLike();
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(children: [
                      SvgPicture.asset(
                        IconLinks.BARREL_SVG_LINK,
                        width: 14,
                        color: widget.isLiked
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).colorScheme.secondary,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 4),
                        child: Text(
                          widget.likeCount.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: widget.isLiked
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/news_comment',
                          arguments: {'id': widget.id});
                    },
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            IconLinks.COMMENT_SVG_LINK,
                            width: 18,
                            color: Color(0xFF757678),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 4),
                            child: Text(
                              widget.commentsCount.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
