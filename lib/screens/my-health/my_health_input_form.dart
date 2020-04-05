import 'package:flutter/material.dart';
import '../../app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';



class MyHealthInputForm extends StatefulWidget {
  @override
  _MyHealthInputFormState createState() => _MyHealthInputFormState();
}
class _MyHealthInputFormState extends State<MyHealthInputForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //***** Fields Validation *****//
    String textFieldValidator(value){
      return (value.isEmpty) ?
      AppLocalizations.of(context).translate('msg-for-required-field') :
      null;
    }

    //***** Fields *****//
    final dateField = DateTimeField(
      format: DateFormat('dd-MM-yyyy'),
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(2000),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
      decoration: InputDecoration(
        icon: Icon(Icons.date_range),
        labelText: AppLocalizations.of(context).translate('date-field'),
      ),
      validator: (value) {
        return (value.runtimeType == Null) ?
        AppLocalizations.of(context).translate('msg-for-required-field') :
        null;
      },
    );

    final temperatureField = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(Icons.face),
        labelText: AppLocalizations.of(context).translate('body-temp'),
      ),
      validator: textFieldValidator,
    );

    final symptomsField = TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.local_hospital),
        labelText: AppLocalizations.of(context).translate('symptoms'),
      ),
      validator: textFieldValidator,
    );

    final didTravelToField = TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.directions_car),
        labelText: AppLocalizations.of(context).translate('did-travel-to'),
      ),
      validator: textFieldValidator,
    );

    final spaceBetween = SizedBox(
      height: 20,
    );

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: <Widget>[
            dateField,
            spaceBetween,
            temperatureField,
            spaceBetween,
            symptomsField,
            spaceBetween,
            didTravelToField,
            spaceBetween,
            RaisedButton.icon(
                onPressed: (){
                  //TODO to be implemented MORE
                  if(_formKey.currentState.validate()){
                    Scaffold.of(context).showSnackBar(
                        SnackBar(
                            content: Text(AppLocalizations.of(context).translate('processing-data'))
                        )
                    );
                  }
                },
                icon: Icon(Icons.edit),
                label: Text(AppLocalizations.of(context).translate('save-data'))
            )
          ],
        ),
      ),
    );
  }
}