import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import '../../app_localizations.dart';

class KhStatistics extends StatefulWidget {
  KhStatistics({Key key}) : super(key: key);
  var totalInfection;
  var recoverStatistic;
  var deathStatistic;
  
  @override
  _KhStatisticsState createState() => _KhStatisticsState();
}

class _KhStatisticsState extends State<KhStatistics> {
  var totalInfection;
  var totalRecover;
  var totalDeath;
  var locationData;
 

  void _fetchKhStatisticsAPI() async {
    var response = await http.get('https://khcovid19.com/api/');
    var jsonResponse = convert.jsonDecode(response.body);
    var infectionStatistic = jsonResponse.length;
    var recover = groupBy(jsonResponse, (obj) => (obj['recovered']));
    var recoverStatistic = recover['1'].length;
    var death = groupBy(jsonResponse, (obj) => (obj['death']));
    var deathStatistic = 0;
    if (death['1'] != null) {
      deathStatistic = death['1'].length;
    }
    print('Total Infection : ' + infectionStatistic.toString());
    print('Total Recover : ' + recoverStatistic.toString());
    print('Total Death : ' + deathStatistic.toString());
    var locationStatistic = groupBy(jsonResponse, (obj) => obj['location_en']);
    var infectedProvinces = locationStatistic.keys;
    var infectedProvinceData = new Map();

    infectedProvinces.forEach((key) {
      print(key.runtimeType);
      var province = locationStatistic[key];
      var death = 0;
      if (groupBy(province, (obj) => (obj['death']))['1'] != null) {
        death = groupBy(province, (obj) => (obj['death']))['1'].length;
      }
      infectedProvinceData[key] = {
        'total-infection' : province.length,
        'total-recovered' : groupBy(province, (obj) => (obj['recovered'])).length,
        'total-death' : death,
      }; 
    });
    print('Location Statistic : ');
    print(infectedProvinceData);

    setState(() {
      totalInfection = infectionStatistic;
      totalRecover = recoverStatistic;
      totalDeath = deathStatistic;
      locationData = infectedProvinceData;
    });
  }


  @override
  void initState() {
    super.initState();
    _fetchKhStatisticsAPI();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('app-bar'),
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: new Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Total Infection : $totalInfection'),
              Text('Total Recovered : $totalRecover'),
              Text('Total Death : $totalDeath'),
              Text('Based on location : $locationData'),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                child: Text(
                  AppLocalizations.of(context).translate('coming-soon'),
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: Text(
                  AppLocalizations.of(context).translate('doing-our-best'),
                  style: TextStyle(fontSize: 20),
                ),
              )
            ]

          ),
      ),
    );
  }
}
