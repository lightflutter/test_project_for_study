import 'package:flutter/material.dart';
import 'package:test_project_for_study/weather_list_item.dart';
import 'package:test_project_for_study/weather.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WeatherForecastPage('Moscow');
  }
}

class WeatherForecastPage extends StatefulWidget {
  final String _cityName;

  const WeatherForecastPage(this._cityName, {Key? key}) : super(key: key);

  @override
  State<WeatherForecastPage> createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  List<Weather> weatherForecast = [
    Weather(DateTime.now(), 20, 90, '04d'),
    Weather(DateTime.now().add(const Duration(hours: 3)), 18, 80, '03d'),
    Weather(DateTime.now().add(const Duration(hours: 6)), 15, 50, '02d'),
    Weather(DateTime.now().add(const Duration(hours: 9)), 10, 0, '01d'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView sample',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather forecast'),
        ),
        body: ListView(
            children: weatherForecast
                .map((weather) => WeatherListItem(weather))
                .toList()),
      ),
    );
  }
}
