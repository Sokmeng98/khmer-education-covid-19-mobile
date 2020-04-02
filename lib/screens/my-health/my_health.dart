import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      appLanguage.changeLanguage(Locale("en"));
                    },
                    child: Text(
                      AppLocalizations.of(context).translate('english'),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      appLanguage.changeLanguage(Locale("km"));
                    },
                    child: Text(
                      AppLocalizations.of(context).translate('khmer'),
                    ),
                  ),
                  Spacer(),
                  RaisedButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context).translate('hotline'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
              child: Container(
                height: 200.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context).translate('setting'),
                    ),
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
                    padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 15.0),
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('self-diagnosis'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 15.0),
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('health-records'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 15.0),
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('near-by-hospitals'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
