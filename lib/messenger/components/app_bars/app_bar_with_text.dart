import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/messenger/constants/svg_pictures.dart';

import '../../functions/size_config.dart';
import 'back_btn.dart';

class AppBarWithText extends StatelessWidget with PreferredSizeWidget {
  final BuildContext context;
  final String title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? leading;
  AppBarWithText(
    this.context, {
    Key? key,
    this.title = "",
    this.titleWidget,
    this.actions,
    this.leading,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(
        SizeConfig(context, MediaQuery.of(context).size.width).isTablet
            ? 70
            : kToolbarHeight,
      );

  @override
  Widget build(BuildContext context) {
    BuildContext appBarContext = context;

    return AppBar(
      leading: leading ??
          Builder(
            builder: (context) {
              if (Navigator.of(appBarContext).canPop()) {
                return const AppBarBackBtn();
              } else {
                return Container();
              }
            },
          ),
      flexibleSpace: Container(
        child: SvgPicture.asset(
          SvgPictures.appBarLines,
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
              stops: const [0.0, 1.0],
              tileMode: TileMode.decal),
        ),
      ),
      title: titleWidget ??
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizeConfig(context, 13).getProportionateScreenHeight,
            ),
          ),
      centerTitle: true,
      actions: actions,
    );
  }
}
