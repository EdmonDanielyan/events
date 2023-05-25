import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/loader/custom_circular_progress_indicator.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/constants/urls.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';
import 'package:ink_mobile/cubit/auth/auth_state.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/providers/local_pin_provider.dart';
import 'package:ink_mobile/routes/pass_data_routes.dart';
import 'package:ink_mobile/screens/auth/auth_screen.dart';
import 'package:ink_mobile/screens/auth/components/sign_in_instructions.dart';
import 'package:ink_mobile/components/buttons/default_button.dart';
import 'package:logging/logging.dart';

class AuthButtons extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String? errorMessage;

  const AuthButtons({
    Key? key,
    required this.formKey,
    this.errorMessage,
  }) : super(key: key);

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
    });
  }

  @override
  Widget build(BuildContext context) {
    authCubit = AuthScreen.of(context).authCubit;
    _bottomNavBar = AuthScreen.of(context).newBottomNavBarCubit;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (widget.errorMessage != null) ...[
            Text(
              widget.errorMessage!,
              style: FontStyles.rubikP3Medium(color: Palette.redF1C),
            ),
            const SizedBox(height: 20.0,),
          ],
          btnWidget(context),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: DefaultLinkButton(
              txtColor: Palette.greenE4A,
              link: UrlsConfig.signInInstructionUrl,
            ),
          ),
        ],
      ),
    );
  }

  Widget btnWidget(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      bloc: authCubit,
      builder: (BuildContext context, state) {
        if (state.type == AuthStateType.LOADING) {
          return CustomCircularProgressIndicator();
        } else {
          return Column(
            children: [
              DefaultButton(
                title: localizationInstance.enter,
                onTap: () {
                  logger.finest(widget.formKey.currentState);
                  if (widget.formKey.currentState!.validate())
                    onSubmit(context);
                },
                buttonColor: Palette.greenE4A,
                textColor: Palette.white,
              ),
              const SizedBox(height: 20.0),
              DefaultButton(
                title: localizationInstance.registration,
                onTap: () {
                  launchUrl('https://portal.irkutskoil.ru/login/?act=register');
                },
                buttonColor: Palette.transparent,
                textColor: Palette.greenE4A,
                borderColor: Palette.greenE4A,
              ),
            ],
          );
        }
      },
    );
  }
}
