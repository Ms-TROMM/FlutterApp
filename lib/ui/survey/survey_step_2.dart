import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/survey/survey_step_3.dart';
import 'package:ms_tromm/ui/widgets/spacer.dart';
import 'package:ms_tromm/ui/widgets/tromm_button.dart';

class SurveyStepTwoPage extends StatefulWidget {
  const SurveyStepTwoPage({Key? key}) : super(key: key);

  @override
  _SurveyStepTwoPageState createState() => _SurveyStepTwoPageState();
}

class _SurveyStepTwoPageState extends State<SurveyStepTwoPage> {
  Map<Color, String> imagePath = {
    const Color(0xff000000): '블랙',
    const Color(0xff707070): '그레이',
    const Color(0xff001f62): '네이비',
    const Color(0xfffeffef): '아이보리',
    const Color(0xffffffff): '화이트',
    const Color(0xff2bac15): '그린',
    const Color(0xffe70318): '레드',
    const Color(0xffa77bca): '라벤더',
    const Color(0xfffbea2a): '옐로우'
  };

  List<bool> selectedItems = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설문 (2/3)'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '좋아하는 색상은 어떻게 되시나요? 3개까지 골라주세요!',
                style: Theme.of(context).textTheme.headline5,
              ),
              spacer,
              GridView.count(
                crossAxisCount: 3,
                children: List.generate(9, (index) {
                  return Center(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedItems[index] = !selectedItems[index];
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              border: Border.all(color: selectedItems[index] ? Colors.blue : Colors.black12, width: 1),
                              color: imagePath.entries.elementAt(index).key,
                              shape: BoxShape.circle),
                          height: 64,
                        ),
                        Text(imagePath.entries.elementAt(index).value, style: TextStyle(color: selectedItems[index] ? Colors.blue : Colors.black),)
                      ],
                    ),
                  ));
                }),
                shrinkWrap: true,
              ),
              spacer,
              const Center(
                child: Text(
                  '여기에 없어요',
                  style: TextStyle(color: Colors.black38, fontSize: 20),
                ),
              ),
              spacer,
              TrommButton(
                onPressed: () {
                  // move onto next screen
                  // move onto next screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SurveyStepThree()));
                },
                text: '다음',
              )
            ],
          ),
        ),
      ),
    );
  }
}
