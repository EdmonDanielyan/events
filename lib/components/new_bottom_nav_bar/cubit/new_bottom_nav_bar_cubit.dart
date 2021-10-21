import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class NewBottomNavBarCubit extends Cubit<int> {
  final PageController pageController = PageController();

  NewBottomNavBarCubit() : super(0);

  void onPageChanged(int index) {
    emit(index);
  }

  void setOnMainPage() {
    onPageChanged(0);
  }
}
