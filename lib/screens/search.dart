import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/weather_models.dart';
import '../provider/weather_provider.dart';
import '../services/weather_service.dart';


class SearchPage extends StatelessWidget {

 late final String cityName;
  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<WeatherProvider>(context);
    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Search a city',style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),

      ),
      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('asstes/images/undraw_Weather_re_qsmd.png'),
            SizedBox(height: 50,),
            Center(
              child: TextField(
                onSubmitted: (data) async{
                  cityName=data;
                  WeatherService service = WeatherService();
                  WeatherModels? weather =await service.getWeather(cityName: cityName);
                  provider.weatherData=weather;

                  provider.city=cityName;
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  labelText:"Enter city name ",
                 labelStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,
                 border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
