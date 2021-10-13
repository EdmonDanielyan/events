import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewBottomNavBarCubit extends Cubit<int> {
  final PageController pageController = PageController();

  NewBottomNavBarCubit({currentIndex = 0}) : super(currentIndex);

  void onPageChanged(int index) {
    emit(index);
  }

  void setOnMainPage() {
    onPageChanged(0);
  }
}
