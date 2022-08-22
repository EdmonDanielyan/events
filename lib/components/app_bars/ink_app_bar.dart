import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

import '../../messenger/functions/size_config.dart';

class InkAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool showPersonalPageLink;
  final BuildContext context;
  const InkAppBar(
    this.context, {
    Key? key,
    this.showPersonalPageLink = false,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(
        SizeConfig(context, MediaQuery.of(context).size.width).isTablet
            ? 70
            : kToolbarHeight,
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
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
            return Container();
          }
        },
      ),
      flexibleSpace: Container(
        child: SvgPicture.asset(
          'assets/images/appbar_lines.svg',
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
      title: Row(
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
            padding: EdgeInsets.all(10.0),
            child: Text(
              localizationInstance.appName,
              style: TextStyle(
                fontSize:
                    SizeConfig(context, 17.0).getProportionateScreenHeight,
              ),
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: getActions(context),
    );
  }

  List<Widget> getActions(BuildContext context) {
    List<Widget> actions = [];

    if (showPersonalPageLink) {
      actions.add(Container(
        margin: EdgeInsets.only(right: 15.0),
        child: InkWell(
          child: SvgPicture.asset(
            'assets/images/personal_page_link.svg',
            height: SizeConfig(context, 27.0).getProportionateScreenHeight,
          ),
          onTap: () {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pushNamed(context, '/personal');
            });
          },
        ),
      ));
    }

    return actions;
  }
}
