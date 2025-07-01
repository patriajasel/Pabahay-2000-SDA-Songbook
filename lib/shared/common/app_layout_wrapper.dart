import 'package:church_songbook_app/shared/common/custom_title_bar.dart';
import 'package:church_songbook_app/shared/common/side_bar_navigation.dart';
import 'package:church_songbook_app/shared/theme/app_theme_config.dart';
import 'package:flutter/material.dart';

class AppLayoutWrapper extends StatelessWidget {
  final Widget child;
  final bool showSettings;
  final VoidCallback? onSettingsPressed;
  final bool includeSideNavigation;
  final int selectedIndex;
  final Function(int)? onItemSelected;
  final VoidCallback? onHomePressed;

  const AppLayoutWrapper({
    super.key,
    required this.child,
    this.showSettings = true,
    this.onSettingsPressed,
    this.includeSideNavigation = false,
    this.selectedIndex = 0,
    this.onItemSelected,
    this.onHomePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient that covers entire screen
          _buildGradientBackground(context),

          // Vignette effect using a radial gradient
          _buildVignetteEffect(),

          // Main content
          if (includeSideNavigation)
            _buildContentWithSideNav(context)
          else
            _buildContent(),

          // Settings button (optional)
          if (showSettings) _buildSettings(context),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        const CustomTitleBar(),
        Expanded(child: child),
      ],
    );
  }

  Widget _buildContentWithSideNav(BuildContext context) {
    return Column(
      children: [
        CustomTitleBar(),
        Expanded(
          child: Row(
            children: [
              SideBarNavigation(
                selectedIndex: selectedIndex,
                onItemSelected: onItemSelected ?? (index) {},
              ),
              Expanded(child: child),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGradientBackground(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: context.gradientTheme.primaryGradient,
      ),
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

  Widget _buildSettings(BuildContext context) {
    return Positioned(
      bottom: 5,
      right: 5,
      child: IconButton(
        onPressed: onSettingsPressed ?? () {},
        icon: Icon(Icons.settings),
      ),
    );
  }
}
