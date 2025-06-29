import 'package:church_songbook_app/features/splash_screen/splash_screen.dart';
import 'package:church_songbook_app/shared/theme/app_theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  await windowManager.center(animate: true);
  await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
  await windowManager.setIcon('lib/shared/assets/sda_logo.png');

  runApp(
    ScreenUtilInit(
      designSize: Size(1440, 900),
      builder: (_, child) => const Main(),
    ),
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeConfig.redTealTheme,
      home: SplashScreen(),
    );
  }
}
