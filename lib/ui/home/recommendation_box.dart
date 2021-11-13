import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:ms_tromm/ui/theme/colors.dart';
import 'package:ms_tromm/ui/theme/dimens.dart';

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