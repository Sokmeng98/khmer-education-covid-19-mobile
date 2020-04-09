import 'package:flutter/material.dart';
import 'package:khmer_education/app_localizations.dart';

Positioned cardDemoDummy(
    String questionItem,
    var iconItem,
    double bottom,
    double right,
    double left,
    double cardWidth,
    double rotation,
    double skew,
    BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  var question = AppLocalizations.of(context).translate('$questionItem');
  var questionData = question.split('::');
  return new Positioned(
    bottom: 100.0 + bottom,
    child: new Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: new BorderSide(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: new Container(
        alignment: Alignment.center,
        width: screenSize.width / 1.2,
        height: screenSize.height / 1.5,
        decoration: new BoxDecoration(
          color: new Color.fromRGBO(255, 200, 200, 1.0),
          borderRadius: new BorderRadius.circular(15.0),
        ),
        child: new Column(
          children: <Widget>[
            new Container(
              width: screenSize.width / 1.2,
              height: screenSize.height / 1.9,
              child: Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${questionData[0]}',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: screenSize.width / 1.35,
                                      height: screenSize.height / 4,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          iconItem,
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: screenSize.width * 0.7,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${questionData[1]}',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
            ),
            new Container(
                width: screenSize.width / 1.2,
                height: screenSize.height / 1.7 - screenSize.height / 2.2,
                alignment: Alignment.center,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new FlatButton(
                        padding: new EdgeInsets.all(0.0),
                        onPressed: () {},
                        child: new Container(
                          height: 60.0,
                          width: 130.0,
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                          child: new Text(
                            AppLocalizations.of(context).translate('no'),
                            style: new TextStyle(color: Colors.white),
                          ),
                        )),
                    new FlatButton(
                        padding: new EdgeInsets.all(0.0),
                        onPressed: () {},
                        child: new Container(
                          height: 60.0,
                          width: 130.0,
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            color: Colors.green,
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                          child: new Text(
                            AppLocalizations.of(context).translate('yes'),
                            style: new TextStyle(color: Colors.white),
                          ),
                        ))
                  ],
                ))
          ],
        ),
      ),
    ),
  );
}
