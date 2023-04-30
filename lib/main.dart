import 'package:flutter/material.dart';
import 'package:test_project_for_study/day_heading.dart';
import 'package:test_project_for_study/list_item.dart';
import 'package:test_project_for_study/weather_list_item.dart';
import 'package:test_project_for_study/weather.dart';
import 'package:test_project_for_study/heading_list_item.dart';

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
  List<ListItem> weatherForecast = <ListItem>[];

  @override
  void initState() {
    var itCurrentDay = DateTime.now();
    weatherForecast.add(DayHeading(itCurrentDay));
    List<ListItem> weatherData = [
      Weather(itCurrentDay, 20, 90, '04d'),
      Weather(itCurrentDay.add(const Duration(hours: 3)), 18, 0, '04d'),
      Weather(itCurrentDay.add(const Duration(hours: 6)), 10, 80, '03d'),
      Weather(itCurrentDay.add(const Duration(hours: 9)), 9, 20, '01d'),
      Weather(itCurrentDay.add(const Duration(hours: 12)), 11, 40, '01d'),
      Weather(itCurrentDay.add(const Duration(hours: 15)), 12, 30, '03d'),
      Weather(itCurrentDay.add(const Duration(hours: 18)), 14, 40, '02d'),
      Weather(itCurrentDay.add(const Duration(hours: 21)), 16, 20, '01d'),
      Weather(itCurrentDay.add(const Duration(hours: 24)), 15, 50, '04d'),
      Weather(itCurrentDay.add(const Duration(hours: 27)), 17, 60, '04d'),
      Weather(itCurrentDay.add(const Duration(hours: 30)), 12, 70, '03d'),
      Weather(itCurrentDay.add(const Duration(hours: 33)), 8, 80, '04d'),
      Weather(itCurrentDay.add(const Duration(hours: 36)), 6, 90, '03d'),
      Weather(itCurrentDay.add(const Duration(hours: 39)), 8, 90, '04d'),
      Weather(itCurrentDay.add(const Duration(hours: 42)), 10, 80, '01d'),
      Weather(itCurrentDay.add(const Duration(hours: 45)), 13, 70, '04d'),
      Weather(itCurrentDay.add(const Duration(hours: 48)), 16, 60, '02d'),
      Weather(itCurrentDay.add(const Duration(hours: 51)), 17, 50, '03d'),
      Weather(itCurrentDay.add(const Duration(hours: 54)), 17, 40, '04d'),
      Weather(itCurrentDay.add(const Duration(hours: 57)), 15, 30, '02d'),
      Weather(itCurrentDay.add(const Duration(hours: 60)), 11, 20, '04d'),
      Weather(itCurrentDay.add(const Duration(hours: 63)), 9, 10, '01d'),
    ];

    var itNextDay = DateTime.now().add(const Duration(days: 1));
    itNextDay =
        DateTime(itNextDay.year, itNextDay.month, itNextDay.day, 0, 0, 0, 0, 1);
    var iterator = weatherData.iterator;
    while (iterator.moveNext()) {
      var weatherDateTime = iterator.current as Weather;
      if (weatherDateTime.dateTime.isAfter(itNextDay)) {
        itCurrentDay = itNextDay;
        itNextDay = itCurrentDay.add(const Duration(days: 1));
        itNextDay = DateTime(
            itNextDay.year, itNextDay.month, itNextDay.day, 0, 0, 0, 0);
        weatherForecast.add(DayHeading(itCurrentDay));
      } else {
        weatherForecast.add(iterator.current);
      }
    }
    super.initState();
  }

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
          body: ListView.builder(
              itemCount: weatherForecast.length,
              itemBuilder: (BuildContext context, int index) {
                final item = weatherForecast[index];
                if (item is Weather) {
                  return WeatherListItem(item);
                } else if (item is DayHeading) {
                  return HeadingListItem(item);
                } else {
                  throw Exception('wrong type');
                }
              })),
    );
  }
}
