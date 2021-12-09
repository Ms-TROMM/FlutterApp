import 'dart:convert'; // jsonDecode()

import 'package:http/http.dart' as http;
import 'package:ms_tromm/ui/examples/album.dart';

// testing network calls
Future<Album> fetchAlbum() async {
  // Future is a core dart class for working with async operations.
  String url = 'https://jsonplaceholder.typicode.com/albums/1';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

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
  static const getAllUserClothes = "users/clothes/1";

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

  Future<TodayRecommendationData> fetchTodayRecommendation() async {
    final textResponse =
        await http.get(Uri.parse(url + getTodayRecommendationText));
    final listItemResponse =
        await http.get(Uri.parse(url + getTodayRecommendationListItems));

    if (textResponse.statusCode == 200 && listItemResponse.statusCode == 200) {
      // parse json
      TodayRecommendationTextData data = TodayRecommendationTextData.fromJson(jsonDecode(textResponse.body));
      TodayRecommendationListItems items = TodayRecommendationListItems()
    }
  }
}

class TodayRecommendationData {}
class TodayRecommendationTextData {
  int daily = 0;
  int max_temp = 4;
  int min_temp = 0;
  String name = "김엘지";

  TodayRecommendationTextData(
      {required this.daily,
      required this.max_temp,
      required this.min_temp,
      required this.name});

  factory TodayRecommendationTextData.fromJson(Map<String, dynamic> json) {
    return TodayRecommendationTextData(
        daily: json['daily'],
        max_temp: json['max_temp'],
        min_temp: json['min_temp'],
        name: json['name']);
  }

}

class TodayRecommendationListItems {

}
