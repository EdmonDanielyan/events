import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/components/app_bars/back_btn.dart';

class InkAppBarWithText extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Widget? leading;

  static const String APP_BAR_LINES_SVG_LINK = 'assets/images/appbar_lines.svg';

  InkAppBarWithText({
    Key? key,
    required this.title,
    this.leading,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    BuildContext appBarContext = context;

    return AppBar(
      leading: leading ??
          Builder(
            builder: (context) {
              if (Navigator.of(appBarContext).canPop()) {
                return AppBarBackBtn();
              } else {
                return Container();
              }
            },
          ),
      flexibleSpace: Container(
        child: SvgPicture.asset(
          APP_BAR_LINES_SVG_LINK,
          semanticsLabel: 'appbar Line',
          height: MediaQuery.of(context).size.height *
              MediaQuery.of(context).devicePixelRatio,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Theme.of(context).primaryColor, const Color(0xFF182B23)],
              begin: FractionalOffset.centerLeft,
              end: FractionalOffset.centerRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.decal),
        ),
      ),
      title: Container(
        child: Text(
          '$title',
          textAlign: TextAlign.center,
        ),
      ),
      centerTitle: true,
    );
  }
}
