class AppConfig {
  factory AppConfig() {
    return _instance;
  }

  AppConfig._internal();
  static final AppConfig _instance = AppConfig._internal();

  String get appName => 'Pabahay 2000 SDA Songbook';
  String get appVersion => '1.0.0';
  String get appBuildNumber => '1';

  String dbName = '';

  void setConfig({required String dbName}) {
    this.dbName = dbName;
  }
}
