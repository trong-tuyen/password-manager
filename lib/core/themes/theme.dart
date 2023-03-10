import 'package:flutter/material.dart';
import 'package:flutter_practice/gen/colors.gen.dart';
import 'package:flutter_practice/gen/fonts.gen.dart';

//color default
ColorScheme _lightColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: ColorName.primaryColor,
  onPrimary: ColorName.onPrimaryColor,
  secondary: ColorName.secondaryColor,
  onSecondary: ColorName.onSecondaryColor,
  error: ColorName.errorColor,
  onError: ColorName.onErrorColor,
  background: ColorName.backgroundColor,
  onBackground: ColorName.onBackgroundColor,
  surface: ColorName.surfaceColor,
  onSurface: ColorName.onSurfaceColor,
);

/// Reference to the application theme.
class MPTheme {
  static Color primaryBackgroundColor = ColorName.onPrimaryBackgroundColor;
  static Color secondaryBackgroundColor = ColorName.secondaryBackgroundColor;
  static Color visibilityColor = ColorName.visibilityColor;
  static Color cardTwitterColor = Color.alphaBlend(
      const Color.fromRGBO(3, 169, 244, 0.097),
      const Color.fromRGBO(255, 255, 255, 1));

  static Color cardMediaColor = Color.alphaBlend(
      const Color.fromRGBO(0, 0, 0, 0.097),
      const Color.fromRGBO(255, 255, 255, 1));
  static Color cardGmailColor = Color.alphaBlend(
      const Color.fromRGBO(244, 67, 54, 0.097),
      const Color.fromRGBO(255, 255, 255, 1));
  static Color cardBaseCampColor = Color.alphaBlend(
      const Color.fromRGBO(255, 237, 0, 0.097),
      const Color.fromRGBO(255, 255, 255, 1));
  static Color cardUpworkColor = Color.alphaBlend(
      const Color.fromRGBO(59, 222, 14, 0.097),
      const Color.fromRGBO(255, 255, 255, 1));
  late final Color textNormal;
  static FontWeight fontWeightBold = FontWeight.w700;
  static FontWeight fontWeightMedium = FontWeight.w600;
  static FontWeight fontWeightSmall = FontWeight.w400;

  static TextStyle _defaultTextStyle({
    required double fontSize,
    required FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: ColorName.backgroundColor,
    );
  }

  /// Light theme and its settings.
  static ThemeData lightTheme = ThemeData(
    fontFamily: FontFamily.poppins,
    brightness: Brightness.light,
    colorScheme: _lightColorScheme,
    appBarTheme: AppBarTheme(
      color: _lightColorScheme.background,
      elevation: 0,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: _lightColorScheme.background,
    primaryColor: _lightColorScheme.primary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll<Color>(_lightColorScheme.primary),
        textStyle: MaterialStatePropertyAll<TextStyle>(
          _defaultTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll<Color>(_lightColorScheme.onSecondary),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.transparent,
    ),
    iconTheme: IconThemeData(color: _lightColorScheme.primary, size: 30),
    cardTheme: CardTheme(
      color: _lightColorScheme.surface,
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: TextStyle(
        color: _lightColorScheme.error,
        fontSize: 12,
        fontFamily: FontFamily.poppins,
        fontWeight: fontWeightSmall,
      ),
      hintStyle: TextStyle(
        color: _lightColorScheme.onSurface.withOpacity(0.5),
        fontSize: 14,
        fontFamily: FontFamily.poppins,
        fontWeight: fontWeightSmall,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(width: 1, color: _lightColorScheme.onSurface),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: _lightColorScheme.onSurface)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(width: 1, color: _lightColorScheme.onSurface),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: _defaultTextStyle(
        fontSize: 25,
        fontWeight: fontWeightBold,
      ),
      titleSmall: _defaultTextStyle(
        fontSize: 22,
        fontWeight: fontWeightSmall,
      ),
      headlineLarge: _defaultTextStyle(
        fontSize: 31,
        fontWeight: fontWeightMedium,
      ),
      labelLarge: _defaultTextStyle(
        fontSize: 19,
        fontWeight: fontWeightSmall,
      ),
      bodyLarge: _defaultTextStyle(
        fontSize: 18,
        fontWeight: fontWeightSmall,
      ),
      labelMedium: _defaultTextStyle(
        fontSize: 16,
        fontWeight: fontWeightBold,
      ),
      bodyMedium: _defaultTextStyle(fontSize: 17, fontWeight: fontWeightSmall),
      bodySmall: _defaultTextStyle(
        fontSize: 14,
        fontWeight: fontWeightSmall,
      ),
      labelSmall: _defaultTextStyle(
        fontSize: 12,
        fontWeight: fontWeightSmall,
      ),
    ),
  );

  /// Dark theme and its settings.
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}
