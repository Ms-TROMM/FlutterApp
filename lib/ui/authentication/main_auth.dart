import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/authentication/tutorial.dart';
import 'package:ms_tromm/ui/home/home.dart';
import 'package:ms_tromm/ui/survey/survey_main.dart';

void main() {
  runApp(MaterialApp(
    title: 'MS. TROMM',
    initialRoute: '/',
    routes: {
      // FIXME fix route later
      '/': (context) => const HomePage(),
      '/survey': (context) => const SurveyMain(),
      '/home': (context) => const HomePage(),
      '/tutorial': (context) => const TutorialPage()
    },
    theme: ThemeData(
        fontFamily: 'Roboto'
    ),
  ));
}