import 'package:flutter/widgets.dart';

class SearchContainer extends StatelessWidget {
  final String label;
  final List<Widget> items;

  const SearchContainer({Key? key, required this.label, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                label,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
          Column(
            children: items,
          )
        ],
      ),
    );
  }
}
