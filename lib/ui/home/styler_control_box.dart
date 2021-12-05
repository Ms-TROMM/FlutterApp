import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StylerControlBox extends StatefulWidget {
  const StylerControlBox({Key? key}) : super(key: key);

  @override
  _StylerControlBoxState createState() => _StylerControlBoxState();
}

class _StylerControlBoxState extends State<StylerControlBox> {
  var roundCorner = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0), color: Colors.grey),
      height: MediaQuery.of(context).size.width * 0.45,
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
}
