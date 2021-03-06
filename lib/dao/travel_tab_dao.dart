import 'dart:convert';

import 'package:flutter_trip/model/travel_tab_model.dart';
import 'package:http/http.dart' as http;

const TRAVEL_TAB_URL =
    'https://apk-1256738511.file.myqcloud.com/FlutterTrip/data/travel_page.json';

// 旅拍类别接口
class TravelTabDao {
  static Future<TravelTabModel> fetch() async {
    final response = await http
        .get('http://www.devio.org/io/flutter_app/json/travel_page.json');
    if (response.statusCode != 200) {
      throw Exception('Failed to load travel tab data');
    }
    Utf8Decoder utf8decoder = Utf8Decoder(); // Fix中文乱码
    var result = json.decode(utf8decoder.convert(response.bodyBytes));
    return TravelTabModel.fromJson(result);
  }
}
