import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/models/custom_tab.dart';

class SwitchTabs extends StatelessWidget {
  final List<CustomSectionTab> tabs;
  final int activeIndex;
  final void Function(int) onIndexChanged;
  const SwitchTabs(
      {Key? key,
      required this.tabs,
      required this.activeIndex,
      required this.onIndexChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      child: Row(
        children: List.generate(
          tabs.length,
          (index) => Expanded(
            child: _buildTabWidget(context, index),
          ),
        ),
      ),
    );
  }

  Widget _buildTabWidget(BuildContext context, int index) {
    bool isActive = activeIndex == index;
    return InkWell(
      onTap: () => onIndexChanged(tabs[index].index),
      child: Text(
        tabs[index].label,
        textWidthBasis: TextWidthBasis.longestLine,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: FontStyles.rubikH2(color: isActive ? Palette.textBlack : Palette.text20Grey),
      ),
    );
  }
}
