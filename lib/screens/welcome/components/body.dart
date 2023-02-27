import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/components/layout_builder/layout_builder.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/important_urls.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/constants/urls.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/providers/package_info.dart';
import 'package:ink_mobile/screens/auth/components/sign_in_instructions.dart';
import 'package:ink_mobile/screens/welcome/components/auth_btn.dart';
import 'package:ink_mobile/screens/welcome/components/background.dart';
import 'package:ink_mobile/setup.dart';
import 'package:ink_mobile/utils/app_config.dart';

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
    return CustomLayoutBuilder(
      builder: (context, constraints, isTablet) {
        return Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.17),
              Container(
                width: size.width * 0.60,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/logo.svg',
                      semanticsLabel: 'INK Logo',
                      height: size.height * 0.15,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      _strings.welcomeTxt,
                      textAlign: TextAlign.center,
                      style: FontStyles.rubikH2(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 48.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DefaultButton(
                        title: _strings.signIn,
                        onTap: () => Navigator.pushNamed(context, '/auth'),
                        isTablet: isTablet,
                        buttonColor: Palette.green66E,
                        textColor: Palette.white,
                      ),
                      const SizedBox(height: 20.0),
                      DefaultButton(
                        title: _strings.registration,
                        onTap: () {
                          launchUrl(
                              'https://portal.irkutskoil.ru/login/?act=register');
                        },
                        isTablet: isTablet,
                        buttonColor: Palette.transparent,
                        textColor: Palette.white,
                        borderColor: Palette.white,
                      ),
                      const SizedBox(height: 24.0),
                      DefaultLinkButton(
                        link: UrlsConfig.signInInstructionUrl,
                      ),
                      const SizedBox(height: 10.0),
                      DefaultLinkButton(
                        txt: _strings.confPolicy,
                        link: ImportantUrls.policyConf,
                      ),
                      if (currentEnv == Environment.dev) ...[
                        SizedBox(height: 10.0,),
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
                          ],
                        ),
                      ]
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
