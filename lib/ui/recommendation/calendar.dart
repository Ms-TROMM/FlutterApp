import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/theme/dimens.dart';

class CalendarRecommendPage extends StatefulWidget {
  const CalendarRecommendPage({Key? key}) : super(key: key);

  @override
  _CalendarRecommendPageState createState() => _CalendarRecommendPageState();
}

class _CalendarRecommendPageState extends State<CalendarRecommendPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: _getRecommendText("홍길동"),
        ),
        Expanded(
          child: _getRecommendList(),
        )
      ],
    );
  }

  _getRecommendText(String name) {
    return Text(
      '$name님 안녕하세요!\n오늘은 면접이 있는 날입니다.\n정장 세트가 스타일러 내에 있습니다.',
      style: const TextStyle(
          fontSize: MyDimens.FontSize_ExtraMedium, fontWeight: FontWeight.bold),
    );
  }

  _getRecommendList() {
    final List<String> entries = <String>['', '', ''];
    final List<int> colorCodes = <int>[200, 400, 600];

    return ListView.separated(
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
