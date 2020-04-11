import 'package:flutter/material.dart';
import '../../app_localizations.dart';

class FAQ extends StatefulWidget {
  FAQ({Key key}) : super(key: key);

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
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
