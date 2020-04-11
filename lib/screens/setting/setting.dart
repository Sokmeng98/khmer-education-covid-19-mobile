import 'package:flutter/material.dart';
import 'package:khmer_education/app_localizations.dart';
import 'package:responsive_value/responsive_value.dart';
import 'package:intl/intl.dart';



class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

 
 static const TextStyle titleOne = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    );
 

  

// date picker
  final _formKey = GlobalKey<FormState>();
  DateTime selected;
   _showDateTimePicker() async{
     selected = await showDatePicker(
       context: context,
       initialDate: new DateTime.now(),
       firstDate: new DateTime(2017),
       lastDate: new DateTime.now()
       );
         setState(() {
            if(selected != null){
              var kaka = new DateFormat('dd-MMMM-yyyy').format(selected);
              _date.value = TextEditingValue(text: kaka.toString());
            }
            
        });
   }
//drop down type bloods
var _currencies = [
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-"
  ];
var _currentItemSelected = 'A+';

//Radio of gender
int selectedRadio;
  @override
  void initState(){
    super.initState();
    selectedRadio = -1;
  }
  setSelectedRadio(int val){
    setState(() {
      selectedRadio = val;
    });
  }

// validation
  void validateAndSave() {
    final form = _formKey.currentState;
    if(form.validate()){
      if(selectedRadio<0){
        print("form invalid");
      }
      else{
        print("form is valid");
      }
    }
    else{
      print("form invalid");
    }
    
  }

// save data
TextEditingController _date = new TextEditingController();

//validateName
String validateName(String value) {
    if (value.length < 3)
      return 'ឈ្មោះត្រូវច្រើនជាងពីរ';
    else
      return null;
  }

// validateMobile
 String validateMobile(String value) {
    if (value.length > 8 && value.length < 11)
      return null;
    else
      return 'លេខទូរស័ព្ទមិនអាចតិចជាង៨និងលើសពី១០ខ្ទង់បានទេ';
     
  }
