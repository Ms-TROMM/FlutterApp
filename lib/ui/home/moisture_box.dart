import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/theme/colors.dart';
import 'package:ms_tromm/ui/theme/dimens.dart';

class MoistureBox extends StatefulWidget {
  const MoistureBox({Key? key}) : super(key: key);

  @override
  _MoistureBoxState createState() => _MoistureBoxState();
}

class _MoistureBoxState extends State<MoistureBox> {

  bool isOn = false;
  bool isOnDry = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0), color: MyColor.secondary),
      height: MediaQuery.of(context).size.width * 0.35,
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("현재 우리집", style: TextStyle(fontSize: MyDimens.FontSize_ExtraMedium, fontWeight: FontWeight.bold,)),
                Text("22℃ / 70%", style: TextStyle(fontSize: MyDimens.FontSize_ExtraMedium,)),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("실내제습"),
                      Switch(
                        value: isOn,
                        onChanged: (value) {
                          setState(() {
                            isOn = !isOn;
                          });
                        },
                        activeTrackColor: MyColor.secondary,
                        activeColor: Colors.blue,
                      ),
                    ],
                  )
              ),
              Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("자동건조"),
                      Switch(
                        value: isOnDry,
                        onChanged: (value) {
                          setState(() {
                            isOnDry = !isOnDry;
                          });
                        },
                        activeTrackColor: MyColor.secondary,
                        activeColor: Colors.blue,
                      ),
                    ],
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}