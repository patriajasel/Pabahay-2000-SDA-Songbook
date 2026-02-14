import 'package:church_songbook_app/config/app.config.dart';
import 'package:church_songbook_app/main.dart';

void main() async {
  AppConfig().setConfig(dbName: 'qa.db');

  mainCommon();
}
