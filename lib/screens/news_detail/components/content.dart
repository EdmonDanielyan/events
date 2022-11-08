import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/components/html.dart';
import 'package:ink_mobile/cubit/news_detail/news_detail_cubit.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

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
          CustomHtml(data: widget.text),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        width: SizeConfig(context, 16)
                            .getProportionateScreenHeight,
                        height: SizeConfig(context, 16)
                            .getProportionateScreenHeight,
                        color: widget.isLiked
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).colorScheme.secondary,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 4),
                        child: Text(
                          widget.likeCount.toString(),
                          style: TextStyle(
                            fontSize: SizeConfig(context, 18.0)
                                .getProportionateScreenHeight,
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
                            width: SizeConfig(context, 14)
                                .getProportionateScreenHeight,
                            height: SizeConfig(context, 14)
                                .getProportionateScreenHeight,
                            color: Color(0xFF757678),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 4),
                            child: Text(
                              widget.commentsCount.toString(),
                              style: TextStyle(
                                fontSize: SizeConfig(context, 18.0)
                                    .getProportionateScreenHeight,
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
