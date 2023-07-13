import 'dart:convert';
import 'package:http/http.dart';
import 'package:test_project_for_study/constants.dart';
import 'package:test_project_for_study/list_item.dart';
import 'package:test_project_for_study/model/forecast_entity.dart';

Future<List<ListItem>> getWeather(double lat, double lon) async {
  var queryParameters = {
    'lat': lat.toString(),
    'lon': lon.toString(),
    'APPID': Constants.WEATHER_APP_ID,
    'units': 'metric'
  };

  var url = Uri.https(Constants.WEATHER_BASE_URL,
      Constants.WEATHER_FORECAST_URL, queryParameters);
  var response = await get(url);
  if (response.statusCode == 200) {
    var forecastEntity =
    ForecastEntity.fromJson(json.decode(response.body));
    if (forecastEntity.cod == '200') {
      return forecastEntity.list;
    } else {
      print('Error ${forecastEntity.cod}');
    }
  } else {
    print('Error occurred while loading data from server');
  }
  return <ListItem>[];
}


