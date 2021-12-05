import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/recommendation/calendar.dart';
import 'package:ms_tromm/ui/recommendation/control.dart';
import 'package:ms_tromm/ui/recommendation/my_closet.dart';
import 'package:ms_tromm/ui/recommendation/weather.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({Key? key}) : super(key: key);

  @override
  _RecommendationPageState createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.brightness_5),
                  text: '오늘의 추천',
                ),
                Tab(icon: Icon(Icons.widgets), text: '제어 추천'),
              ],
            ),
            title: const Text('추천'),
          ),
          body: const TabBarView(
            children: [
              WeatherRecommendPage(),
              ControlRecommendPage(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyClosetPage()),
              );
            },
            child: const Icon(Icons.account_circle),
            backgroundColor: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
