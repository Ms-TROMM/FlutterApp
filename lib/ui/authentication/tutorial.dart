import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/authentication/login.dart';
import 'package:ms_tromm/ui/widgets/logo.dart';
import 'package:ms_tromm/ui/widgets/tromm_button.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Logo(
            edgeInsets: EdgeInsets.fromLTRB(48, 64, 0, 0),
          ),
          Expanded(
            child: PageView(
              /// [PageView.scrollDirection] defaults to [Axis.horizontal].
              /// Use [Axis.vertical] to scroll vertically.
              scrollDirection: Axis.horizontal,
              controller: controller,
              children: <Widget>[
                Center(
                  child: Tutorial(
                    imagePath: 'onboard_1',
                    text: 'Ms.TROMM과 함께\n당신의 스타일러 활용도를\n극대화해보세요',
                    buttonText: '다음',
                    onPressed: () {
                      controller.animateToPage(1,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                  ),
                ),
                Center(
                  child: Tutorial(
                    imagePath: 'onboard_2',
                    text: '오늘의 나에 맞는\n다양한 스타일을 체험하세요',
                    buttonText: '다음',
                    onPressed: () {
                      controller.animateToPage(2,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                  ),
                ),
                Center(
                  child: Tutorial(
                    imagePath: 'onboard_3',
                    text: '우리 집 환경을\n더 스마트하게 조절하세요',
                    buttonText: '로그인',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tutorial extends StatelessWidget {
  final String imagePath;
  final String text;
  final GestureTapCallback onPressed;
  final String buttonText;

  const Tutorial(
      {Key? key,
      required this.imagePath,
      required this.text,
      required this.onPressed,
      required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 0, 24, 0),
              child: Image.asset('assets/images/$imagePath.png'),
            ),
            Text(text,
                style: const TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center),
            TrommButton(onPressed: onPressed, text: buttonText)
          ],
        ),
      ),
    );
  }
}
