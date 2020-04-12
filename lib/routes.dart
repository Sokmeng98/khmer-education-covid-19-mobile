import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:khmer_education/screens/faq-covid-19/faq-covid-19.dart';
import 'package:khmer_education/screens/history-covid-19/history-covid-19.dart';
import 'package:khmer_education/screens/prevention-covid-19/prevention-covid-19.dart';
import 'package:khmer_education/screens/quiz-covid-19/quiz-covid-19.dart';
import 'package:khmer_education/screens/self-diagnosis/index.dart';
import 'package:khmer_education/screens/statistic/kh_statistics.dart';
import 'package:khmer_education/screens/symptom-covid-19/symptom-covid-19.dart';
import './AppLanguage.dart';
import 'app_localizations.dart';
import 'package:provider/provider.dart';
import 'screens/my-health/my_health.dart';
import 'screens/my-health/my_health_records.dart';
import 'screens/my-health/my_health_input.dart';
import 'screens/news/news.dart';
import 'screens/news/Infected_Statistics.dart';
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
    '/infected-statistics': (BuildContext context) => InfectedStatistics(),
    '/map': (BuildContext context) => Map(),
    '/setting': (BuildContext context) => Setting(),
    '/self-diagnosis': (BuildContext context) => SelfDiagnosis(),
    '/symptom-covid-19': (BuildContext context) => Symptom(),
    '/prevention-covid-19': (BuildContext context) => Prevention(),
    '/history-covid-19': (BuildContext context) => History(),
    '/faq-covid-19': (BuildContext context) => FAQ(),
    '/quiz-covid-19': (BuildContext context) => Quiz(),
    '/kh-statistics': (BuildContext context) => KhStatistics(),
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
