import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  //reference colors
  static const Color _blue2 = Color(0XFF12191d);
  static const Color _red = Color(0xFFAF0121);
  static const Color _green = Color(0xFF00F318);
  static const Color _blue1 = Color(0XFF0f151a);
  static const Color _white = Color(0xFFFFFFFF);
  static const Color _buttonBlue = Color(0XFF3944a6);
  static const Color _blue3 = Color(0XFF161e27);
  static const _blue4 = Color(0XFF182028);

  //actual colors to be used throughout the app
  final Color bgColor;
  final Color firstBS;
  final Color secondBS;
  final Color thirdBS;
  final Color button;
  final Color snackbarValidation;
  final Color snackBarFailure;
  final Color textDefault;

  // private constructor (use factories below instead):
  const AppColorsTheme._internal({
    required this.bgColor,
    required this.firstBS,
    required this.secondBS,
    required this.thirdBS,
    required this.button,
    required this.snackbarValidation,
    required this.snackBarFailure,
    required this.textDefault,
  });

//defining dark theme
  factory AppColorsTheme.dark() {
    return const AppColorsTheme._internal(
        bgColor: _blue1,
        firstBS: _blue2,
        secondBS: _blue3,
        thirdBS: _blue4,
        button: _buttonBlue,
        snackbarValidation: _green,
        snackBarFailure: _red,
        textDefault: _white);
  }

//define your light theme
  // factory AppColorsTheme.light(){
  //   return AppColorsTheme._internal(...);
  // }

  @override
  ThemeExtension<AppColorsTheme> copyWith({bool? lightMode}) {
    if (lightMode == null || lightMode == true) {
      return AppColorsTheme.dark();
    }
    return AppColorsTheme.dark();
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
          covariant ThemeExtension<AppColorsTheme>? other, double t) =>
      this;
}
