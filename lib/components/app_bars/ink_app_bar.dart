import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

import '../../messenger/functions/size_config.dart';

class InkAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showPersonalPageLink;
  final BuildContext context;
  final Widget? leading;
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? image;
  const InkAppBar(
    this.context, {
    Key? key,
    this.showPersonalPageLink = false,
    this.leading,
    this.title,
    this.titleWidget,
    this.actions,
    this.image,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(
        SizeConfig(context, MediaQuery.of(context).size.width).isTablet
            ? 70
            : kToolbarHeight,
      );

  @override
  Widget build(BuildContext context) {
    Widget? displayingTitle = titleWidget;
    if (title != null) {
      displayingTitle ??= Text(
        title!,
        textAlign: TextAlign.center,
        style: FontStyles.rubikP1(color: Palette.white),
      );
    } else {
      displayingTitle ??= Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/logo.svg',
            semanticsLabel: 'INK Logo',
            width: SizeConfig(context, 28).getProportionateScreenHeight,
          ),
          const SizedBox(width: 10.0),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              localizationInstance.appName,
              style: FontStyles.rubikP1(color: Palette.white),
            ),
          ),
        ],
      );
    }
    return AppBar(
      leading: leading ??
          Builder(
            builder: (context) {
              if (Navigator.of(context).canPop()) {
                return IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: SizeConfig(context, 20).getProportionateScreenHeight,
                  ),
                  onPressed: () => Navigator.of(context).maybePop(),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Theme.of(context).primaryColor, const Color(0xFF182B23)],
              begin: FractionalOffset.centerLeft,
              end: FractionalOffset.centerRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.decal),
        ),
        child: image ??
            SvgPicture.asset(
              'assets/images/appbar_lines.svg',
              semanticsLabel: 'appbar Line',
              height: MediaQuery.of(context).size.height *
                  MediaQuery.of(context).devicePixelRatio,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
      ),
      title: displayingTitle,
      centerTitle: true,
      actions: actions ?? getActions(),
    );
  }

  List<Widget> getActions() {
    List<Widget> actions = [];

    if (showPersonalPageLink) {
      actions.add(
        Container(
          margin: const EdgeInsets.only(right: 15.0),
          child: InkWell(
            child: SvgPicture.asset(
              IconLinks.USER_ICON_LINK,
              height: 24.0,
              width: 24.0,
              color: Palette.white,
            ),
            onTap: () {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.pushNamed(context, '/personal');
              });
            },
          ),
        ),
      );
    }

    return actions;
  }
}
