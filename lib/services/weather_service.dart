import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_models.dart';

class WeatherService{

   Future<WeatherModels?> getWeather({required String cityName})async{
     WeatherModels? weather;
    try{
      String baseURL="http://api.weatherapi.com/v1";
      String apiKey="ff0f7bec19854be5917120010241608";
      Uri url=Uri.parse(
          "$baseURL/forecast.json?key=$apiKey&q=$cityName&days=7");
      http.Response response= await http.get(url);
      Map<String,dynamic>  data =jsonDecode(response.body);

      weather=WeatherModels.fromjson(data);
    }catch(e){
      print("Exception");
    }
     return weather;
  }

}