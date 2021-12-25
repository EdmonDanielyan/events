import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/cubit/news_detail/news_detail_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Content extends StatefulWidget {
  final int viewCount;
  final int commentsCount;
  final int likeCount;
  final int id;
  final String text;
  final bool isLiked;
  final NewsDetailCubit cubit;

  const Content({
    Key? key,
    required this.viewCount,
    required this.commentsCount,
    required this.likeCount,
    required this.id,
    required this.text,
    required this.isLiked,
    required this.cubit,
  }) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  late AppLocalizations _strings;

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;

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
            style: {
              "a": Style(
                  color: Colors.black, textDecoration: TextDecoration.none),
              "b": Style(fontWeight: FontWeight.normal)
            },
          ),
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

  Future<void> _onLike(BuildContext context) async {
    await widget.cubit.like(widget.id).onError((error, stackTrace) {
      String message;

      if (error is NoConnectionException) {
        message = _strings.noConnectionError;
      } else {
        message = _strings.errorOccurred;
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
      ));
      return false;
    });
  }
}
