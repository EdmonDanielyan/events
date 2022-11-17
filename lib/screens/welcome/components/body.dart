import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/components/layout_builder/layout_builder.dart';
import 'package:ink_mobile/constants/important_urls.dart';
import 'package:ink_mobile/constants/urls.dart';
import 'package:ink_mobile/core/logging/send_log.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/providers/package_info.dart';
import 'package:ink_mobile/screens/auth/components/sign_in_instructions.dart';
import 'package:ink_mobile/screens/welcome/components/auth_btn.dart';
import 'package:ink_mobile/screens/welcome/components/background.dart';
import 'package:ink_mobile/setup.dart';

import '../../../components/webview_screen.dart';

class Body extends StatefulWidget {
  final PackageInfoProvider packageInfo;
  const Body({Key? key, required this.packageInfo}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int tapCount = 0;
  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    Size size = MediaQuery.of(context).size;
    return CustomLayoutBuilder(builder: (context, constraints, isTablet) {
      return Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.17),
            Container(
              width: size.width * 0.60,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/images/logo.svg',
                      semanticsLabel: 'INK Logo',
                      height: size.height * 0.15,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    _strings.welcomeTxt,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:
                          SizeConfig(context, 21).getProportionateScreenHeight,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AuthBtn(
                    title: _strings.signIn,
                    onTap: () => Navigator.pushNamed(context, '/auth'),
                    isTablet: isTablet,
                  ),
                  const SizedBox(height: 20.0),
                  AuthBtn(
                    title: _strings.aboutCompany,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => WebviewScreen(
                          UrlsConfig.aboutCompany,
                          title: _strings.aboutCompany,
                        ),
                      ),
                    ),
                    isTablet: isTablet,
                  ),
                  SizedBox(height: size.height * 0.01),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                              width: isTablet ? 150 : 100,
                              child: Divider(
                                color: Colors.white,
                                thickness: 1,
                                indent: 24,
                                endIndent: 15,
                              ))),
                      TextButton(
                        onPressed: () {
                          launchUrl(
                              'https://portal.irkutskoil.ru/login/?act=register');
                        },
                        child: Text(
                          _strings.registration,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isTablet ? 20 : 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                              width: isTablet ? 150 : 100,
                              child: Divider(
                                color: Colors.white,
                                thickness: 1,
                                indent: 24,
                                endIndent: 15,
                              ))),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  SignInInstructions(),
                  const SizedBox(height: 10.0),
                  SignInInstructions(
                    txt: _strings.techSupport,
                    link: UrlsConfig.supportUrl,
                  ),
                  const SizedBox(height: 10.0),
                  SignInInstructions(
                    txt: _strings.confPolicy,
                    link: ImportantUrls.policyConf,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Center(
                        child: Text(
                          widget.packageInfo.version,
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: isTablet ? 17.0 : 13),
                        ),
                      ),
                      if (kDebugMode) ...[
                        Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                                onPressed: () => sendErrorLog(
                                    getIt(instanceName: "logFile")),
                                icon: Icon(Icons.bug_report)))
                      ],
                    ],
                  ),
                ],
              ),
            )),
          ],
        ),
      );
    });
  }
}
