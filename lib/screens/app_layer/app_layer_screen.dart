import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/functions/new_bottom_nav_bar_mixin.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/handlers/deeplink_handler.dart';
import 'package:ink_mobile/handlers/push_tap_handler.dart';

class AppLayerScreen extends StatefulWidget {
  final NewBottomNavBarCubit newBottomNavBarCubit;
  const AppLayerScreen({Key? key, required this.newBottomNavBarCubit})
      : super(key: key);

  @override
  State<AppLayerScreen> createState() => _AppLayerScreenState();
}

class _AppLayerScreenState extends State<AppLayerScreen>
    with NewBottomNavBarMixin, Loggable {
  final _navigatorKey = GlobalKey<NavigatorState>();
  StreamSubscription<Uri>? _linkSubscription;
  late AppLinks _appLinks;

  @override
  void initState() {
    super.initState();
    if (!PushTapHandler.isSubscribed) {
      PushTapHandler.subscribe();
    }
    initDeepLinks();
  }

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();
    final appLink = await _appLinks.getInitialAppLink();
    if (appLink != null) {
      DeepLinkHandler.catchLink(appLink.toString(), context);
    }
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      DeepLinkHandler.catchLink(appLink.toString(), context);
    });
  }

  void openAppLink(Uri uri) {
    _navigatorKey.currentState?.pushNamed(uri.fragment);
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = getScreens();
    return Offstage(
      offstage: ModalRoute.of(context)?.settings.name != "/app_layer",
      child: Scaffold(
        body: PageView(
          controller: widget.newBottomNavBarCubit.pageController,
          children: _screens,
          onPageChanged: widget.newBottomNavBarCubit.onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: const NewBottomNavBar(),
      ),
    );
  }
}
