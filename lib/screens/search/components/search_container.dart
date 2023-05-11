import 'package:flutter/widgets.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';

class SearchContainer extends StatelessWidget {
  final String label;
  final List<Widget> items;

  const SearchContainer({Key? key, required this.label, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                style: FontStyles.rubikH4(color: Palette.textBlack),
              ),
            ),
          ),
          ...items,
        ],
      ),
    );
  }
}
