import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ms_tromm/api/service.dart';
import 'package:ms_tromm/ui/widgets/spacer.dart';
import 'package:ms_tromm/ui/widgets/tromm_button.dart';

AlertDialog yesOrNoDialog(BuildContext context, String? title, String content,
    VoidCallback onYes, VoidCallback onNo) {
  return AlertDialog(
    title: Text(title ?? ''),
    content: Text(content),
    actions: [
      TextButton(
          onPressed: () {
            onYes();
          },
          child: const Text('확인')),
      TextButton(
          onPressed: () {
            onNo();
            Navigator.of(context).pop();
          },
          child: const Text(
            '취소',
            style: TextStyle(color: Colors.red),
          )),
    ],
  );
}

AlertDialog simpleDialog(
    BuildContext context, String? title, String content, VoidCallback? onYes) {
  return AlertDialog(
    title: Text(title ?? ''),
    content: Text(content),
    actions: [
      TextButton(
          onPressed: () {
            if (onYes != null) {
              onYes();
            }
            Navigator.of(context).pop();
          },
          child: const Text('확인')),
    ],
  );
}

class FeedbackContainer extends StatefulWidget {
  const FeedbackContainer({Key? key}) : super(key: key);

  @override
  _FeedbackContainerState createState() => _FeedbackContainerState();
}

class _FeedbackContainerState extends State<FeedbackContainer> {
  List<bool> selectedItems = [false, false, false, false, false, false, false];

  int getIndexOfSelected() {
    for (int i = 0; i < selectedItems.length; i++) {
      if (selectedItems[i]) {
        return i;
      }
    }
    return 0;
  }

  List<String> items = [
    '정장',
    '티셔츠',
    '기능성 활동복',
    '청바지',
    '슬랙스',
    '치마',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          Text(
            "엘지님의 지난 'LG 전자 면접' 이다음 중 어떤 옷과 가장 어울리는 일정이었나요?",
            style: Theme.of(context).textTheme.headline6,
          ),
          spacer,
          selectionBox(items[0], 0),
          selectionBox(items[1], 1),
          selectionBox(items[2], 2),
          selectionBox(items[3], 3),
          selectionBox(items[4], 4),
          selectionBox(items[5], 5),
          spacer,
          Center(
            child: Text(
              '여기에 없어요',
              style: TextStyle(
                  color: getTextColor(selectedItems[6]), fontSize: 20),
            ),
          ),
          TrommButton(
              onPressed: () {
                apiService
                    .postClothesScheduleFeedback(
                        1, items[getIndexOfSelected()], 'LG전자 면접')
                    .then((Response value) => {handleResponse(value)})
                    .catchError((error) => {print("error ===> $error")});
              },
              text: '확인')
        ],
      ),
    );
  }

  selectionBox(String s, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          for (int i = 0; i < selectedItems.length; i++) {
            selectedItems[i] = false;
          }
          selectedItems[index] = !selectedItems[index];
        });
      },
      child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          margin: const EdgeInsets.all(6),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              s,
              textAlign: TextAlign.center,
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: getColor(index),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ])),
    );
  }

  getColor(int index) {
    if (selectedItems[index]) {
      return Colors.blueAccent.withOpacity(0.3);
    } else {
      return Colors.grey.withOpacity(0.1);
    }
  }

  getTextColor(bool selectedItem) {
    if (selectedItem) {
      return Colors.blue;
    } else {
      return Colors.black38;
    }
  }

  handleResponse(Response value) {
    String result = '';
    if (value.statusCode == 200) {
      Navigator.of(context).pop();
      result = '피드백이 성공적으로 전송되었습니다! 👏';
    } else {
      result = "STATUS CODE : ${value.statusCode}\n서버 문제로 인하여 피드백이 전송되지 않았습니다. "
          "빠른 시일내에 서비스가 정상화되도록 노력하겠습니다. 🥲";
    }

    showDialog(
        context: context,
        builder: (context) => simpleDialog(context, '피드백 전송 결과', result, () {}));
  }
}

/**
 *
    showDialog(context: context, builder: (context) =>
    yesOrNoDialog(context, "Title", "content", (){
    // do nothing
    }, () {
    // close
    }));
 * */
