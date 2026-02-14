import 'package:window_manager/window_manager.dart';

class WindowManagerUtil {
  static Future<void> init() async {
    await windowManager.ensureInitialized();
    await windowManager.center(animate: true);
    await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
    await windowManager.setIcon('lib/shared/assets/sda_logo.png');
  }

  static Future<void> setWindowIcon(String path) async {
    await windowManager.setIcon(path);
  }

  static Future<void> setWindowTitle(String title) async {
    await windowManager.setTitle(title);
  }
}
