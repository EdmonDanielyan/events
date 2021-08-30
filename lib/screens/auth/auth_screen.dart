import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/screens/auth/components/body.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
        create: (BuildContext context) => AuthCubit(),
        child: Scaffold(
            appBar: InkAppBar(),
            body: Container(
                child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Body()
                )
            ),
        )
    );
  }
}
