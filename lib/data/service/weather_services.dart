// import 'package:http/http.dart' as http;
// import 'dart:io';
//
// class WeatherServices {
//   final Uri url =
//   Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=cairo&appid=898ab5ccf03515ce33c58627d507bd8b");
//
//   Future<http.Response> fetchWeather() async {
//     var client = http.Client();
//     try {
//       var response = await client.get(url);
//
//       // Check for a successful response
//       if (response.statusCode == 200) {
//         return response;
//       } else {
//         // Return an error response with the status code
//         return http.Response('Failed to load weather data', response.statusCode);
//       }
//     } on SocketException {
//       // Handle network errors
//       return http.Response('Network Error', 500);
//     } catch (e) {
//       // Handle any other type of exception
//       return http.Response('Error: $e', 500);
//     } finally {
//       // Close the client after the request is complete
//       client.close();
//     }
//   }
// }

import 'package:dio/dio.dart';

class DioHelper {

    static late Dio dio;

  static init(){
    dio=Dio(
        BaseOptions(
          baseUrl: 'https://raw.githubusercontent.com/Biuni/',
          receiveDataWhenStatusError: true,
        )
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String,dynamic> query,
  })
  async => await dio.get('PokemonGO-Pokedex/master/pokedex.json',queryParameters:query );



}

