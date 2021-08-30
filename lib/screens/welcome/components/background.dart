import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Theme.of(context).primaryColor, const Color(0xFF182B23)],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.decal
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/background_lines.svg',
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height *
                MediaQuery.of(context).devicePixelRatio *
                2,
            fit: BoxFit.cover,
          ),
          child
        ],
      ),
    );
  }
}
