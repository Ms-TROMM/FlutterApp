import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/theme/colors.dart';
import 'package:ms_tromm/ui/theme/dimens.dart';

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
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    Text(
      'Index 1: Recommendation',
      style: optionStyle,
    ),
    Text(
      'Index 2: Styler',
      style: optionStyle,
    ),
    Text(
      'Index 3: More',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.black12,
          title:
              const Text('Ms. TROMM', style: TextStyle(fontFamily: 'Jalnan'))),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.widgets),
            label: '스타일러',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '메뉴',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
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
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(20, 35, 20, 20),
              child: Text("허유진님 안녕하세요!",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30)),
            ),
          ),
          Row(
            children: [WeatherBox(), RecommendationBox()],
          ),
          StylerControlBox(),
          MoistureBox()
        ],
      ),
    );
  }
}

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
      width: MediaQuery.of(context).size.width * 0.425,
      height: MediaQuery.of(context).size.width * 0.4,
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
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
                    children: const [
                      Text("금요일",
                          style: TextStyle(fontSize: MyDimens.FontSize_Medium)),
                      Text("5",
                          style: TextStyle(fontSize: MyDimens.FontSize_Large)),
                    ],
                  ),
                ),
                const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.home,
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
}

class RecommendationBox extends StatefulWidget {
  const RecommendationBox({Key? key}) : super(key: key);

  @override
  _RecommendationBoxState createState() => _RecommendationBoxState();
}

class _RecommendationBoxState extends State<RecommendationBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0), color: MyColor.secondary),
      width: MediaQuery.of(context).size.width * 0.425,
      height: MediaQuery.of(context).size.width * 0.4,
      margin: const EdgeInsets.fromLTRB(0, 10, 20, 20),
      child: Container(
          alignment: Alignment.topRight,
          child: const Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "오늘의\n추천",
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: MyDimens.FontSize_Medium,
                  fontWeight: FontWeight.w900),
            ),
          )),
    );
  }
}

class StylerControlBox extends StatefulWidget {
  const StylerControlBox({Key? key}) : super(key: key);

  @override
  _StylerControlBoxState createState() => _StylerControlBoxState();
}

class _StylerControlBoxState extends State<StylerControlBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.grey),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.width * 0.5,
        margin: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(onPressed: () {  }, color: Colors.white, child: Text("스팀준비"),),
              MaterialButton(onPressed: () {  }, color: Colors.white, child: Text("리프레쉬")),
              MaterialButton(onPressed: () {  }, color: Colors.white, child: Text("건조"),),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("88:88", style: TextStyle(fontFamily: 'DigitalMono', fontSize: 84),),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: MaterialButton(onPressed: () {  }, color: Colors.white, child: Row(
                      children: [
                        Icon(Icons.home),
                        Text("보충"),
                      ],
                    ),),
                  ),
                  MaterialButton(onPressed: () {  }, color: Colors.white, child: Row(
                    children: [
                      Icon(Icons.home),
                      Text("버림"),
                    ],
                  ),),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MoistureBox extends StatefulWidget {
  const MoistureBox({Key? key}) : super(key: key);

  @override
  _MoistureBoxState createState() => _MoistureBoxState();
}

class _MoistureBoxState extends State<MoistureBox> {

  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0), color: MyColor.secondary),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("현재 우리집", style: TextStyle(fontSize: MyDimens.FontSize_ExtraMedium, fontWeight: FontWeight.bold,)),
                Text("21℃ /60%", style: TextStyle(fontSize: MyDimens.FontSize_ExtraMedium,)),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: Colors.white),
            width: MediaQuery.of(context).size.width * 0.35,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("실내제습"),
                Switch(
                  value: isOn,
                  onChanged: (value) {
                    setState(() {
                      isOn = !isOn;
                    });
                  },
                  activeTrackColor: MyColor.secondary,
                  activeColor: Colors.blue,
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
