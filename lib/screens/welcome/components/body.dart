import 'package:flutter/foundation.dart';
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
import 'package:ink_mobile/providers/package_info.dart';
import 'package:ink_mobile/screens/auth/components/sign_in_instructions.dart';
import 'package:ink_mobile/components/buttons/default_button.dart';
import 'package:ink_mobile/screens/welcome/components/background.dart';
import 'package:ink_mobile/setup.dart';

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
                      style: FontStyles.rubikH2(color: Palette.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 48.0),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                      defaultTargetPlatform == TargetPlatform.iOS?
                      TextButton(
                        onPressed: () {
                          launchUrl(
                              'https://portal.irkutskoil.ru/login/%D0%98%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D1%8F%20%D0%BF%D0%BE%20%D1%80%D0%B5%D0%B3%D0%B8%D1%81%D1%82%D1%80%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%20%D0%98%D0%9D%D0%9A%20%D0%BF%D0%BE%D1%80%D1%82%D0%B0%D0%BB%D0%B5.pdf',
                              formatUrl: false);
                        },
                        child: Text(
                          'Инструкция по входу',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isTablet ? 20 : 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                      :TextButton(
                        onPressed: () {
                          launchUrl(
                              'https://portal.irkutskoil.ru/login/?act=register');
                        },
                        isTablet: isTablet,
                        buttonColor: Palette.transparent,
                        textColor: Palette.white,
                        borderColor: Palette.white,
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
                  defaultTargetPlatform != TargetPlatform.iOS? Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SignInInstructions(),
                  ):SizedBox(),
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
