
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/theme/colors.dart';
import 'package:ms_tromm/ui/theme/dimens.dart';

class WeatherBox extends StatefulWidget {
  const WeatherBox({Key? key}) : super(key: key);

  @override
  _WeatherBoxState createState() => _WeatherBoxState();
}

class _WeatherBoxState extends State<WeatherBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0), color: MyColor.secondary),
      height: MediaQuery.of(context).size.width * 0.4,
      margin: const EdgeInsets.fromLTRB(0, 8, 16, 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(getWeekDay(),
                          style: const TextStyle(fontSize: MyDimens.FontSize_Medium)),
                      Text(getDay(),
                          style: const TextStyle(fontSize: MyDimens.FontSize_Large)),
                    ],
                  ),
                ),
                const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.brightness_5,
                      size: 64,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: const [
                Expanded(
                    flex: 2,
                    child: Text(
                      "11℃",
                      style: TextStyle(fontSize: MyDimens.FontSize_Large),
                    )),
                Expanded(
                    flex: 1,
                    child: Text("18℃/5℃",
                        style: TextStyle(fontSize: MyDimens.FontSize_Medium))),
              ],
            ),
          )
        ]),
      ),
    );
  }

  String getDay() {
    return DateTime.now().day.toString();
  }

  String getWeekDay(){
    String weekDay = '월요일';
    switch(DateTime.now().weekday) {
      case 1: weekDay = '월요일';
      break;
      case 2: weekDay = '화요일';
      break;
      case 3: weekDay = '수요일';
      break;
      case 4: weekDay = '목요일';
      break;
      case 5: weekDay = '금요일';
      break;
      case 6: weekDay = '토요일';
      break;
      case 7: weekDay = '일요일';
      break;
    }
    return weekDay;
  }
}