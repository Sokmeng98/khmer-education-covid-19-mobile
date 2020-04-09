import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:khmer_education/AppLanguage.dart';
import 'package:khmer_education/app_localizations.dart';
import 'package:khmer_education/screens/self-diagnosis/activeCard.dart';
import 'package:khmer_education/screens/self-diagnosis/data.dart';
import 'package:khmer_education/screens/self-diagnosis/dummyCard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelfDiagnosis extends StatefulWidget {
  @override
  SelfDiagnosisState createState() => new SelfDiagnosisState();
}

class SelfDiagnosisState extends State<SelfDiagnosis>
    with TickerProviderStateMixin {
  AnimationController _buttonController;
  Animation<double> rotate;
  Animation<double> right;
  Animation<double> bottom;
  Animation<double> width;
  int flag = 0;

  List data = questionData;
  List iconData = iconQuestionData;
  List originalData = questionData.map((element) => element).toList();
  int totalScore = 0;
  List selectedData = [];

  void initState() {
    super.initState();
    data = originalData;
    _buttonController = new AnimationController(
        duration: new Duration(milliseconds: 1000), vsync: this);

    rotate = new Tween<double>(
      begin: -0.0,
      end: -40.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    rotate.addListener(() {
      setState(() {
        if (rotate.isCompleted) {
          _buttonController.reset();
        }
      });
    });

    right = new Tween<double>(
      begin: 0.0,
      end: 400.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    bottom = new Tween<double>(
      begin: 15.0,
      end: 100.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    width = new Tween<double>(
      begin: 20.0,
      end: 25.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.bounceOut,
      ),
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  Future<Null> _swipeAnimation() async {
    try {
      await _buttonController.forward();
    } on TickerCanceled {}
  }

  dismissImg(String question) {
    setState(() {
      data.remove(question);
    });
  }

  addImg(String questionItem, String question) {
    setState(() {
      data.remove(questionItem);
      selectedData.add(questionItem);
      totalScore += int.parse(question.split("::")[2]);
    });
  }

  swipeRight(String questionItem, String question) {
    if (flag == 0)
      setState(() {
        flag = 1;
      });
    setState(() {
      data.remove(questionItem);
      selectedData.add(questionItem);
      totalScore += int.parse(question.split("::")[2]);
    });
    _swipeAnimation();
  }

  swipeLeft(String question) {
    if (flag == 1)
      setState(() {
        flag = 0;
      });
    setState(() {
      data.remove(question);
    });
    _swipeAnimation();
  }

  Widget _scoreResult() {
    if (totalScore >= 12) {
      // Call 115 immediately
      return Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 0.5,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Text(
                AppLocalizations.of(context)
                            .translate('you-are-at-high-risk'),
                style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 40.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Text(
                AppLocalizations.of(context)
                            .translate('contact-115-immediately'),
                style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: RaisedButton(
                onPressed: () {
                  launch("tel:115");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.call,
                      size: 30,
                      color: Color.fromRGBO(112, 112, 112, 1.0),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('hotline'),
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(112, 112, 112, 1.0),
                        ),
                      ),
                    ),
                  ],
                ),
                color: Color.fromRGBO(255, 200, 200, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (totalScore >= 6) {
      // Seek advice with doctor
      return Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 0.5,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Text(
                AppLocalizations.of(context)
                            .translate('you-are-at-risk'),
                style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 40.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Text(
                AppLocalizations.of(context)
                            .translate('seek-medical-advice'),
                style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Color.fromRGBO(112, 112, 112, 1.0),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('back-button'),
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(112, 112, 112, 1.0),
                        ),
                      ),
                    ),
                  ],
                ),
                color: Color.fromRGBO(255, 200, 200, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (totalScore >= 3) {
      // Maintain proper hygience
      return Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 0.5,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Text(
                AppLocalizations.of(context)
                            .translate('you-are-okay'),
                style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 40.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Text(
                AppLocalizations.of(context)
                            .translate('main-tain-hygiene'),
                style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Color.fromRGBO(112, 112, 112, 1.0),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('back-button'),
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(112, 112, 112, 1.0),
                        ),
                      ),
                    ),
                  ],
                ),
                color: Color.fromRGBO(255, 200, 200, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (totalScore >= 0) {
      // Maybe you are worry too mcuh!
      return Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 0.5,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Text(
                AppLocalizations.of(context)
                            .translate('you-are-really-okay'),
                style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 40.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Text(
                AppLocalizations.of(context)
                            .translate('worry-too-much'),
                style: new TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Color.fromRGBO(112, 112, 112, 1.0),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('back-button'),
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(112, 112, 112, 1.0),
                        ),
                      ),
                    ),
                  ],
                ),
                color: Color.fromRGBO(255, 200, 200, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;

    double initialBottom = 15.0;
    var dataLength = data.length;
    double backCardPosition = initialBottom + (dataLength - 1) * 10 + 10;
    double backCardWidth = -10.0;
    return (new Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('app-bar'),
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: new Container(
          // color: new Color.fromRGBO(106, 94, 175, 1.0),
          alignment: Alignment.center,
          child: dataLength > 0
              ? new Stack(
                  alignment: AlignmentDirectional.center,
                  children: data.map((item) {
                    if (data.indexOf(item) == dataLength - 1) {
                      return cardDemo(
                        item,
                        iconData[data.indexOf(item)],
                        bottom.value,
                        right.value,
                        0.0,
                        backCardWidth + 10,
                        rotate.value,
                        rotate.value < -10 ? 0.1 : 0.0,
                        context,
                        dismissImg,
                        flag,
                        addImg,
                        swipeRight,
                        swipeLeft,
                      );
                    } else {
                      backCardPosition = backCardPosition - 10;
                      backCardWidth = backCardWidth + 10;

                      return cardDemoDummy(
                        item,
                        iconData[data.indexOf(item)],
                        backCardPosition,
                        0.0,
                        0.0,
                        backCardWidth,
                        0.0,
                        0.0,
                        context,
                      );
                    }
                  }).toList())
              : _scoreResult()),
    ));
  }
}
