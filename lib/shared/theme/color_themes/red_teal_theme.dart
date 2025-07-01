import 'package:church_songbook_app/shared/theme/app_colors.dart';
import 'package:church_songbook_app/shared/theme/app_theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RedTealTheme {
  static ThemeData get redTealTheme => ThemeData(
    useMaterial3: true,

    textTheme: GoogleFonts.loraTextTheme().copyWith(
      titleLarge: GoogleFonts.lora(
        fontSize: 72.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.gold,
      ),
      bodyMedium: GoogleFonts.lora(fontSize: 24.sp, color: AppColors.ivory),
      bodySmall: GoogleFonts.lora(fontSize: 18.sp, color: AppColors.ivory),
    ),

    highlightColor: AppColors.gold,

    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.darkRed,
      onPrimary: AppColors.darkRed,
      secondary: AppColors.teal,
      onSecondary: AppColors.teal,
      tertiary: AppColors.ivory,
      onTertiary: AppColors.ivory,
      error: AppColors.brightRed,
      onError: AppColors.brightRed,
      surface: AppColors.snow,
      onSurface: AppColors.snow,
    ),

    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(iconColor: WidgetStatePropertyAll(AppColors.ivory)),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.ivory),
        foregroundColor: WidgetStatePropertyAll(AppColors.darkRed),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 60.w, vertical: 25.h),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(15.r),
          ),
        ),
      ),
    ),

    extensions: [
      GradientTheme(primaryGradient: AppColors.redTealGradient),
      WindowButtonTheme.redTealTheme,
    ],
  );
}
