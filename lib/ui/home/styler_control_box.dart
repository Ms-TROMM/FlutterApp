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

    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
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
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                child: const Text("스팀준비"),
                shape: roundCorner,
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.white,
                elevation: 0,
                child: const Text("리프레쉬"),
                shape: roundCorner,
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.white,
                elevation: 0,
                child: const Text("건조"),
                shape: roundCorner,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('작동중'),
              const Text(
                "88:88",
                style: TextStyle(fontFamily: 'DigitalMono', fontSize: 64),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Image.asset(
                          'assets/images/pause.png',
                          width: 32,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Icon(Icons.add_circle, size: 16),
                                Text('버림')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Icon(Icons.remove_circle, size: 16),
                                Text('버림')
                              ],
                            ),
                          ),
                        ],
                      ),
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
