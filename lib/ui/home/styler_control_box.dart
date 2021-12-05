import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/models/connectable.dart';
import 'package:ms_tromm/models/smart_mirror.dart';
import 'package:ms_tromm/models/styler.dart';

class StylerControlBox extends StatefulWidget {
  const StylerControlBox({Key? key}) : super(key: key);

  @override
  _StylerControlBoxState createState() => _StylerControlBoxState();
}

class _StylerControlBoxState extends State<StylerControlBox> {
  var roundCorner = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  );

  late Styler styler;
  late SmartMirror smartMirror;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    styler = Styler();
    smartMirror = SmartMirror();

    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        styler.setConnectionStateRandom();
        smartMirror.setConnectionStateRandom();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Color stylerConnectionColor =
        Color(colorFromConnectionState(styler.connectionState));

    Color smartMirrorConnectionColor =
        Color(colorFromConnectionState(smartMirror.connectionState));

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0), color: Colors.black12),
      height: MediaQuery.of(context).size.width * 0.6,
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Image.asset(
                        imagePathFromConnectionState(styler.connectionState),
                        width: 14,
                        color: stylerConnectionColor,
                      )),
                  Text(styler.getMessage(),
                      style: TextStyle(color: stylerConnectionColor)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Image.asset(
                        imagePathFromConnectionState(
                            smartMirror.connectionState),
                        width: 14,
                        color: smartMirrorConnectionColor,
                      )),
                  Text(smartMirror.getMessage(),
                      style: TextStyle(color: smartMirrorConnectionColor)),
                ],
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.white,
                elevation: 0,
                child: Text("스팀준비"),
                shape: roundCorner,
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.white,
                elevation: 0,
                child: Text("리프레쉬"),
                shape: roundCorner,
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.white,
                elevation: 0,
                child: Text("건조"),
                shape: roundCorner,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('작동중'),
              const Text(
                "88:88",
                style: TextStyle(fontFamily: 'DigitalMono', fontSize: 84),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.white,
                      elevation: 0,
                      shape: roundCorner,
                      child: Row(
                        children: const [
                          Icon(Icons.add_circle, size: 16),
                          Padding(
                            padding: EdgeInsets.only(left: 4.0),
                            child: Text("보충"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    elevation: 0,
                    shape: roundCorner,
                    child: Row(
                      children: const [
                        Icon(Icons.remove_circle, size: 16),
                        Padding(
                          padding: EdgeInsets.only(left: 4.0),
                          child: Text("버림"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}
