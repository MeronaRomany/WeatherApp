
import 'package:flutter/material.dart';

class WeatherModels{
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherState;


  WeatherModels({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.temp,required this.weatherState,});

factory WeatherModels.fromjson(dynamic data){  // data is return weather api
 var jsonData= data['forecast']['forecastday'][0]['day'];
  return WeatherModels(
      date: data['location']['localtime'],
      maxTemp:jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      temp: jsonData['avgtemp_c'],
      weatherState: jsonData['condition']['text']);
}
 String? getImage(){
  if(weatherState=='Clear' ||weatherState=='Light Cloud' ){
    return'asstes/images/3222800.png';
  }else if(weatherState=='Snow'||weatherState=='Sleet'||weatherState=='Hail'){
    return'asstes/images/14657595-single-weather-icon-cloud-with-snow-and-rain.jpg';
  }else if(weatherState=='Heavy Cloud'){
    return'asstes/images/3982205.png';
  }else if(weatherState=='Light Rain'||weatherState=='Showers'||weatherState=='Heavy Rain'){
    return'asstes/images/14657595-single-weather-icon-cloud-with-snow-and-rain.jpg';
  }else if(weatherState=='Thunderstrom'||weatherState=='Thunder'){
    return'asstes/images/png-transparent-thunderstorm-severe-weather-storm-text-weather-forecasting-meteorology-thumbnail.png';
  }else{
    return 'asstes/images/3222800.png';
  }
 }
@override
  String toString() {
    // TODO: implement toString
    return "temp =$temp,maxTemp=$maxTemp, minTemp=$minTemp";
  }

  MaterialColor getCloros(){
    if(weatherState=='Clear' ||weatherState=='Light Cloud'||weatherState=='Sunny' ){
      return Colors.orange;
    }else if(weatherState=='Snow'||weatherState=='Sleet'||weatherState=='Hail'){
      return Colors.cyan;
    }else if(weatherState=='Heavy Cloud'|| weatherState=='Partly Cloudy'){
      return Colors.grey;
    }else if(weatherState=='Light Rain'||weatherState=='Showers'||weatherState=='Heavy Rain'){
      return Colors.blue;
    }else if(weatherState=='Thunderstrom'||weatherState=='Thunder'){
      return Colors.amber;
    }else{
      return Colors.blueGrey;
    }
  }


 }