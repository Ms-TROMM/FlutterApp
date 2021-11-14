import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/theme/dimens.dart';

class WeatherRecommendPage extends StatefulWidget {
  const WeatherRecommendPage({Key? key}) : super(key: key);

  @override
  _WeatherRecommendPageState createState() => _WeatherRecommendPageState();
}

class _WeatherRecommendPageState extends State<WeatherRecommendPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: _getRecommendText("홍길동"),
          ),
          Container(
            child: _getRecommendList(),
          )
        ],
      ),
    );
  }

  _getRecommendText(String name) {
    return Text(
      '$name님 안녕하세요!\n오늘 낮기온은 18℃, 밤기온은 5℃로 일교차가 매우 큰 날씨입니다. 오늘은 두꺼운 가디건이 어떨까요?',
      style: const TextStyle(
          fontSize: MyDimens.FontSize_ExtraMedium, fontWeight: FontWeight.bold),
    );
  }

  _getRecommendList() {
    final List<String> entries = <String>['두꺼운 가디건', '활동성 좋은 긴바지', '민트향'];
    final List<int> colorCodes = <int>[200, 400, 600];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.blue[colorCodes[index]]),
          height: 100,
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // TODO : Add Image for recommendation
                  Text(entries[index],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MyDimens.FontSize_Large,
                          color: Colors.white)),
                ],
              )),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
