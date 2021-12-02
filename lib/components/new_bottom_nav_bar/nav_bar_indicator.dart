import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/cubit/message_indicator/message_indicator_cubit.dart';

class NavBarIndicator extends StatelessWidget {
  final MessageIndicatorCubit indicatorCubit;
  const NavBarIndicator({Key? key, required this.indicatorCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageIndicatorCubit, int>(
      bloc: indicatorCubit,
      builder: (context, state) {
        if (state == 0) return SizedBox();
        return Positioned(
          top: 1.0,
          right: 0.0,
          child: Icon(
            Icons.brightness_1,
            size: 10.0,
            color: Colors.red[400],
          ),
        );
      },
    );
  }
}
