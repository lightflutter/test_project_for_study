import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'weather_model.dart';

class WeatherListItem extends StatelessWidget {
  static final _dateFormat = DateFormat('yyyy-MM-dd - hh:mm');
  final WeatherModel weather;

  WeatherListItem(this.weather, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(_dateFormat.format(weather.dateTime))),
          Expanded(child: Text('${weather.degree},C')),
          Expanded(child: Text('${weather.clouds}')),
          Expanded(child: Image.network(weather.getIconURL()))
        ],
      ),
    );
  }
}
