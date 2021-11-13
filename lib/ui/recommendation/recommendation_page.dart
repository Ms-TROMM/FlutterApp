import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/recommendation/calendar.dart';
import 'package:ms_tromm/ui/recommendation/control.dart';
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
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.brightness_5), text: '날씨',),
                Tab(icon: Icon(Icons.date_range), text: '일정',),
                Tab(icon: Icon(Icons.widgets), text: '제어'),
              ],
            ),
            title: const Text('추천'),
          ),
          body: const TabBarView(
            children: [
              WeatherRecommendPage(),
              CalendarRecommendPage(),
              ControlRecommendPage(),
            ],
          ),
        ),
      ),
    );
  }
}
