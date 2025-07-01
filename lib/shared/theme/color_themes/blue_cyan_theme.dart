import 'package:church_songbook_app/shared/theme/app_colors.dart';
import 'package:church_songbook_app/shared/theme/app_theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BlueCyanTheme {
  static ThemeData get blueCyanTheme => ThemeData(
    useMaterial3: true,

    textTheme: GoogleFonts.loraTextTheme().copyWith(
      titleLarge: GoogleFonts.lora(
        fontSize: 72.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.cream,
      ),
      bodyMedium: GoogleFonts.lora(fontSize: 24.sp, color: AppColors.warmBeige),
      bodySmall: GoogleFonts.lora(fontSize: 18.sp, color: AppColors.warmBeige),
    ),

    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.darkBlue,
      onPrimary: AppColors.darkBlue,
      secondary: AppColors.softCyan,
      onSecondary: AppColors.softCyan,
      tertiary: AppColors.warmBeige,
      onTertiary: AppColors.warmBeige,
      error: AppColors.brightRed,
      onError: AppColors.brightRed,
      surface: AppColors.snow,
      onSurface: AppColors.snow,
    ),

    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(AppColors.warmBeige),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.warmBeige),
        foregroundColor: WidgetStatePropertyAll(AppColors.darkBlue),
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
      GradientTheme(primaryGradient: AppColors.blueCyanGradient),
      WindowButtonTheme.blueCyanTheme,
    ],
  );
}
