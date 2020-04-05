import 'package:flutter/material.dart';
import '../../app_localizations.dart';
import 'my_health_input_form.dart';


class MyHealthInput extends StatelessWidget {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('app-bar'),
          style: TextStyle(fontSize: 22),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              Text(
                AppLocalizations.of(context).translate('health-record-input'),
                style: headerOne,
              ),
              Container(
                margin: EdgeInsets.only(top: 3, bottom: 10),
                height: 5,
                width: 150,
                color: Colors.redAccent[100],
              ),
              MyHealthInputForm(),
              //Make the list take the whole height
            ],
          ),
        ),
      ),

    );
  }
}





