import 'package:church_songbook_app/config/app.config.dart';
import 'package:church_songbook_app/modules/_master/master_page.dart';
import 'package:church_songbook_app/util/window_manager/window_manager.util.dart';
import 'package:flutter/material.dart';

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WindowManagerUtil.init();
  await WindowManagerUtil.setTitle(
    title: "${AppConfig().appName} version ${AppConfig().appVersion}",
  );
  await WindowManagerUtil.setIcon(iconPath: 'assets/logo/sda_logo.png');

  runApp(const MasterPage());
}
