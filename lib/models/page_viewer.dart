import 'package:flutter/material.dart';

class PageViewer {
  final PageController pageController;
  final int currentIndex;

  const PageViewer({
    required this.pageController,
    this.currentIndex = 0,
  });

  void onPageChanged(int index) {
    this.copyWith(currentIndex: index);
  }

  PageViewer copyWith({
    PageController? pageController,
    int? currentIndex,
  }) {
    return PageViewer(
      pageController: pageController ?? this.pageController,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
