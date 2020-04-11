import 'package:flutter/material.dart';
import '../../app_localizations.dart';

class History extends StatefulWidget {
  History({Key key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                child: Text(
                  AppLocalizations.of(context).translate('coming-soon'),
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0), child: Text(
                AppLocalizations.of(context).translate('doing-our-best'),
                style: TextStyle(fontSize: 20),
              ),)
            ]),
      ),
    );
  }
}
