import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:khmer_education/screens/self-diagnosis/index.dart';
import './AppLanguage.dart';
import 'app_localizations.dart';
import 'package:provider/provider.dart';
import 'screens/my-health/my_health.dart';
import 'screens/my-health/my_health_records.dart';
import 'screens/my-health/my_health_input.dart';
import 'screens/news/news.dart';
import 'screens/map/map.dart';
import 'screens/setting/setting.dart';
import 'home.dart';

class Routes extends StatelessWidget {
  final AppLanguage appLanguage;

  final routes = <String, WidgetBuilder>{
    '/my-health': (BuildContext context) => MyHealth(),
    '/my-health-records': (BuildContext context) => MyHealthRecordList(),
    '/my-health-input': (BuildContext context) => MyHealthInput(),
    '/news': (BuildContext context) => News(),
    '/map': (BuildContext context) => Map(),
    '/setting': (BuildContext context) => Setting(),
    '/self-diagnosis': (BuildContext context) => SelfDiagnosis(),
  };

  Routes({this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => appLanguage,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return MaterialApp(
          locale: model.appLocal,
          supportedLocales: [
            Locale('en', 'US'),
            Locale('km', ''),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          title: 'KhmerEducation Covid-19',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          routes: routes,
          home: Home(),
        );
      }),
    );
  }
}
