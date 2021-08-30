import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/screens/auth/components/auth_buttons.dart';
import 'package:ink_mobile/screens/auth/components/auth_hint.dart';
import 'package:ink_mobile/screens/auth/components/background.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';
import 'package:ink_mobile/cubit/auth/auth_state.dart';
import 'package:ink_mobile/screens/auth/components/auth_title.dart';

import 'auth_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {

          switch (state.type) {
            case (AuthStateType.ERROR):
            case (AuthStateType.LOADED): {
                return Background(
                    child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height,
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AuthTitle(),
                                ],
                              ),
                              AuthForm(),
                              Expanded(
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      AuthHint(),
                                      AuthButtons(),
                                    ],
                                  )
                              )
                            ],
                          ),
                        ],
                      )
                    )
                );
            }

            case (AuthStateType.LOADING): {
              return Container();
            }
          }

          return Container();
      }
    );
  }
}
