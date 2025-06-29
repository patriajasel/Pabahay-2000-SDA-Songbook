import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:church_songbook_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeConfig {
  // Red/Teal Theme
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

  // Blue/Cyan Theme
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

  // Green/Cyan Theme
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

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;
}

/// Extensions Here!

extension SplashAnimations on Widget {
  Widget splashAnimate() => animate()
      .fadeIn(duration: 3000.ms)
      .scale(
        begin: Offset(0.9, 0.9),
        end: Offset(1.0, 1.0),
        curve: Curves.easeOutBack,
      );

  Widget logoSplashAnimate() => animate()
      .fadeIn(duration: 800.ms)
      .scale(
        begin: Offset(0.7, 0.7),
        end: Offset(1.0, 1.0),
        curve: Curves.easeOutBack,
        duration: 1000.ms,
      )
      .then(delay: 600.ms)
      .slideX(begin: 0.25, end: 0.0, duration: 800.ms, curve: Curves.easeInOut);

  Widget titleFromLogoAnimate() =>
      animate(delay: 1400.ms) // Start when logo starts moving
          .scale(
            begin: Offset(0.3, 0.3), // Start very small (from logo)
            end: Offset(1.0, 1.0),
            duration: 800.ms,
            curve: Curves.easeOutBack,
          )
          .slideX(
            begin: -0.4, // Start from logo position (left)
            end: 0.0, // Move to final position (right)
            duration: 800.ms,
            curve: Curves.easeOutCubic,
          )
          .fadeIn(duration: 600.ms, curve: Curves.easeIn);
}

extension WindowButtonThemeExtension on BuildContext {
  WindowButtonTheme get windowButtonTheme =>
      Theme.of(this).extension<WindowButtonTheme>()!;
}

extension GradientThemeExtension on BuildContext {
  GradientTheme get gradientTheme => Theme.of(this).extension<GradientTheme>()!;
}

/// Gradient Theme

@immutable
class GradientTheme extends ThemeExtension<GradientTheme> {
  final Gradient primaryGradient;

  const GradientTheme({required this.primaryGradient});

  @override
  ThemeExtension<GradientTheme> copyWith({Gradient? primaryGradient}) {
    return GradientTheme(
      primaryGradient: primaryGradient ?? this.primaryGradient,
    );
  }

  @override
  ThemeExtension<GradientTheme> lerp(
    ThemeExtension<GradientTheme>? other,
    double t,
  ) {
    if (other! is GradientTheme) return this;
    final otherGradient = other as GradientTheme;

    return GradientTheme(
      primaryGradient: Gradient.lerp(
        primaryGradient,
        otherGradient.primaryGradient,
        t,
      )!,
    );
  }
}

/// Window Buttons Theme

@immutable
class WindowButtonTheme extends ThemeExtension<WindowButtonTheme> {
  final WindowButtonColors minimizeColors;
  final WindowButtonColors maximizeColors;
  final WindowButtonColors closeColors;

  const WindowButtonTheme({
    required this.minimizeColors,
    required this.maximizeColors,
    required this.closeColors,
  });

  static WindowButtonTheme get redTealTheme => WindowButtonTheme(
    minimizeColors: WindowButtonColors(
      iconNormal: AppColors.gold,
      iconMouseOver: AppColors.ivory,
      mouseOver: AppColors.teal,
    ),
    maximizeColors: WindowButtonColors(
      iconNormal: AppColors.gold,
      iconMouseOver: AppColors.ivory,
      mouseOver: AppColors.teal,
    ),
    closeColors: WindowButtonColors(
      iconNormal: AppColors.gold,
      iconMouseOver: AppColors.ivory,
      mouseOver: AppColors.darkRed,
    ),
  );

  static WindowButtonTheme get blueCyanTheme => WindowButtonTheme(
    minimizeColors: WindowButtonColors(
      iconNormal: AppColors.cream,
      iconMouseOver: AppColors.warmBeige,
      mouseOver: AppColors.softCyan,
    ),
    maximizeColors: WindowButtonColors(
      iconNormal: AppColors.cream,
      iconMouseOver: AppColors.warmBeige,
      mouseOver: AppColors.softCyan,
    ),
    closeColors: WindowButtonColors(
      iconNormal: AppColors.cream,
      iconMouseOver: AppColors.cream,
      mouseOver: AppColors.darkRed,
    ),
  );

  static WindowButtonTheme get blueGrayTheme => WindowButtonTheme(
    minimizeColors: WindowButtonColors(
      iconNormal: AppColors.goldenYellow,
      iconMouseOver: AppColors.deepBrown,
      mouseOver: AppColors.lightGray,
    ),
    maximizeColors: WindowButtonColors(
      iconNormal: AppColors.goldenYellow,
      iconMouseOver: AppColors.deepBrown,
      mouseOver: AppColors.lightGray,
    ),
    closeColors: WindowButtonColors(
      iconNormal: AppColors.goldenYellow,
      iconMouseOver: AppColors.goldenYellow,
      mouseOver: AppColors.darkRed,
    ),
  );

  @override
  ThemeExtension<WindowButtonTheme> copyWith({
    WindowButtonColors? minimizeColors,
    WindowButtonColors? maximizeColors,
    WindowButtonColors? closeColors,
  }) {
    return WindowButtonTheme(
      minimizeColors: minimizeColors ?? this.minimizeColors,
      maximizeColors: maximizeColors ?? this.maximizeColors,
      closeColors: closeColors ?? this.closeColors,
    );
  }

  @override
  ThemeExtension<WindowButtonTheme> lerp(
    ThemeExtension<WindowButtonTheme>? other,
    double t,
  ) {
    if (other is! WindowButtonTheme) return this;
    return t < 0.5 ? this : other;
  }
}
