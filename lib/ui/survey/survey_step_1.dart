
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/survey/survey_step_2.dart';
import 'package:ms_tromm/ui/widgets/tromm_button.dart';

class SurveyStepFirst extends StatefulWidget {
  const SurveyStepFirst({Key? key}) : super(key: key);

  @override
  _SurveyStepFirstState createState() => _SurveyStepFirstState();
}

class _SurveyStepFirstState extends State<SurveyStepFirst> {
  Map<String, String> imagePath = {
    'style_athlete.png': '애슬레저룩',
    'style_coat.png': '얼어죽어도 코트',
    'style_comfy.png': '편안함을 추구',
    'style_hip.png': '힙한 스트릿',
    'style_modern.png': '모던',
    'style_suit.png': '깔끔한 정장'
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설문 (1/3)'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '평소에 자주 입는 스타일은 어떻게 되시나요? 3개 까지 골라주세요!',
              style: Theme.of(context).textTheme.headline5,
            ),
            GridView.count(
              crossAxisCount: 3,
              children: List.generate(6, (index) {
                return Center(
                  child: Column(
                    children: [
                      Image.asset(
                          'assets/images/${imagePath.entries.elementAt(index).key}', width: 75,),
                      Text(imagePath.entries.elementAt(index).value)
                    ],
                  ),
                );
              }),
              shrinkWrap: true,
            ),
            const Center(
              child: Text(
                '여기에 없어요',
                style: TextStyle(color: Colors.black38, fontSize: 20),
              ),
            ),
            TrommButton(
              onPressed: () {
                // move onto next screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SurveyStepTwoPage()));
              },
              text: '다음',
            )
          ],
        ),
      ),
    );
  }
}
