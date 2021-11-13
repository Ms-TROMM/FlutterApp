import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_tromm/ui/theme/colors.dart';
import 'package:ms_tromm/ui/theme/dimens.dart';

class StylerPage extends StatefulWidget {
  const StylerPage({Key? key}) : super(key: key);

  @override
  _StylerPageState createState() => _StylerPageState();
}

class _StylerPageState extends State<StylerPage> {
  List<bool> isSelected = <bool>[true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('스타일러'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.4,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.black, width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "스타일러 작동 상태",
              style: TextStyle(fontSize: MyDimens.FontSize_ExtraMedium),
            ),
            ToggleButtons(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('스팀준비',
                      style: TextStyle(fontSize: MyDimens.FontSize_Medium)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('리프레시',
                      style: TextStyle(fontSize: MyDimens.FontSize_Medium)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('준비',
                      style: TextStyle(fontSize: MyDimens.FontSize_Medium)),
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[buttonIndex] = !isSelected[buttonIndex];
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: isSelected,
            ),
          ],
        ),
      ),
    );
  }
}
