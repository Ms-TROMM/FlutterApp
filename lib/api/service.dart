import 'dart:convert'; // jsonDecode()

import 'package:http/http.dart' as http;
import 'package:ms_tromm/ui/examples/album.dart';


ApiService apiService = ApiService();

class ApiService {
  static const url = "https://ms-tromm.herokuapp.com/";

  // recommendation endpoints

  // Response
  // {
  //   "daily": 0,
  //   "max_temp": 4,
  //   "min_temp": 0,
  //   "name": "김엘지",
  //   "schedule": [
  //   "회의",
  //   "LG전자 면접",
  //   "서울숲 피크닉",
  //   "롯데월드",
  //   "소프트웨어공학 회의"
  //   ]
  // }
  static const getTodayRecommendationText = "recommand/today/1";

  // {
  //   "down": "청바지",
  //   "scent": "musk",
  //   "top": "패딩"
  // }
  static const getTodayRecommendationListItems = "recommand/today/Seoul/1";

  // {
  //   "course": [
  //   "고급의류 코스",
  //   "섬세건조 코스",
  //   "스팀살균 코스"
  //   ],
  //   "indoor_temp": 22,
  //   "is_inside_styler": "정장",
  //   "texture": "울",
  //   "userid": 1,
  //   "username": "김엘지"
  // }
  static const getControlRecommendationTextAndListItems =
      "recommands/control/1";

  // my closet related endpoints
  // {
  // "clothe_type": "onepiece",
  // "color:": 292929,
  // "created_at": "Thu, 02 Dec 2021 09:11:56 GMT",
  // "id": 1,
  // "is_inside_styler": 1,
  // "name": "정장",
  // "need_styler": 0,
  // "stylered_at": "Thu, 02 Dec 2021 09:11:56 GMT",
  // "sub_type": 3,
  // "texture": "울"
  // },
  static const getAllUserClothes = "users/clothes/";

  // POST Body
  //     {
  //     "category": "string",
  //     "color": 0,
  //     "name": "string",
  //     "subtype": 0,
  //     "texture": "string"
  //     }
  static const postUserClothes = "users/clothes/1";

  // styler tab related endpoint
  // {
  // "dry": 0,
  // "mirror_connection": 0,
  // "ready": 0,
  // "refresh": 0,
  // "reserv": 0, // 예약
  // "styler_connection": 0, // 연결 상태
  // "turn_on": 0 // 전원
  // }
  static const getStylersState = "state/stylers/1";

  // {
  //   "mode": "string"
  // }
  static const patchStylerState = "state/styler/1";

  Future<TodayRecommendationTextData> fetchTodayRecommendText() async {
    final response =
        await http.get(Uri.parse(url + getTodayRecommendationText));

    if (response.statusCode == 200) {
      return TodayRecommendationTextData.fromJson(jsonDecode(response.body));
    } else {
      return TodayRecommendationTextData(
          daily: 0,
          max_temp: 4,
          min_temp: 0,
          name: '김엘지',
          schedule: ["회의", "LG전자 면접", "서울숲 피크닉", "롯데월드", "소프트웨어공학 회의"]);
    }
  }

  Future<TodayRecommendationListItem> fetchTodayRecommendationListItem() async {
    final response =
        await http.get(Uri.parse(url + getTodayRecommendationListItems));
    if (response.statusCode == 200) {
      return TodayRecommendationListItem.fromJson(jsonDecode(response.body));
    } else {
      return TodayRecommendationListItem(down: "청바지", scent: "musk", top: "패딩");
    }
  }

  Future<List<UserClothes>> fetchUserClothes(int userId) async {
    final response =
        await http.get(Uri.parse(url + getAllUserClothes + userId.toString()));
    List<UserClothes> listOfUserClothes = [];
    List<UserClothes> defaultListOfUserClothes = [
      UserClothes(
          id: 1,
          clothe_type: "onepiece",
          color: 292929,
          created_at: "Thu, 02 Dec 2021 09:11:56 GMT",
          stylered_at: "Thu, 02 Dec 2021 09:11:56 GMT",
          name: "상의",
          is_inside_styler: 1,
          need_styler: 1,
          sub_type: 1,
          texture: "면")
    ];

    if (response.statusCode == 200) {
      List<dynamic> list = <dynamic>[];
      list = json.decode(response.body);
      print(list);
      if (list.isNotEmpty) {
        for (int i = 0; i < list.length; i++) {
          if (list[i] != null) {
            Map<String, dynamic> map = list[i];
            listOfUserClothes.add(UserClothes.fromJson(map));
            //print("clothes ${map['created_at']}");
          }
        }
      }
      return Future.value(listOfUserClothes);
    } else {
      return Future.value(defaultListOfUserClothes);
    }
  }

