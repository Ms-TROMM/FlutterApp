import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/home/recommendation_box.dart';
import 'package:ms_tromm/ui/home/styler_control_box.dart';
import 'package:ms_tromm/ui/home/weather_box.dart';
import 'package:ms_tromm/ui/recommendation/recommendation_page.dart';
import 'package:ms_tromm/ui/settings/settings.dart';
import 'package:ms_tromm/ui/styler/styler.dart';

import 'alert_page.dart';
import 'moisture_box.dart';

void main() {
  runApp(MaterialApp(
    title: 'MS. TROMM',
    theme: ThemeData(fontFamily: 'Roboto'),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    RecommendationPage(),
    StylerPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  _getBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up),
          label: '추천',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_laundry_service),
          label: '스타일러',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: '설정',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ms. TROMM', style: TextStyle(fontFamily: 'Jalnan')),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AlertPage()));
                },
                child: Image.asset(
                  'assets/images/icon_feather_bell.png',
                  width: 24,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _getWelcomeContainer("김엘지"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Expanded(child: WeatherBox()),
                Expanded(child: RecommendationBox())
              ],
            ),
            const StylerControlBox(),
            const MoistureBox()
          ],
        ),
      ),
    );
  }

  _getWelcomeContainer(String name) {
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text('$name님 안녕하세요!',
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 30)),
      ),
    );
  }
}
