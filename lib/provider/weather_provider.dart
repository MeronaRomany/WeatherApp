
import 'package:flutter/foundation.dart';

import '../models/weather_models.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModels? _weatherData;
  String? city;
  set weatherData(WeatherModels? weather){
    _weatherData=weather;
    notifyListeners();
  }
  WeatherModels? get weatherData=>_weatherData;

}