import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_project_for_study/weather.dart';

class WeatherListItem extends StatelessWidget {
  static final _dateFormat = DateFormat('yyyy-MM-dd - hh:mm');
  final Weather weather;

  const WeatherListItem(this.weather, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(_dateFormat.format(weather.dateTime))),
          Expanded(flex: 1, child: Text('${weather.degree} C')),
          Expanded(flex: 1, child: Text('${weather.clouds}')),
          Expanded(flex: 1, child: Image.network(weather.getIconURL()))
        ],
      ),
    );
  }
}
