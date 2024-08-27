import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/search.dart';

import '../models/weather_models.dart';
import '../provider/weather_provider.dart';

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<WeatherProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
         AppBar(
          backgroundColor: provider.weatherData==null?Colors.cyan:provider.weatherData!.getCloros(),
          title: Text('Weather',style: TextStyle(

            fontWeight: FontWeight.bold,
          ),),
          actions: [IconButton(onPressed: (){
            Navigator.pushNamed(context,"SearchPage" );
          },
            icon: Icon(Icons.search,color: Colors.black,),
            iconSize: 25,
          )],
        ),

      body:provider.weatherData==null? Center(
        child: Text('''  there is no weather start 
           searhing now''',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),),
      ):Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin:Alignment.topCenter,
              end:Alignment.bottomCenter,
              colors: [
            provider.weatherData!.getCloros(),
            provider.weatherData!.getCloros()[300]!,
            provider.weatherData!.getCloros()[100]!,

          ]

          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Column(children: [
              Text( provider.city!.toString(),style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
              Text('update : ${provider.weatherData!.date.toString()}',style: TextStyle(
                fontSize: 25,
              ),),
            ],),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 2,
                  child:Image.asset(provider.weatherData!.getImage().toString(),
                  width: 50,
                  height: 50,
                ), ),

                Text(provider.weatherData!.temp.toString(),style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                 Column(children: [
                  Text("max : ${provider.weatherData!.maxTemp.toInt()}",style: TextStyle(
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                  ),),
                  Text("min : ${provider.weatherData!.minTemp.toInt()}",style: TextStyle(
                    fontSize: 15,
                  ),),
                ],),
              ],
            ),
            SizedBox(height: 30,),
            Text(provider.weatherData!.weatherState.toString(),style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),

          ],
        ),


      ),

    ) ;
  }
}
