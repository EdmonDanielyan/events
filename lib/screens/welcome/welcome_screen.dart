import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ink_mobile/providers/package_info.dart';
import 'package:ink_mobile/screens/welcome/components/body.dart';

class WelcomeScreen extends StatefulWidget {
  final PackageInfoProvider packageInfoProvider;
  const WelcomeScreen({Key? key, required this.packageInfoProvider})
      : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();

    _clearFCM();
  }

  void _clearFCM() {
    try {
      FirebaseMessaging.instance.deleteToken();
    } catch (_e) {
      //NO INTERNET OR OTHER ERRORS
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        packageInfo: widget.packageInfoProvider,
      ),
    );
  }
}
