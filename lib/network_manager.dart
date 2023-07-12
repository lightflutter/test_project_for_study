import 'dart:convert';
import 'package:http/http.dart';
import 'package:test_project_for_study/constants.dart';
import 'package:test_project_for_study/model/forecast_response.dart';

Future<List<ListItem>> getWeather(double lat, double lng) async {
  var queryParameters = {
    'APPID': Constants.WEATHER_APP_ID,
    'units': 'metric',
    'lat': lat.toString(),
    'lng': lng.toString()
  };

  var url = Uri.https(Constants.WEATHER_BASE_URL,
      Constants.WEATHER_FORECAST_URL, queryParameters);
  var response = await get(url);
  if (response.statusCode == 200) {
    var forecastResponse =
    ForecastResponse.fromJson(json.decode(response.body));
    if (forecastResponse.cod == '200') {
      return forecastResponse.list;
    } else {
      print('Error ${forecastResponse.cod}');
    }
  } else {
    print('Error occurred while loading data from server');
  }
  return <ListItem>[];
}


