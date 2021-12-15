import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/screens/initial/cubit/initial_cubit.dart';
import 'package:ink_mobile/screens/initial/cubit/initial_state.dart';
import 'package:ink_mobile/setup.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = sl<InitialCubit>();
    return Scaffold(
      body: BlocBuilder<InitialCubit, InitialState>(
        bloc: cubit,
        builder: (context, state) {
          switch (state.type) {
            case InitialStateType.ERROR:
              {
                return ErrorRefreshButton(
                  onTap: cubit.refresh,
                  text: state.errorMessage!,
                );
              }

            case InitialStateType.LOAD_MAIN:
              {
                SchedulerBinding.instance?.addPostFrameCallback((_) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/app_layer', (route) => false);
                });

                return Container();
              }

            case InitialStateType.LOAD_WELCOME:
              {
                SchedulerBinding.instance?.addPostFrameCallback((_) {
                  Navigator.popAndPushNamed(context, '/welcome');
                });

                return Container();
              }

            case InitialStateType.LOADING:
              {
                cubit.fetch();

                return Container(child: InkPageLoader());
              }
          }
        },
      ),
    );
  }
}
