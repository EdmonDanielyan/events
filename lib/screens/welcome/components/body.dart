import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/screens/welcome/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    'Добро пожаловать в ИНК-Портал!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontStyle: FontStyle.normal),
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
                            'Авторизация',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                  Size(335, 50)
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  )
                              )
                          )
                      ),
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
                                  )
                              )
                          ),
                          TextButton(
                              onPressed: () {
                                launchUrl('https://portal.irkutskoil.ru/');
                              },
                              child: Opacity(
                                  opacity: 0.6,
                                  child: Text(
                                    'Инструкция по входу',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      decoration: TextDecoration.underline,
                                    ),
                                  )
                              )
                          ),
                          Expanded(
                              child: Container(
                                  width: 100,
                                  child: Divider(
                                    color: Colors.white,
                                    thickness: 1,
                                    indent: 24,
                                    endIndent: 15,
                                  )
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
    );
  }
}
