import 'package:flutter/material.dart';
import 'package:ink_mobile/models/custom_tab.dart';

class SwitchTabs extends StatelessWidget {
  final List<CustomSectionTab> tabs;
  final int activeIndex;
  final bool isTablet;
  final void Function(int) onIndexChanged;
  const SwitchTabs(
      {Key? key,
      required this.isTablet,
      required this.tabs,
      required this.activeIndex,
      required this.onIndexChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
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
    return InkWell(
      onTap: () => onIndexChanged(tabs[index].index),
      child: Container(
        decoration: _boxDecoration(context, index),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
        child: Text(
          tabs[index].label,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isTablet ? 17.5  : 13.5,
            fontWeight: isTablet ? FontWeight.bold : null,
            color: activeIndex == index
                ? Colors.white
                : Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration(BuildContext context, int index) {
    final double borderRadius = 5.0;
    return BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(isFirstElement(index) ? borderRadius : 0.0),
        bottomLeft: Radius.circular(isFirstElement(index) ? borderRadius : 0.0),
        topRight: Radius.circular(isLastElement(index) ? borderRadius : 0.0),
        bottomRight: Radius.circular(isLastElement(index) ? borderRadius : 0.0),
      ),
      border: Border.all(color: Theme.of(context).primaryColor),
      color: isActive(index) ? Theme.of(context).primaryColor : Colors.white,
    );
  }

  bool isActive(int index) {
    return activeIndex == index;
  }

  bool isFirstElement(int index) {
    return index == 0;
  }

  bool isLastElement(int index) {
    return index == tabs.length - 1;
  }
}
