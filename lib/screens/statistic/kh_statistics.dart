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
  var province;
  var sortedProvince;
 

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
      var recovered = 0;
      if (groupBy(province, (obj) => (obj['death']))['1'] != null) {
        death = groupBy(province, (obj) => (obj['death']))['1'].length;
      }
      if (groupBy(province, (obj) => (obj['recovered']))['1'] != null) {
        recovered = groupBy(province, (obj) => (obj['recovered']))['1'].length;
      }

      infectedProvinceData[key] = {
        'total-infection' : province.length,
        'total-recovered' : recovered,
        'total-death' : death,
      };
      
    });
    
    List<Map<String,dynamic>> listInfectedProvinceData = [];
    infectedProvinceData.forEach((key,value) => listInfectedProvinceData.add({key:value}));
    listInfectedProvinceData.sort((a,b){
      int aValue = a.values.first["total-infection"];
      int bValue = b.values.first["total-infection"];
      return aValue < bValue ? 1:0;
    });
    var sortedInfectedProvinceData = Map.fromIterable(listInfectedProvinceData,key:(e) => e.keys.first, value: (e) => e.values.first);
    print(sortedInfectedProvinceData);

    var indexProvince = sortedInfectedProvinceData.keys.toList();
    print("kakak");
    print( indexProvince.length);

    var sortProvince = sortedInfectedProvinceData.values.toList();

    setState(() {
      totalInfection = infectionStatistic;
      totalRecover = recoverStatistic;
      totalDeath = deathStatistic;
      locationData = sortedInfectedProvinceData;
      province = indexProvince;
      sortedProvince = sortProvince;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchKhStatisticsAPI();
  }

  static const TextStyle titleOne = TextStyle(
    fontSize: 25,
    color: Colors.white,
    );
    static const TextStyle headerOne = TextStyle(
    fontSize: 20,
    color: Colors.black,
  );
  Color _colorbuttonkhmerstatistics = Colors.red;
  Color _colorbuttonworldstatistics = Colors.white;
  bool pressed1 = true;
  bool pressed2 = true;


  @override
  Widget build(BuildContext context) {

    var now = new DateTime.now();
    String today = ('${now.day}/${now.month}/${now.year}');

    final khmerStatistics =new Expanded(
            child:Container(
              height: 50,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black)
                ),
                color: _colorbuttonkhmerstatistics,
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("ប្រទេសកម្ពុជា",
                    style: headerOne
                    )
                  ],
                ),
                onPressed: (){
                  setState(() {
                    _colorbuttonkhmerstatistics = Colors.red;
                    _colorbuttonworldstatistics = Colors.white;
                  });
                },

              ),
          )
      );
    final worldStatistics =new Expanded(
            child:Container(
              height: 50,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black)
                ),
                color: _colorbuttonworldstatistics,
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("ពិភពលោក",
                    style: headerOne
                    )
                  ],
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/world-statistics');
                  setState(() {
                    _colorbuttonkhmerstatistics = Colors.white;
                    _colorbuttonworldstatistics = Colors.red;
                  });
                },
              ),
          )
      );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('app-bar'),
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
            [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row( 
                      children: [
                        Expanded(
                            child:Container(
                              color: Colors.red,
                              height: 140,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 20.0),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(  
                                        'បច្ចុប្បន្នភាពស្តិតិអ្នកឆ្លង',
                                        textAlign: TextAlign.center,
                                      style: titleOne,)
                                      ),
                                    )
                                  ]
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:EdgeInsets.symmetric(horizontal:0.0),
                                            child:Container(
                                            height:3.0,
                                            width:250.0,
                                            color:Colors.white,),
                                        )  
                                      ],
                                    )
                                ]
                              )
                            )
                          ) 
                        ]
                    ),
                    Row(
                      children: <Widget>
                      [
                        khmerStatistics,
                        worldStatistics
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                          child: Text('>> បច្ចប្បន្នភាពចុងក្រោយ៖ $today',style: TextStyle(fontSize: 15)),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 0.0),
                          child: Text('ករណីឆ្លងសរុប៖ $totalInfection',style: TextStyle(fontSize: 20) ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                          child: Text('ជាសះស្បើយ៖ $totalRecover',style: TextStyle(fontSize: 20))
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                          child: Text('ស្លាប់៖ $totalDeath',style: TextStyle(fontSize: 20)),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 60,
                          child:Text('ល.រ'),
                        ),
                        Container(
                          width: 150,
                          child:Text('ខេត្ត/ក្រុង'),
                        ),
                        Container(
                          width: 60,
                          child:Text('ឆ្លង'),
                        ),
                        Container(
                          width: 60,
                          child:Text('សេះស្បើយ'),
                        ),
                        Container(
                          width: 40,
                          child:Text('ស្លាប់'),
                        ),
                      ],
                    )
                ],
              )]
            )
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate:SliverChildBuilderDelegate(
              (context, int index){
                return new Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            // alignment: Alignment.center,
                            width: 50,
                            child:Text('${index+1}'),
                          ),
                          Container(
                            width: 150,
                            child:Text(province[index]),
                          ),
                          Container(
                            width: 60,
                            child:Text(sortedProvince [index]["total-infection"].toString()),
                          ),
                          Container(
                            width: 60,
                            child:Text(sortedProvince [index]["total-recovered"].toString()),
                          ),
                          Container(
                            width: 20,
                            child:Text(sortedProvince [index]["total-death"].toString()),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              childCount: province == null ? 0 : province.length,
            ) 
          )
        ],
      )
    );
  }
}
