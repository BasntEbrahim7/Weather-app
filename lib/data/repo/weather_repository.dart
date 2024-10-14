import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/waether_data.dart';

class WeatherRepository {
  static const String apiKey = '898ab5ccf03515ce33c58627d507bd8b'; // Replace with your OpenWeatherMap API key

  Future<WeatherModel> getWeather(String city) async {
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
