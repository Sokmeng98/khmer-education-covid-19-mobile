import 'package:flutter/material.dart';

import '../../app_localizations.dart';

class News extends StatelessWidget {
  static const TextStyle headerOne = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
    decoration: TextDecoration.underline,
    decorationColor: Color.fromRGBO(255, 200, 200, 1.0),
    decorationThickness: 2,
  );

  static const TextStyle titleOne = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle categoryButton = TextStyle(
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).translate('news-category'),
                    style: headerOne,
                  ),
                ],
              ),
            ),
            Container(
              height: 120.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 0, 0.0, 0),
                    child: Container(
                      width: 120.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(134, 229, 226, 1.0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)
                              .translate('infection-statistics'),
                          style: categoryButton,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 0, 0.0, 0),
                    child: Container(
                      width: 120.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(226, 229, 134, 1.0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/symptom-covid-19');
                        },
                        child: Text(
                          AppLocalizations.of(context)
                              .translate('symptom-covid-19'),
                          style: categoryButton,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 0, 0.0, 0),
                    child: Container(
                      width: 120.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(229, 178, 134, 1.0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/prevention-covid-19');
                        },
                        child: Text(
                          AppLocalizations.of(context)
                              .translate('prevention-covid-19'),
                          style: categoryButton,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                height: 120.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0, 0.0, 0),
                      child: Container(
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(134, 229, 140, 1.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/history-covid-19');
                          },
                          child: Text(
                            AppLocalizations.of(context)
                                .translate('history-covid-19'),
                            style: categoryButton,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0, 0.0, 0),
                      child: Container(
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(134, 206, 229, 1.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/faq-covid-19');
                          },
                          child: Text(
                            AppLocalizations.of(context)
                                .translate('faq-covid-19'),
                            style: categoryButton,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0, 0.0, 0),
                      child: Container(
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(229, 134, 201, 1.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/quiz-covid-19');
                          },
                          child: Text(
                            AppLocalizations.of(context)
                                .translate('knowledge-test-covid-19'),
                            style: categoryButton,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).translate('hot-news'),
                    style: headerOne,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 15.0),
                    child: Container(
                      height: 80.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 15.0),
                    child: Container(
                      height: 80.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 15.0),
                    child: Container(
                      height: 80.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 15.0),
                    child: Container(
                      height: 80.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 15.0),
                    child: Container(
                      height: 80.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
