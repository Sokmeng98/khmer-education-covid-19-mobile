import 'package:flutter/material.dart';
import 'package:khmer_education/screens/components/drawer.dart';
import 'AppLanguage.dart';
import 'app_localizations.dart';
import 'package:provider/provider.dart';
import 'screens/my-health/my_health.dart';
import 'screens/news/news.dart';
import 'screens/map/map.dart';
import 'screens/setting/setting.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _pageOptions = [
    MyHealth(),
    News(),
    Map(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
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
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title:
                Text(AppLocalizations.of(context).translate('my-health')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text(AppLocalizations.of(context).translate('news')),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
