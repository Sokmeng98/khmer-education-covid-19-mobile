import 'package:flutter/material.dart';
import 'package:khmer_education/screens/setting/setting.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../AppLanguage.dart';
import '../../app_localizations.dart';

class MyHealth extends StatelessWidget {
  static const TextStyle headerOne = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  static const TextStyle titleOne = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      appLanguage.changeLanguage(Locale("en"));
                    },
                    child: Text(
                      AppLocalizations.of(context).translate('english'),
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(112, 112, 112, 1.0),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      appLanguage.changeLanguage(Locale("km"));
                    },
                    child: Text(
                      AppLocalizations.of(context).translate('khmer'),
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(112, 112, 112, 1.0),
                      ),
                    ),
                  ),
                  Spacer(),
                  MaterialButton(
                    onPressed: () {
                      launch("tel:115");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.call,
                          size: 30,
                          color: Color.fromRGBO(112, 112, 112, 1.0),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            AppLocalizations.of(context).translate('hotline'),
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(112, 112, 112, 1.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
              child: Container(
                height: 225.0,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/setting');
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.account_circle,
                                size: 150,
                                color: Colors.white,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                                child: Text(
                                  AppLocalizations.of(context)
                                      .translate('setting'),
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 15.0),
                    child: Container(
                      height: 60,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/self-diagnosis');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.help,
                              size: 30,
                              color: Color.fromRGBO(112, 112, 112, 1.0),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('self-diagnosis'),
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color.fromRGBO(112, 112, 112, 1.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        color: Color.fromRGBO(255, 200, 200, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 15.0),
                    child: Container(
                      height: 60,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/my-health-records');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.create,
                              size: 30,
                              color: Color.fromRGBO(112, 112, 112, 1.0),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('health-records'),
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color.fromRGBO(112, 112, 112, 1.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        color: Color.fromRGBO(255, 200, 200, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 15.0),
                    child: Container(
                      height: 60,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.map,
                              size: 30,
                              color: Color.fromRGBO(112, 112, 112, 1.0),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('near-by-hospitals'),
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color.fromRGBO(112, 112, 112, 1.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        color: Color.fromRGBO(255, 200, 200, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 50, 0.0, 0.0),
              child: Text(
                AppLocalizations.of(context).translate('supported-by') +
                    ':​ MOEYS & MOH​​​​​​​​​​​​​',
                style: TextStyle(
                  color: Color.fromRGBO(112, 112, 112, 1.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
