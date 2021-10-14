import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/cubit/boot/boot_cubit.dart';
import 'package:ink_mobile/cubit/initial/initial_cubit.dart';
import 'package:ink_mobile/cubit/initial/initial_state.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return BlocProvider<InitialCubit>(
        create: (context) => InitialCubit(languageStrings: _strings),
        child: Scaffold(
          body: BlocBuilder<InitialCubit, InitialState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<InitialCubit>(context);

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
                    final bootCubit = GetIt.I<BootCubit>();
                    bootCubit.load();

                    return Container(child: InkPageLoader());
                  }
              }
            },
          ),
        ));
  }
}
