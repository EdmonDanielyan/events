import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/models/auth_form_data.dart';

class AuthButtons extends StatelessWidget {
  const AuthButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    Size size = MediaQuery.of(context).size;

    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: Offset(0, 15),
                    ),
                  ],
                ),
                child: TextButton(
                    onPressed: () {
                      authCubit
                        .auth()
                        .then((success) {
                          if (success) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/main',
                                    (route) => false
                            );
                          }
                        })
                        .onError((FormatException error, st) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  'Ошибка!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                                content: Text(error.message),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                actions: [
                                  TextButton(
                                    child: Text(
                                      'Закрыть',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      maxLines: 1,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            }
                          );
                        })
                      ;
                    },
                    child: Text(
                      'Вход',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all<Color>(
                            Color(0xFFFFFFFF)
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFFF3F3F3)
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                            Size(335, 50)
                        ),
                        shape: MaterialStateProperty
                          .all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            )
                          )
                    )
                )
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              children: [
                Expanded(
                    child: Container(
                        width: 100,
                        child: Divider(
                          color: Color(0xffe5e5e5),
                          thickness: 1,
                          indent: 5,
                          endIndent: 8,
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
                            color: Color(0xFF1D2126),
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                          ),
                        )
                    )
                ),
                Expanded(
                    child: Container(
                        width: 100,
                        child: Divider(
                          color: Color(0xffe5e5e5),
                          thickness: 1,
                          indent: 5,
                          endIndent: 8,
                        )
                    )
                ),
              ],
            ),
          ],
        )
    );
  }
}