// validateEmail
 String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'អ៊ីម៉ែលមិនត្រឹមត្រូវទេ';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
     var textSize = Responsive<double>( 25 ,sm: 10,md: 20, lg: 30).getValue(context);
     var width = Responsive<double>(100,sm: 160 , md: 210,lg: 400).getValue(context);
      TextStyle headerOne = TextStyle(
        fontSize: textSize,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      );
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(AppLocalizations.of(context).translate('app-bar')),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Text('My Health'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Share'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Log Out'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
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
      body: Container(
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row( children: [
              Expanded(
                  child:Container(
                    color: Colors.red,
                    height: 170,
                    child: Column(
                      children: <Widget>[
                        Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(  
                              'ព័ត៌មានផ្ទាល់ខ្លួន',
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
                                  width:300.0,
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
            Form(
              key: _formKey,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                      child: 
                        Text(
                          'ឈ្មោះ​ ៖',
                          style: headerOne,
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
                      child:
                        Container(
                          width: width,
                          child: TextFormField(
                            validator: validateName,
                            style: headerOne,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "បញ្ចូលឈ្មោះ",
                              border: OutlineInputBorder( 
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        )
                      ) 
                    ],
                  ),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                      child: 
                        Text(
                          'ភេទ ៖',
                          style: headerOne,
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
                      child:
                        Container(
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                            ButtonBar(
                              alignment: MainAxisAlignment.center,
                            
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                  child: 
                                    Text(
                                      'ប្រុស',
                                      style: headerOne,
                                    ),
                                ),
                                Radio(
                                  value: 1,
                                  groupValue: selectedRadio,
                                  activeColor: Colors.green, 
                                  onChanged: (val){
                                    setSelectedRadio(val);
                                  }
                                  ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                  child: 
                                    Text(
                                      'ស្រី',
                                      style: headerOne,
                                    ),
                                ),
                                Radio(
                                  value: 2,
                                  groupValue: selectedRadio,
                                  activeColor: Colors.green, 
                                  onChanged: (val){
                                    setSelectedRadio(val);
                                  },
                                  
                                ),
                              ],
                            )
                          ],
                          )
                      ) 
                     )
                    ],
                  ),
                  Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                      child: 
                        Text(
                          'ថ្ងៃ​ ខែ ឆ្នាំកំណើត៖',
                          style: headerOne,
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
                      child:
                        Container(
                          width: width,
                          child: TextFormField(
                            onTap: () {
                              _showDateTimePicker();
                              // hide keyboard
                              FocusScope.of(context).requestFocus(new FocusNode());
                            },
                            controller: _date,
                            validator: (value) =>
                              value.isEmpty? 'ត្រូវតែបំពេញ ថ្ងៃ​ ខែ ឆ្នាំកំណើត' :null,
                            style: headerOne,
                            keyboardType:TextInputType.datetime,
                            decoration: InputDecoration(    
                              hintText: "បញ្ចូល​ ថ្ងៃ​ ខែ ឆ្នាំកំណើត",
                              border: OutlineInputBorder( 
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                               suffix: IconButton(
                                icon: const Icon(Icons.date_range), 
                                onPressed: (){
                                },
                              ), 
                            ),
                          ),
                        )
                      ) 
                    ],
                  ),
                  Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                      child: 
                        Text(
                          'ប្រភេទឈាម ៖',
                          style: headerOne,
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
                      child:
                        Container(
                          width: width,
                          child: DropdownButtonFormField(
                            validator: (value) =>
                              value.isEmpty? 'ត្រូវតែបំពេញប្រភេទឈាម' : null,
                            style: headerOne,
                            decoration: InputDecoration(
                              border: OutlineInputBorder( 
                                borderRadius: BorderRadius.circular(20.0),
                              ), 
                            ),
                            items:  _currencies.map((String dropDownStringItem){
                              return DropdownMenuItem(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem),
                              );
                            }).toList(), 
                            onChanged: (String newValueSelected){
                              setState(() {
                                this._currentItemSelected = newValueSelected;
                              });
                            },
                            value: _currentItemSelected,
                            )
                        )
                      ) 
                    ],
                  ),
                  Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                      child: 
                        Text(
                          'សញ្ជាតិ ៖',
                          style: headerOne,
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
                      child:
                        Container(
                          width: width,
                          child: TextFormField(
                            validator: (value) =>
                              value.isEmpty? 'ត្រូវតែបំពេញសញ្ជាតិ' : null,
                            style: headerOne,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "បញ្ចូលសញ្ជាតិ",
                              border: OutlineInputBorder( 
                                borderRadius: BorderRadius.circular(20.0),
                              ), 
                            ),
                          ),
                        )
                      ) 
                    ],
                  ),
                  Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                      child: 
                        Text(
                          'លេខទូរស័ព្ទ ៖',
                          style: headerOne,
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
                      child:
                        Container(
                          width: width,
                          child: TextFormField(
                            validator: validateMobile,
                            style: headerOne,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "បញ្ចូលលេខទូរស័ព្ទ",
                              border: OutlineInputBorder( 
                                borderRadius: BorderRadius.circular(20.0),
                              ), 
                            ),
                          ),
                        )
                      ) 
                    ],
                  ),
                  Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                      child: 
                        Text(
                          'អ៊ីម៉ែល ៖',
                          style: headerOne,
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
                      child:
                        Container(
                          width: width,
                          child: TextFormField(
                            validator:validateEmail,
                            style: headerOne,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "បញ្ចូលអ៊ីម៉ែល",
                              border: OutlineInputBorder( 
                                borderRadius: BorderRadius.circular(20.0),
                              ), 
                            ),
                          ),
                        )
                      ) 
                    ],
                  ),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                      child: 
                        Text(
                          'ទីលំនៅ ៖',
                          style: headerOne,
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
                      child:
                        Container(
                          width: width,
                          child: TextFormField(
                            validator: (value) =>
                              value.isEmpty? 'ត្រូវតែបំពេញទីលំនៅ' : null,
                            style: headerOne,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "បញ្ចូលទីលំនៅ",
                              border: OutlineInputBorder( 
                                borderRadius: BorderRadius.circular(20.0),
                              ), 
                            ),
                          ),
                        )
                      ) 
                    ],
                  ),
                const SizedBox(height:30),
                Container(
                  width: 300,
                  height: 50,
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.red)
                    ),
                    color: Colors.red[200],
                    onPressed: (){
                      if(selectedRadio<0){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("ភេទត្រូវតែបំពេញ"),
                            );
                          });
                      }
                      validateAndSave();
                      
                    },
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.description),
                        Text('រក្សាទុក')
                      ],
                    )
                ),
              ),
              const SizedBox(height:30),
              ],
            )
              )
            
          ]
      ),
      ),
    )
    );
  }
}
