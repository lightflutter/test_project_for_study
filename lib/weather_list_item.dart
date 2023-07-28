import 'package:flutter/material.dart';
import 'package:test_project_for_study/model/forecast_entity.dart';

class WeatherListItem extends StatelessWidget {
  static const String _weatherIconURL = 'http://openweathermap.org/img/w/';
  final ForecastList forecastList;

  const WeatherListItem(this.forecastList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text((forecastList.dtTxt),
                style: Theme.of(context).textTheme.labelLarge),
          ),
          Image.network(
              '$_weatherIconURL${forecastList.weather.first.icon}.png'),
          Text('${forecastList.main.temp.toInt()}\u00B0C',
              style: Theme.of(context).textTheme.headlineLarge),
        ],
      ),
    );
  }
}
