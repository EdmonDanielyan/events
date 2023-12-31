import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../functions/size_config.dart';

class EmptyChats extends StatelessWidget {
  final String title;
  const EmptyChats({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: SizeConfig(context, 18).getProportionateScreenHeight,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
