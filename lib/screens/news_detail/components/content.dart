import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/components/html.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/cubit/news_detail/news_detail_cubit.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/components/buttons/default_button.dart';

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
          border: Border(top: BorderSide(color: Palette.text20Grey))),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 24.0, bottom: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomHtml(data: widget.text),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultButton(
                  title: widget.likeCount.toString(),
                  icon: SvgPicture.asset(
                    IconLinks.BARREL_SVG_LINK,
                    width: 20.0,
                    height: 20.0,
                    color: Palette.greenE4A,
                  ),
                  textColor: Palette.greenE4A,
                  borderColor: Palette.greenE4A,
                  buttonColor: Palette.transparent,
                  width: MediaQuery.of(context).size.width * 0.42,
                  onTap: widget.onLike,
                ),
                DefaultButton(
                  title: widget.commentsCount.toString(),
                  icon: SvgPicture.asset(
                    IconLinks.COMMENT_ICON_LINK,
                    width: 20.0,
                    height: 20.0,
                    color: Palette.greenE4A,
                  ),
                  textColor: Palette.greenE4A,
                  borderColor: Palette.greenE4A,
                  buttonColor: Palette.transparent,
                  width: MediaQuery.of(context).size.width * 0.42,
                  onTap: () {
                    Navigator.pushNamed(context, '/news_comment',
                        arguments: {'id': widget.id});
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
