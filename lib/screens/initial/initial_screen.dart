import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/functions/chat/open_chat.dart';
import 'package:ink_mobile/providers/push_notification_manager.dart';
import 'package:ink_mobile/screens/initial/cubit/initial_cubit.dart';
import 'package:ink_mobile/screens/initial/cubit/initial_state.dart';
import 'package:ink_mobile/setup.dart';

class InitPage extends StatelessWidget {
  final InitialCubit cubit;

  const InitPage({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<InitialCubit, InitialState>(
        listener: (context, state) async {
          if (state.type == InitialStateType.LOAD_MAIN) {
            Navigator.pushNamedAndRemoveUntil(
                      context, '/app_layer', (route) => false);
            var chat = await sl<PushNotificationManager>().initialChat;
            if (chat != null){
              OpenChat(sl(), chat)();
            }
            return;
          }
          if (state.type == InitialStateType.LOAD_WELCOME) {
            Navigator.popAndPushNamed(context, '/welcome');
          }
        },
        bloc: cubit,
        builder: (context, state) {
          if (state.type == InitialStateType.ERROR)
              {
                return ErrorRefreshButton(
                  onTap: cubit.refresh,
                  text: state.errorMessage!,
                );
              }

          return Container(child: const InkPageLoader());

        },
      ),
    );
  }
}
