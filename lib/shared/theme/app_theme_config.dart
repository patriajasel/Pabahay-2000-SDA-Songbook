import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:church_songbook_app/shared/theme/app_colors.dart';
import 'package:church_songbook_app/shared/theme/color_themes/blue_cyan_theme.dart';
import 'package:church_songbook_app/shared/theme/color_themes/blue_gray_theme.dart';
import 'package:church_songbook_app/shared/theme/color_themes/red_teal_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppThemeConfig {
  // Red/Teal Theme
  static ThemeData get redTealTheme => RedTealTheme.redTealTheme;

  // Blue/Cyan Theme
  static ThemeData get blueCyanTheme => BlueCyanTheme.blueCyanTheme;

  // Green/Cyan Theme
  static ThemeData get blueGrayTheme => BlueGrayTheme.blueGrayTheme;
}

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;
}

extension ColorSchemeExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color? get primary => colorScheme.primary;
  Color? get secondary => colorScheme.secondary;
  Color? get tertiary => colorScheme.tertiary;
  Color? get error => colorScheme.error;
  Color? get surface => colorScheme.surface;
  Color? get highlight => Theme.of(this).highlightColor;
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
      mouseOver: AppColors.brightRed,
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
      mouseOver: AppColors.brightRed,
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
      mouseOver: AppColors.brightRed,
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
