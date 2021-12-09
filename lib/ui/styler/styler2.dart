import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ms_tromm/ui/widgets/alert_dialog.dart';
import 'package:ms_tromm/ui/widgets/spacer.dart';
import 'package:ms_tromm/ui/widgets/tromm_button.dart';

class Styler2 extends StatefulWidget {
  const Styler2({Key? key}) : super(key: key);

  @override
  _Styler2State createState() => _Styler2State();
}

enum OperatingState { running, stopped }

class _Styler2State extends State<Styler2> with TickerProviderStateMixin {
  List<bool> selectedItems = [false, false, false, false, false, false];

  Map<String, Color> data = {
    '살균': const Color(0x426ba5fd),
    '보관': const Color(0x426ba5fd),
    '스타일링': const Color(0x7a4a91fd),
    '고급의류': const Color(0x7a4a91fd),
    '스팀살균': const Color(0xcc6ba5fd),
    '섬세건조': const Color(0xcc6ba5fd)
  };

  BoxDecoration boxDecoProgress = BoxDecoration(
      border: Border.all(color: Colors.grey, width: 1),
      borderRadius: const BorderRadius.all(Radius.circular(5)));

  bool isPowerOn = false;
  bool isPlayOn = false;

  OperatingState operatingState = OperatingState.stopped;
  int levelClock = 180;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
                levelClock) // gameData.levelClock is a user entered number elsewhere in the applciation
        );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('스타일러'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            spacer,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/icon_awesome_wifi.png',
                      width: 18,
                      color: getColor(operatingState),
                    ),
                    Text(
                      '스타일러 연결 완료',
                      style: TextStyle(color: getColor(operatingState)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/images/icon_awesome_wifi.png',
                        width: 18, color: Colors.grey),
                    Text('스마트 미러와 연결'),
                  ],
                )
              ],
            ),
            spacer,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    operatingState == OperatingState.running
                        ? 'assets/images/power_button_on.png'
                        : 'assets/images/power_button.png',
                    width: MediaQuery.of(context).size.width * 0.28,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28,
                    height: MediaQuery.of(context).size.width * 0.28,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        getOperatingStateText(operatingState),
                        getCountDownText(operatingState),
                        Container(
                            padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                            decoration: boxDecoProgress,
                            child: const Text('예약'))
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    operatingState == OperatingState.running
                        ? 'assets/images/play_button_on.png'
                        : 'assets/images/play_button.png',
                    width: MediaQuery.of(context).size.width * 0.28,
                  ),
                )
              ],
            ),
            spacer,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(4),
                  decoration: boxDecoProgress,
                  child: const Text(
                    '스팀 준비',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(4),
                    decoration: boxDecoProgress,
                    child: const Text('리프레쉬', style: TextStyle(fontSize: 20))),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
                Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(4),
                    decoration: boxDecoProgress,
                    child: const Text('건        조',
                        style: TextStyle(fontSize: 20)))
              ],
            ),
            spacer,
            GridView.count(
              crossAxisCount: 3,
              children: List.generate(6, (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedItems[index] = !selectedItems[index];
                    });
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: GestureDetector(
                          onTap: () {
                            if (index == 2) {
                              showMaterialModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (context) => SizedBox(
                                  height: 400,
                                  child: Column(
                                    children: [
                                      spacer,
                                      const Text('스타일링 코스를 선택해주세요',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold)),
                                      spacer,
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  simpleDialog(
                                                      context,
                                                      "스타일링 코스",
                                                      "표준을 선택하셨습니다. 이대로 진행할까요?",
                                                      () {
                                                  }));
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: Color(0x426ba5fd)),
                                          child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              height: 54,
                                              child: const Center(
                                                child: Text(
                                                  '표준',
                                                  style: TextStyle(fontSize: 18),
                                                ),
                                              )),
                                        ),
                                      ),
                                      spacer,
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Color(0x7a4a91fd)),
                                        child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: 54,
                                            child: const Center(
                                              child: Text(
                                                '급속',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            )),
                                      ),
                                      spacer,
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xcc6ba5fd)),
                                        child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: 54,
                                            child: const Center(
                                              child: Text(
                                                '강력',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            )),
                                      ),
                                      spacer,
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 16, 0),
                                        child: TrommButton(
                                            onPressed: () {
                                              setState(() {
                                                operatingState =
                                                    OperatingState.running;
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            text: '확인'),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: data.entries.elementAt(index).value),
                            child: Center(
                              child: Text(data.entries.elementAt(index).key,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }

  getOperatingStateText(OperatingState operatingState) {
    if (operatingState == OperatingState.running) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('스타일러',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
          Text(' 가동중')
        ],
      );
    } else {
      return Text('가동 전');
    }
  }

  getCountDownText(OperatingState operatingState) {
    if (operatingState == OperatingState.running) {
      return Countdown(
        animation: StepTween(
          begin: levelClock, // THIS IS A USER ENTERED NUMBER
          end: 0,
        ).animate(_controller),
      );
    } else {
      return const Text(
        '88:88',
        style: TextStyle(fontFamily: 'DigitalMono', fontSize: 24),
      );
    }
  }

  getColor(OperatingState operatingState) {
    if (operatingState == OperatingState.running) {
      return Colors.blue;
    } else {
      return Colors.grey;
    }
  }
}

class Countdown extends AnimatedWidget {
  Countdown({Key? key, required this.animation})
      : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    return Text(
      timerText,
      style: TextStyle(
        fontFamily: 'DigitalMono',
        fontSize: 24,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

class PowerButton extends StatefulWidget {
  const PowerButton({Key? key}) : super(key: key);

  @override
  _PowerButtonState createState() => _PowerButtonState();
}

class _PowerButtonState extends State<PowerButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Image.asset(
        'assets/images/power_button.png',
        width: MediaQuery.of(context).size.width * 0.28,
      ),
    );
  }
}

class ControlPanelCenter extends StatefulWidget {
  const ControlPanelCenter({Key? key}) : super(key: key);

  @override
  _ControlPanelCenterState createState() => _ControlPanelCenterState();
}

class _ControlPanelCenterState extends State<ControlPanelCenter> {
  BoxDecoration boxDecoProgress = BoxDecoration(
      border: Border.all(color: Colors.grey, width: 1),
      borderRadius: const BorderRadius.all(Radius.circular(5)));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.28,
        height: MediaQuery.of(context).size.width * 0.28,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('작동 전'),
            const Text(
              '00:00',
              style: TextStyle(fontFamily: 'DigitalMono', fontSize: 24),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                decoration: boxDecoProgress,
                child: const Text('예약'))
          ],
        ),
      ),
    );
  }
}

class PlayButton extends StatefulWidget {
  const PlayButton({Key? key}) : super(key: key);

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Image.asset(
        'assets/images/play_button.png',
        width: MediaQuery.of(context).size.width * 0.28,
      ),
    );
  }
}
