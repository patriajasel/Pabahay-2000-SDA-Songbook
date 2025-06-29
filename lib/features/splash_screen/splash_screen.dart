import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:church_songbook_app/features/home/home_page.dart';
import 'package:church_songbook_app/shared/common/custom_title_bar.dart';
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

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient that covers entire screen
          _buildGradientBackground(context),

          // Vignette effect using a radial gradient
          _buildVignetteEffect(),

          // Column with title bar and content
          _buildMainContent(context),

          _buildSettings(context),
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Column(
      children: [
        // Custom Title Bar
        const CustomTitleBar(),

        // App Title and Logo
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildAnimatedLogo().logoSplashAnimate(),

                  SizedBox(width: 16.w),
                  // Animated typewriter text that starts after logo moves
                  _buildAnimatedTitle(),
                ],
              ),

              SizedBox(height: 20.h),

              _buildLoadingText(
                context,
              ).animate(delay: 3000.ms).fadeIn(duration: 500.ms),
            ],
          ),
        ),
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
              // Empty container while waiting
              return SizedBox(
                width: 200.w, // Maintain space
                height: 100.h,
              );
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

  Widget _buildVignetteEffect() {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.2,
          colors: [Colors.transparent, Colors.black.withValues(alpha: 0.5)],
          stops: [0.7, 1.0],
        ),
      ),
    );
  }

  Widget _buildGradientBackground(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: context.gradientTheme.primaryGradient,
      ),
    );
  }

  Widget _buildSettings(BuildContext context) {
    return Positioned(
      bottom: 5,
      right: 5,
      child: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
    );
  }
}
