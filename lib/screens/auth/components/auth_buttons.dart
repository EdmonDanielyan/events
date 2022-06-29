import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/loader/custom_circular_progress_indicator.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart';
import 'package:ink_mobile/components/snackbar/custom_snackbar.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';
import 'package:ink_mobile/cubit/auth/auth_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/providers/local_pin_provider.dart';
import 'package:ink_mobile/routes/pass_data_routes.dart';
import 'package:ink_mobile/screens/auth/auth_screen.dart';
import 'package:ink_mobile/screens/auth/components/sign_in_instructions.dart';
import 'package:logging/logging.dart';

class AuthButtons extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const AuthButtons({Key? key, required this.formKey}) : super(key: key);

  @override
  State<AuthButtons> createState() => _AuthButtonsState();
}

class _AuthButtonsState extends State<AuthButtons> {
  static final logger = Logger('AuthButtons');
  static late AuthCubit authCubit;
  static late NewBottomNavBarCubit _bottomNavBar;
  bool hasPin = false;

  Future<void> _goToHome(BuildContext context) async {
    Navigator.pushNamedAndRemoveUntil(context, '/app_layer', (route) => false);
  }

  @override
  void initState() {
    super.initState();
    _checkPin();
  }

  Future<bool> _checkPin() async {
    hasPin = await LocalPinProvider().isPinAvailable();

    return hasPin;
  }

  void onSubmit(BuildContext context) {
    authCubit.auth().then((success) {
      if (success) {
        _bottomNavBar.setOnMainPage();
        if (!hasPin) {
          PassDataRoutes.setPin(context, onComplete: _goToHome);
        } else {
          _goToHome(context);
        }
      }
    }).onError((FormatException e, s) {
      logger.severe('Error during auth', e, s);
      SimpleCustomSnackbar(
          context: context,
          txt: e.message,
          duration: const Duration(seconds: 10));
    });
  }

  @override
  Widget build(BuildContext context) {
    authCubit = AuthScreen.of(context).authCubit;
    _bottomNavBar = AuthScreen.of(context).newBottomNavBarCubit;
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          btnWidget(context),
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
                  ),
                ),
              ),
              SignInInstructions(txtColor: Color(0xFF1D2126)),
              Expanded(
                child: Container(
                  width: 100,
                  child: Divider(
                    color: Color(0xffe5e5e5),
                    thickness: 1,
                    indent: 5,
                    endIndent: 8,
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }

  Widget btnWidget(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      bloc: authCubit,
      builder: (BuildContext context, state) {
        if (state.type == AuthStateType.LOADING) {
          return CustomCircularProgressIndicator();
        } else {
          return Container(
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
                logger.finest(widget.formKey.currentState);
                if (widget.formKey.currentState!.validate()) onSubmit(context);
              },
              child: Text(
                localizationInstance.enter,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                shadowColor:
                    MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFF3F3F3)),
                minimumSize: MaterialStateProperty.all<Size>(Size(335, 50)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
