import 'package:hello_flutter/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HttpHelper {
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'e896916ec80ffbb53afbb94f6b2eff14';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appid': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response response = await http.get(uri);

    Map<String, dynamic> data = convert.json.decode(response.body);
    return Weather.fromJson(data);
  }
}
