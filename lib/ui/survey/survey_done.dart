import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/home/home.dart';
import 'package:ms_tromm/ui/widgets/logo.dart';
import 'package:ms_tromm/ui/widgets/spacer.dart';
import 'package:ms_tromm/ui/widgets/tromm_button.dart';

class SurveyDonePage extends StatefulWidget {
  const SurveyDonePage({Key? key}) : super(key: key);

  @override
  _SurveyDonePageState createState() => _SurveyDonePageState();
}

class _SurveyDonePageState extends State<SurveyDonePage> {
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
                Text('설문을 완료해주셨군요', style: Theme.of(context).textTheme.headline6),
                const Text('김엘지님',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28))
              ]),
              spacer,
              Text(
                '더 정확한 추천을 하는 \nMs. TROMM이 되겠습니다!\n감사합니다 :)',
                style: Theme.of(context).textTheme.headline5,
              ),
              spacer,
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Image.asset('assets/images/survey_done.png',
                    fit: BoxFit.fill),
              ),
              spacer,
              TrommButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                text: '홈으로 이동',
              )
            ],
          ),
        ),
      ),
    );
  }
}
