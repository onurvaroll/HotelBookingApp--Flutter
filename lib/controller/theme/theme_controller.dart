import 'package:flutter/material.dart';
import '../../core/color.dart';
import '../../core/text_styles.dart';
import '../base/base_controller.dart';


class ThemeController extends BaseController {
  ThemeData get lightTheme => ThemeData(
    fontFamily: 'Poppins',
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ColorConstants.primary,
      onPrimary: ColorConstants.primary,
      secondary: ColorConstants.black,
      onSecondary: ColorConstants.black,
      error: Colors.red,
      onError: Colors.red,
      surface: Colors.white,
      onSurface: Colors.white,
    ),
    textTheme: TextTheme(
      titleLarge: CustomTextStyles.titleLarge,
      titleMedium: CustomTextStyles.titleMedium,
      titleSmall: CustomTextStyles.titleSmall,
      bodyLarge: CustomTextStyles.bodyLarge,
      bodyMedium: CustomTextStyles.bodyMedium,
      bodySmall: CustomTextStyles.bodySmall,
      labelLarge: CustomTextStyles.labelLarge,
      labelMedium: CustomTextStyles.labelMedium,
      labelSmall: CustomTextStyles.labelSmall,
    ),
  );

  @override
  void onInit() {
    builderId = 'themeController';
    super.onInit();
  }


}