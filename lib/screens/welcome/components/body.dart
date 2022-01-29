import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/core/logging/send_log.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/providers/package_info.dart';
import 'package:ink_mobile/screens/auth/components/sign_in_instructions.dart';
import 'package:ink_mobile/screens/welcome/components/background.dart';
import 'package:ink_mobile/setup.dart';

class Body extends StatefulWidget {
  final PackageInfoProvider packageInfo;
  const Body({Key? key, required this.packageInfo}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    Size size = MediaQuery.of(context).size;
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
                Text(
                  _strings.welcomeTxt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
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
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/auth');
                    },
                    child: Text(
                      _strings.signIn,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(335, 50)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )))),
                SizedBox(height: size.height * 0.01),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            width: 100,
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
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        )),
                    // SignInInstructions(),
                    Expanded(
                        child: Container(
                            width: 100,
                            child: Divider(
                              color: Colors.white,
                              thickness: 1,
                              indent: 24,
                              endIndent: 15,
                            ))),
                  ],
                ),
                Container(
                  child: SignInInstructions(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.packageInfo.version,
                      style: TextStyle(color: Colors.grey[400], fontSize: 13.0),
                    ),
                    IconButton(onPressed: () => sendErrorLog(sl(instanceName: "logFile")), icon: Icon(Icons.bug_report))
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
