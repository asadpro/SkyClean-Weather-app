import 'dart:convert';
import 'package:http/http.dart' as http;

const api =
    'https://api.openweathermap.org/data/2.5/weather?q=peshawar&appid=3d6d8ca187e1d7e3828c4ba2092b61f9&units=metric';

class NetworkHelper {
  double temp = 0;
  int humid = 0;
  double wind = 0;
  String desc = '';
  String cityName = '';

  Future<void> jsonDecoding() async {
    http.Response jsonResult = await http.get(Uri.parse(api));
    Map<String, dynamic> jsonData = jsonDecode(jsonResult.body);
    temp = jsonData['main']['temp'];
    humid = jsonData['main']['humidity'];
    wind = jsonData['wind']['speed'];
    desc = jsonData['weather']['description'];
    cityName = jsonData['name'];
  }
}
