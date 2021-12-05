import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      height: MediaQuery.of(context).size.width * 0.4,
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 16),
      child: Container(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                Image.asset('assets/images/survey_done.png',
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.white60,
                    fit: BoxFit.cover, colorBlendMode: BlendMode.modulate,),
                Container(
                  alignment: Alignment.topRight,
                  child: const Text(
                    "오늘의\n추천",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.black, fontSize: MyDimens.FontSize_ExtraMedium, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