  static const String postClothesSchedule = "clothe/schedule/";

  Future<http.Response> postClothesScheduleFeedback(
      int userId, String clothesName, String schedule) {
    List<Map<String, dynamic>> feedbackList = <Map<String, dynamic>>[];
    feedbackList
        .add(Feedback(clothes: clothesName, schedule: schedule).toJson());

    print("body === $feedbackList");

    return http.post(Uri.parse(url + postClothesSchedule + userId.toString()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(feedbackList));
  }
}

class Feedback {
  String clothes;
  String schedule;

  Feedback({required this.clothes, required this.schedule});

  Map<String, dynamic> toJson() {
    return {
      'clothes': clothes,
      'schedule': schedule,
    };
  }
}

class TodayRecommendationTextData {
  int daily = 0;
  int max_temp = 4;
  int min_temp = 0;
  String name = "김엘지";
  List<String> schedule = ["회의", "LG전자 면접", "서울숲 피크닉", "롯데월드", "소프트웨어공학 회의"];

  TodayRecommendationTextData(
      {required this.daily,
      required this.max_temp,
      required this.min_temp,
      required this.name,
      required this.schedule});

  factory TodayRecommendationTextData.fromJson(Map<String, dynamic> json) {
    return TodayRecommendationTextData(
        daily: json['daily'],
        max_temp: json['max_temp'],
        min_temp: json['min_temp'],
        name: json['name'],
        schedule: json['schedule']);
  }

  @override
  String toString() {
    return 'TodayRecommendationTextData{daily: $daily, max_temp: $max_temp, min_temp: $min_temp, name: $name, schedule: $schedule}';
  }
}

class TodayRecommendationListItem {
  String down;
  String scent;
  String top;

  TodayRecommendationListItem(
      {required this.down, required this.scent, required this.top});

  factory TodayRecommendationListItem.fromJson(Map<String, dynamic> json) {
    return TodayRecommendationListItem(
        down: json['down'], scent: json['scent'], top: json['top']);
  }

  @override
  String toString() {
    return 'TodayRecommendationListItem{down: $down, scent: $scent, top: $top}';
  }
}

class UserClothes {
  int id = 1;
  String clothe_type = "onepiece";
  int color = 292929;
  String created_at = "Thu, 02 Dec 2021 09:11:56 GMT";
  String stylered_at = "Thu, 02 Dec 2021 09:11:56 GMT";
  String name = "정장";
  int is_inside_styler = 1;
  int need_styler = 0;
  int sub_type = 3;
  String texture = "울";

  UserClothes(
      {required this.id,
      required this.clothe_type,
      required this.color,
      required this.created_at,
      required this.stylered_at,
      required this.name,
      required this.is_inside_styler,
      required this.need_styler,
      required this.sub_type,
      required this.texture});

  factory UserClothes.fromJson(Map<String?, dynamic> json) {
    return UserClothes(
        id: json['id'],
        clothe_type: json['clothe_type'],
        color: json['color:'],
        created_at: json['created_at'],
        stylered_at: json['stylered_at'],
        name: json['name'],
        is_inside_styler: json['is_inside_styler'],
        need_styler: json['need_styler'],
        sub_type: json['sub_type'],
        texture: json['texture']);
  }

  @override
  String toString() {
    return 'UserClothes{id: $id, clothe_type: $clothe_type, color: $color, '
        'created_at: $created_at, stylered_at: $stylered_at, name: $name, '
        'is_inside_styler: $is_inside_styler, need_styler: $need_styler, '
        'sub_type: $sub_type, texture: $texture}';
  }
}

class TodayRecommendationListItems {}
