import 'dart:math';
import 'package:flutter/material.dart';
import 'package:khmer_education/app_localizations.dart';

Positioned cardDemo(
    String questionItem,
    var iconItem,
    double bottom,
    double right,
    double left,
    double cardWidth,
    double rotation,
    double skew,
    BuildContext context,
    Function dismissImg,
    int flag,
    Function addImg,
    Function swipeRight,
    Function swipeLeft) {
  Size screenSize = MediaQuery.of(context).size;
  var question = AppLocalizations.of(context).translate('$questionItem');
  var questionData = question.split('::');

  return new Positioned(
    bottom: 100.0 + bottom,
    right: flag == 0 ? right != 0.0 ? right : null : null,
    left: flag == 1 ? right != 0.0 ? right : null : null,
    child: new Dismissible(
      key: new Key(new Random().toString()),
      crossAxisEndOffset: -0.3,
      onResize: () {
      },
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart)
          dismissImg(questionItem);
        else
          addImg(questionItem, question);
      },
      child: new Transform(
        alignment: flag == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
        //transform: null,
        transform: new Matrix4.skewX(skew),
        //..rotateX(-math.pi / rotation),
        child: new RotationTransition(
          turns: new AlwaysStoppedAnimation(
              flag == 0 ? rotation / 360 : -rotation / 360),
          child: new Hero(
            tag: "self-diagnosis",
            child: new GestureDetector(
              onTap: () {
                // Navigator.of(context).push(new PageRouteBuilder(
                //   pageBuilder: (_, __, ___) => new DetailPage(type: question),
                // ));
              },
              child: new Card(
                color: Colors.transparent,
                elevation: 20.0,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  side: new BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: new Container(
                  alignment: Alignment.center,
                  width: screenSize.width / 1.2,
                  height: screenSize.height / 1.5,
                  decoration: new BoxDecoration(
                    color: new Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        width: screenSize.width / 1.2,
                        height: screenSize.height / 1.9,
                        // decoration: new BoxDecoration(
                        //   borderRadius: new BorderRadius.only(
                        //       topLeft: new Radius.circular(8.0),
                        //       topRight: new Radius.circular(15.0)),
                        //   // image: question,
                        // ),
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
                          width: screenSize.width / 1.2 + cardWidth,
                          height:
                              screenSize.height / 1.7 - screenSize.height / 2.2,
                          alignment: Alignment.center,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new FlatButton(
                                  padding: new EdgeInsets.all(0.0),
                                  onPressed: () {
                                    swipeLeft(questionItem);
                                  },
                                  child: new Container(
                                    height: 60.0,
                                    width: 130.0,
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                          new BorderRadius.circular(15.0),
                                    ),
                                    child: new Text(
                                      AppLocalizations.of(context)
                                          .translate('no'),
                                      style: new TextStyle(color: Colors.white),
                                    ),
                                  )),
                              new FlatButton(
                                  padding: new EdgeInsets.all(0.0),
                                  onPressed: () {
                                    swipeRight(questionItem, question);
                                  },
                                  child: new Container(
                                    height: 60.0,
                                    width: 130.0,
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          new BorderRadius.circular(15.0),
                                    ),
                                    child: new Text(
                                      AppLocalizations.of(context)
                                          .translate('yes'),
                                      style: new TextStyle(color: Colors.white),
                                    ),
                                  ))
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
