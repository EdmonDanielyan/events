import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:ink_mobile/constants/palette.dart';

abstract final interface class FontStyles {
  static rubikP1Medium({Color? color, TextDecoration? decoration}) =>
      GoogleFonts.rubik(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: color ?? Palette.textBlack,
        decoration: decoration,
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
        height: 1.42,

      );

  static rubikP2Medium({Color? color}) => GoogleFonts.rubik(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: color ?? Palette.textBlack,
        height: 1.42,
      );

  static rubikP3({Color? color}) => GoogleFonts.rubik(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: color ?? Palette.textBlack,
      );

  static rubikP3Medium({Color? color}) => GoogleFonts.rubik(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: color ?? Palette.textBlack,
      );

  static rubikH2({Color? color}) => GoogleFonts.rubik(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: color ?? Palette.textBlack,
      );

  static rubikH2Medium({Color? color}) => GoogleFonts.rubik(
    fontWeight: FontWeight.w500,
    fontSize: 24,
    color: color ?? Palette.textBlack,
  );

  static rubikH3({Color? color}) => GoogleFonts.rubik(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: color ?? Palette.textBlack,
      );

  static rubikH4({Color? color}) => GoogleFonts.rubik(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: color ?? Palette.textBlack,
      );
}
