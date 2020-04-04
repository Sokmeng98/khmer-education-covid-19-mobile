import 'package:flutter/material.dart';
import 'package:khmer_education/screens/components/drawer.dart';

import '../../app_localizations.dart';

class SelfDiagnosis extends StatefulWidget {
  SelfDiagnosis({Key key}) : super(key: key);

  @override
  _SelfDiagnosisState createState() => _SelfDiagnosisState();
}

class _SelfDiagnosisState extends State<SelfDiagnosis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('app-bar'),
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Text('asdf'),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                            child: Text('Symptom'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Icon(
                                Icons.sentiment_satisfied,
                                size: 150,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                                'Do you have cough, sneeze, sore throat, and \ndifficult to breath?'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
