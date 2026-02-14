import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class WindowManagerUtil {
  static Future<void> init() async {
    await windowManager.ensureInitialized();
    await windowManager.center(animate: true);
    await windowManager.setBackgroundColor(Colors.white);
  }

  static Future<void> setTitle({required String title}) async {
    await windowManager.setTitle(title);
  }

  static Future<void> setIcon({required String iconPath}) async {
    await windowManager.setIcon(iconPath);
  }

  static Future<void> setFullScreenOn() {
    return windowManager.setFullScreen(true);
  }

  static Future<void> setFullScreenOff() {
    return windowManager.setFullScreen(false);
  }
}
