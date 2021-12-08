import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/widgets/spacer.dart';

class Styler2 extends StatefulWidget {
  const Styler2({Key? key}) : super(key: key);

  @override
  _Styler2State createState() => _Styler2State();
}

class _Styler2State extends State<Styler2> {
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
                    ),
                    const Text('스타일러 연결 완료'),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/icon_awesome_wifi.png',
                      width: 18,
                    ),
                    const Text('스마트 미러와 연결'),
                  ],
                )
              ],
            ),
            spacer,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [PowerButton(), ControlPanelCenter(), PlayButton()],
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
                        child: Container(
                          decoration: BoxDecoration(
                              color: data.entries.elementAt(index).value),
                          child: Center(
                            child: Text(data.entries.elementAt(index).key,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700)),
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
              '88:88',
              style: TextStyle(fontFamily: 'DigitalMono', fontSize: 24),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(8,2,8,2),
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
