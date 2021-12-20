import 'package:flutter/material.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/screens/auth/components/body.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';

class AuthScreen extends StatefulWidget {
  static AuthScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<AuthScreenState>()!;

  final AuthCubit authCubit;
  final ChatDatabaseCubit chatDatabaseCubit;
  final NewBottomNavBarCubit newBottomNavBarCubit;
  const AuthScreen({
    Key? key,
    required this.authCubit,
    required this.newBottomNavBarCubit,
    required this.chatDatabaseCubit,
  }) : super(key: key);

  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  AuthCubit get authCubit => widget.authCubit;
  ChatDatabaseCubit get chatDatabaseCubit => widget.chatDatabaseCubit;
  NewBottomNavBarCubit get newBottomNavBarCubit => widget.newBottomNavBarCubit;

  void _cleanDatabase() async {
    await chatDatabaseCubit.db.deleteEverything();
  }

  @override
  void initState() {
    super.initState();

    _cleanDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InkAppBar(),
      body: Container(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Body(),
        ),
      ),
    );
  }
}
