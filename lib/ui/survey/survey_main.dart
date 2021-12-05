import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/survey/survey_step_1.dart';
import 'package:ms_tromm/ui/widgets/logo.dart';
import 'package:ms_tromm/ui/widgets/spacer.dart';
import 'package:ms_tromm/ui/widgets/tromm_button.dart';

class SurveyMain extends StatefulWidget {
  const SurveyMain({Key? key}) : super(key: key);

  @override
  _SurveyMainState createState() => _SurveyMainState();
}

class _SurveyMainState extends State<SurveyMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Logo(edgeInsets: EdgeInsets.fromLTRB(0, 24, 0, 24)),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('첫 방문이시네요!', style: Theme.of(context).textTheme.headline6),
                const Text('김엘지님 안녕하세요 :)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28))
              ]),
              Text(
                '엘지님과 진행해드리기 전에 \n엘지님의 의견을 듣고\n더 나은 추천을 해드릴게요!',
                style: Theme.of(context).textTheme.headline5,
              ),
              spacer,
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Image.asset('assets/images/survey_first.png',
                    fit: BoxFit.fill),
              ),
              spacer,
              TrommButton(
                onPressed: () {
                  // move onto next screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SurveyStepFirst()));
                },
                text: '설문 진행하기',
              )
            ],
          ),
        ),
      ),
    );
  }
}
