import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/widgets/logo.dart';
import 'package:ms_tromm/ui/widgets/tromm_button.dart';

class SurveyStepFirst extends StatefulWidget {
  const SurveyStepFirst({Key? key}) : super(key: key);

  @override
  _SurveyStepFirstState createState() => _SurveyStepFirstState();
}

class _SurveyStepFirstState extends State<SurveyStepFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Logo(edgeInsets: EdgeInsets.fromLTRB(0, 16, 0, 16)),
            Text(
              '우선 평소에 자주 입는 스타일은 어떻게 되시나요?\n3개 까지 골라주세요!',
              style: Theme.of(context).textTheme.headline5,
            ),
            Expanded(
              child: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 3,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(6, (index) {
                  return Center(
                    child: Text(
                      'Item $index',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  );
                }),
              ),
            ),
            TrommButton(
              onPressed: () {
                // move onto next screen
              },
              text: '다음',
            )
          ],
        ),
      ),
    );
  }
}
