import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:church_songbook_app/features/home/home_page.dart';
import 'package:church_songbook_app/shared/common/app_layout_wrapper.dart';
import 'package:church_songbook_app/shared/theme/app_theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(milliseconds: 5000), () {
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, _) => const HomePage(),
              transitionDuration: const Duration(milliseconds: 600),
              transitionsBuilder: (context, animation, _, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          );
        }
      });
    });

    return AppLayoutWrapper(
      onSettingsPressed: () {
        // Handle settings navigation
      },
      child: _buildMainContent(context),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAnimatedLogo().logoSplashAnimate(),
            SizedBox(width: 16.w),
            _buildAnimatedTitle(),
          ],
        ),

        SizedBox(height: 20.h),

        _buildLoadingText(
          context,
        ).animate(delay: 3000.ms).fadeIn(duration: 500.ms),
      ],
    );
  }

  Widget _buildAnimatedLogo() {
    return Image.asset(
      'lib/shared/assets/sda_logo.png',
      height: 350.h,
      width: 350.w,
    );
  }

  Widget _buildAnimatedTitle() {
    return AnimatedBuilder(
      animation: AlwaysStoppedAnimation(0),
      builder: (context, child) {
        return FutureBuilder(
          future: Future.delayed(Duration(milliseconds: 1500)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Pabahay 2000 SDA Church \nSongbook',
                    textStyle: context.titleLarge?.copyWith(
                      shadows: [
                        Shadow(
                          offset: Offset(5, 5),
                          blurRadius: 6,
                          color: Colors.black.withValues(alpha: 0.6),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    speed: Duration(milliseconds: 35),
                  ),
                ],
                totalRepeatCount: 1,
                displayFullTextOnTap: false,
              );
            } else {
              return SizedBox(width: 200.w, height: 100.h);
            }
          },
        );
      },
    );
  }

  Widget _buildLoadingText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Initializing App', style: context.bodyMedium),
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              '...',
              textStyle: context.bodyMedium,
              speed: Duration(milliseconds: 500),
            ),
          ],
          isRepeatingAnimation: true,
          repeatForever: true,
          pause: Duration(milliseconds: 200),
        ),
      ],
    );
  }
}
