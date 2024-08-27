import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/my_home_page.dart';
import 'package:weather_app/screens/search.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context)=>WeatherProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<WeatherProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch:provider.weatherData==null?Colors.orange:provider.weatherData!.getCloros(),

      ),
     routes: {
        "SearchPage":(context)=>SearchPage(),
     },
      home: MyHomePage(),
    );
  }
}

