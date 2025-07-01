import 'package:church_songbook_app/shared/theme/app_colors.dart';
import 'package:church_songbook_app/shared/theme/app_theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BlueGrayTheme {
  static ThemeData get blueGrayTheme => ThemeData(
    useMaterial3: true,

    textTheme: GoogleFonts.loraTextTheme().copyWith(
      titleLarge: GoogleFonts.lora(
        fontSize: 72.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.goldenYellow,
      ),
      bodyMedium: GoogleFonts.lora(fontSize: 24.sp, color: AppColors.deepBrown),
      bodySmall: GoogleFonts.lora(fontSize: 18.sp, color: AppColors.deepBrown),
    ),

    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.paleBlue,
      onPrimary: AppColors.paleBlue,
      secondary: AppColors.lightGray,
      onSecondary: AppColors.lightGray,
      tertiary: AppColors.deepBrown,
      onTertiary: AppColors.deepBrown,
      error: AppColors.brightRed,
      onError: AppColors.brightRed,
      surface: AppColors.snow,
      onSurface: AppColors.snow,
    ),

    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(AppColors.deepBrown),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.deepBrown),
        foregroundColor: WidgetStatePropertyAll(AppColors.goldenYellow),
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
      GradientTheme(primaryGradient: AppColors.blueGrayGradient),
      WindowButtonTheme.blueGrayTheme,
    ],
  );
}
