import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StylerControlBox extends StatefulWidget {
  const StylerControlBox({Key? key}) : super(key: key);

  @override
  _StylerControlBoxState createState() => _StylerControlBoxState();
}

class _StylerControlBoxState extends State<StylerControlBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.grey),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.5,
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(onPressed: () {  }, color: Colors.white, child: Text("스팀준비"),),
              MaterialButton(onPressed: () {  }, color: Colors.white, child: Text("리프레쉬")),
              MaterialButton(onPressed: () {  }, color: Colors.white, child: Text("건조"),),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("88:88", style: TextStyle(fontFamily: 'DigitalMono', fontSize: 84),),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: MaterialButton(onPressed: () {  }, color: Colors.white, child: Row(
                      children: [
                        Icon(Icons.home),
                        Text("보충"),
                      ],
                    ),),
                  ),
                  MaterialButton(onPressed: () {  }, color: Colors.white, child: Row(
                    children: [
                      Icon(Icons.home),
                      Text("버림"),
                    ],
                  ),),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
