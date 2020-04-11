
import 'package:flutter/material.dart';
import 'package:khmer_education/app_localizations.dart';
import 'dart:async';
import 'dart:convert'; 
import 'package:http/http.dart' as http;

class InfectedStatistics extends StatefulWidget {
  @override
  _InfectedStatisticsState createState() => _InfectedStatisticsState();
}



class _InfectedStatisticsState extends State<InfectedStatistics> {

   static const TextStyle titleOne = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    );
    static const TextStyle headerOne = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

// take data from api  
 List data;
  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://khcovid19.com/api/"),
      headers: {
        "Accept": "application/json"
      }
      
    );

    this.setState(() {
      data = json.decode(response.body);
   
    });
    
    // can use if else but it dose a lot of code
    int i;
    int count=0;
    for(i=0;i<data.length;i++){
      if(data[i]["age"]=="30"){
        count = count + 1;
      } 
      
    }
    this.count = count;
    //want to count number base on location but it has some error 
    // var res = {};
    //  data.forEach((v) {
    //  res[v.location_en] ? res[v.location_en]++ :  res[v.location_en] = 1;
    //    }
    // );
    // print(res);
    
  }

  int count;
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {

    final khmerStatistics =new Expanded(
            child:Container(
              height: 50,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black)
                ),
                color: Colors.red,
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("ពិភពលោក",
                    style: headerOne)
                  ],
                ),
                onPressed: (){
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
                color: Colors.red,
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("ប្រទេសកម្ពុជា",
                    style: headerOne)
                  ],
                ),
                onPressed: (){
                },
              ),
          )
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
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
                    Row(
                      children: <Widget>[
                        khmerStatistics,
                        worldStatistics
                      ],
                    ),
                    Row(
                      children: <Widget>[
                      //  Text('$count')
                      ],
                    )
                    
                  ]
                )
              ]
            )
          ),
        //  display api
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate:SliverChildBuilderDelegate(
              (context, index){
                return new Row(
                    children: <Widget>[
                      Text(data[index]["location_en"]),
                      Text(data[index]["age"]),
                      Text(data[index]["gender"]),
                    ],
                  );  
              },
              childCount: data == null ? 0 : data.length,
            ) 
          )
        ]
      )
    );
  }
}