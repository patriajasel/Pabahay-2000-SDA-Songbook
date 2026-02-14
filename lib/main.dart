import 'package:church_songbook_app/modules/_master/master_page.dart';
import 'package:church_songbook_app/util/window_manager/window_manager.util.dart';
import 'package:flutter/material.dart';

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WindowManagerUtil.init();

  runApp(const MasterPage());
}
