import 'package:flutter/material.dart';
import 'routes.dart';
import 'AppLanguage.dart';

void main() async {
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(Routes(
    appLanguage: appLanguage,
  ));
}
