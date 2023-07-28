import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_project_for_study/model/forecast_entity.dart';

class WeatherListItem extends StatelessWidget {
  static const String _weatherURL = 'http://openweathermap.org/img/w/';
  static final _dateFormatTime = DateFormat('HH:mm');
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
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
                _dateFormatTime.format(
                    DateTime.fromMillisecondsSinceEpoch(forecastList.dt)),
                style: Theme.of(context).textTheme.labelLarge),
          ),
          Image.network('$_weatherURL${forecastList.weather.first.icon}'),
          Text('${forecastList.main.temp.toInt()}\u00B0C',
              style: Theme.of(context).textTheme.headlineLarge),
        ],
      ),
    );
  }
}
