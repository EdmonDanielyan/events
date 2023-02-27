import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:ink_mobile/constants/palette.dart';

class FontStyles {
  static rubikP1Medium({Color? color}) => GoogleFonts.rubik(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: color ?? Palette.textBlack,
      );

  static rubikP1({Color? color}) => GoogleFonts.rubik(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: color ?? Palette.textBlack,
      );

  static rubikP2({Color? color, TextDecoration? decoration}) =>
      GoogleFonts.rubik(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: color ?? Palette.textBlack,
        decoration: decoration,
      );

  static rubikH2({Color? color}) => GoogleFonts.rubik(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: color ?? Palette.textBlack,
      );
}
