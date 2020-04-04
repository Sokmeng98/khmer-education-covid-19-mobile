import 'package:flutter/material.dart';
import '../../app_localizations.dart';

class MyHealthRecordList extends StatelessWidget {
  static const TextStyle headerOne = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  static const TextStyle titleOne = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  //TODO From-Backend Stuff - Below is dummy Data
  List records = [
    HealthData(date: 'ថ្ញៃ​ ចន័្ទ​ ទី ២៦ ខែ មីនា​ ឆ្នាំ ២០២០', temperature: '៣៨​', symptoms: 'ក្អក ផ្តាសាយ', didTravelTo: 'ផ្សារថ្មី'),
    HealthData(date: 'ថ្ញៃ​ ចន័្ទ​ ទី ២៦ ខែ មីនា​ ឆ្នាំ ២០២០', temperature: '៣៨​', symptoms: 'ក្អក', didTravelTo: 'ផ្សារថ្មី'),
    HealthData(date: 'ថ្ញៃ​ ចន័្ទ​ ទី ២៦ ខែ មីនា​ ឆ្នាំ ២០២០', temperature: '៣៦', symptoms: 'ក្អក ផ្តាសាយ', didTravelTo: 'ផ្សារថ្មី'),
    HealthData(date: 'ថ្ញៃ​ អង្គារ ទី ២៧ ខែ មីនា​ ឆ្នាំ ២០២០', temperature: '៣៨​', symptoms: 'ក្អក ផ្តាសាយ', didTravelTo: 'ផ្សារចាស់'),
    HealthData(date: 'ថ្ញៃ​ ពុធ ទី ២៨ ខែ មីនា​ ឆ្នាំ ២០២០', temperature: '៣៨​', symptoms: 'ក្អក ផ្តាសាយ', didTravelTo: 'ផ្សារថ្មី'),
  ];

  //****** These 2 data below are for alternating color for the list ******//
  Map colors = {true: Colors.red[200], false: Colors.white};
  var colorChoice = false;

  //****** context is needed for translation ******//
  Widget healthDataTemplate(HealthData eachData, BuildContext context) {
    String bodyTemp =  AppLocalizations.of(context).translate('body-temp') + ": ";
    String symptoms =  AppLocalizations.of(context).translate('symptoms') + ": ";
    String didTravelTo = AppLocalizations.of(context).translate('did-travel-to') + ": ";

    //**** Alternating colors ****//
    colorChoice = !colorChoice;

    return Container(
      height: 120,
      padding: EdgeInsets.only(left: 15, right: 15),
      color: colors[colorChoice],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            eachData.date,
            style: titleOne
          ),
          Text(bodyTemp + eachData.temperature),
          Text(symptoms + eachData.symptoms),
          Text(didTravelTo + eachData.didTravelTo),
        ],
      )
    );
  }

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
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              //TODO to be finalized
//              RaisedButton.icon(
//                onPressed: () {
//                  //TODO RaisedButton to be implemented
//                },
//                icon: Padding(
//                  //To add padding for the Button
//                  padding: EdgeInsets.only(top: 15, bottom: 15),
//                  child: Icon(Icons.edit)
//                ),
//                label: Text(
//                  AppLocalizations.of(context).translate('health-records'),
//                ),
//                color: Colors.redAccent[100],
//              ),

              Text(
                AppLocalizations.of(context).translate('health-records'),
                style: headerOne,
              ),
              Container(
                margin: EdgeInsets.only(top: 3, bottom: 10),
                height: 5,
                width: 150,
                color: Colors.redAccent[100],
              ),
              //Make the list take the whole height
              Expanded(
                child: ListView(
                  children: records.map((each) => healthDataTemplate(each, context)).toList()
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //TODO to be implemented
          Navigator.pushNamed(context, '/my-health-input');
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}

//TODO should be put outside
class HealthData {
  String date;
  String temperature;
  String symptoms;
  String didTravelTo;

  HealthData({this.date, this.temperature, this.symptoms, this.didTravelTo});
}
