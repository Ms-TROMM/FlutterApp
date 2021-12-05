import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/survey/survey_done.dart';
import 'package:ms_tromm/ui/widgets/tromm_button.dart';

class SurveyStepThree extends StatefulWidget {
  const SurveyStepThree({Key? key}) : super(key: key);

  @override
  _SurveyStepThreeState createState() => _SurveyStepThreeState();
}

class _SurveyStepThreeState extends State<SurveyStepThree> {

  Map<String, String> imagePath = {
    'scent_musk.png': '머스크',
    'scent_aromatic.png': '아로마틱',
    'scent_woody.png': '우디',
    'scent_citrus.png': '시트러스',
    'scent_floral.png': '플로럴',
    'scent_powdery.png': '파우더리'
  };


  List<String> explain = [
    '중성적인 느낌',
    '허브향',
    '나무를 연상시키는',
    '감귤의 상쾌함',
    '어우러진 꽃 향기',
    '벨벳처럼 부드러운'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설문 (3/3)'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '좋아하는 향은 어떻게 되시나요? 3개까지 골라주세요!',
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
                      Text(imagePath.entries.elementAt(index).value),
                      Text(explain[index], style: const TextStyle(
                        fontSize: 12, color: Colors.blue
                      ),)
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
                        builder: (context) => const SurveyDonePage()));
              },
              text: '다음',
            )
          ],
        ),
      ),
    );
  }
}
