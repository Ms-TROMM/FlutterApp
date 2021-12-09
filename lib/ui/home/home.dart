import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/home/recommendation_box.dart';
import 'package:ms_tromm/ui/home/styler_control_box.dart';
import 'package:ms_tromm/ui/home/weather_box.dart';
import 'package:ms_tromm/ui/recommendation/recommendation_page.dart';
import 'package:ms_tromm/ui/settings/settings.dart';
import 'package:ms_tromm/ui/styler/styler2.dart';
import 'package:ms_tromm/ui/theme/colors.dart';
import 'package:ms_tromm/ui/theme/dimens.dart';

import 'alert_page.dart';
import 'moisture_box.dart';

void main() {
  runApp(MaterialApp(
    title: 'MS. TROMM',
    theme: ThemeData(fontFamily: 'Roboto'),
    home: const HomePage(),
  ));
}


class MainPage extends StatefulWidget {
  final ValueNotifier<bool> isOnNoti;
  const MainPage({Key? key, required this.isOnNoti}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isOnDry = false;

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
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0), color: MyColor.secondary),
          height: MediaQuery.of(context).size.width * 0.35,
          margin: const EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("현재 우리집", style: TextStyle(fontSize: MyDimens.FontSize_ExtraMedium, fontWeight: FontWeight.bold,)),
                    Text("21℃ /60%", style: TextStyle(fontSize: MyDimens.FontSize_ExtraMedium,)),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("실내제습"),
                          Switch(
                            value: widget.isOnNoti.value,
                            onChanged: (value) {
                              setState(() {
                                widget.isOnNoti.value = !widget.isOnNoti.value;
                              });
                            },
                            activeTrackColor: MyColor.secondary,
                            activeColor: Colors.blue,
                          ),
                        ],
                      )
                  ),
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("자동건조"),
                          Switch(
                            value: isOnDry,
                            onChanged: (value) {
                              setState(() {
                                isOnDry = !isOnDry;
                              });
                            },
                            activeTrackColor: MyColor.secondary,
                            activeColor: Colors.blue,
                          ),
                        ],
                      )
                  )
                ],
              )
            ],
          ),
        )
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


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late FirebaseMessaging messaging;

  ValueNotifier<bool> isOn = ValueNotifier(false);

  final List<Widget> _widgetOptions = <Widget>[
    MainPage(isOnNoti: ValueNotifier(false)),
    RecommendationPage(),
    Styler2(),
    SettingsPage(),
  ];

  Widget getWidget(int index) {
    if (index == 0) {
      return MainPage(isOnNoti: isOn);
    }
    return _widgetOptions.elementAt(index);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      print(value);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("MS. TROMM 알림"),
              content: Text(event.notification!.body!),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    print('running ... ');
                    if (event.notification!.body!.contains('제습')) {
                      setState(() {
                        isOn.value = true;
                      });
                    } else if (event.notification!.body!.contains('추천')) {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    }
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });

      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        print('Message clicked!');
      });
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<bool>(
        valueListenable: isOn,
        builder: (context, value, child){
          return Center(
            child: getWidget(_selectedIndex),
          );
        },
      ),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

}


