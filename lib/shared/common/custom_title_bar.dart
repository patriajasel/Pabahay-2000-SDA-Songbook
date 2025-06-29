import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:church_songbook_app/shared/theme/app_theme_config.dart';
import 'package:flutter/material.dart';

class CustomTitleBar extends StatelessWidget {
  const CustomTitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Row(
        children: [
          Expanded(child: MoveWindow()),
          MinimizeWindowButton(
            colors: context.windowButtonTheme.minimizeColors,
          ),
          MaximizeWindowButton(
            colors: context.windowButtonTheme.maximizeColors,
          ),
          CloseWindowButton(colors: context.windowButtonTheme.closeColors),
        ],
      ),
    );
  }
}
