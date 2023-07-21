import 'package:flutter/material.dart';
import 'package:test_project_for_study/current_placemark.dart';
import 'package:test_project_for_study/day_heading.dart';
import 'package:test_project_for_study/list_item.dart';
import 'package:test_project_for_study/network_manager.dart';
import 'package:test_project_for_study/weather_data.dart';
import 'package:test_project_for_study/weather_list_item.dart';
import 'package:test_project_for_study/weather.dart';
import 'package:test_project_for_study/heading_list_item.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WeatherForecastPage();
  }
}

class WeatherForecastPage extends StatefulWidget {
  const WeatherForecastPage({super.key});

  @override
  State<WeatherForecastPage> createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  final WeatherData _weatherData = WeatherData();
  final List<ListItem> _weatherForecast = <ListItem>[];
  bool isLoading = false;

  _loadData() {
    isLoading = true;
    CurrentPlacemark currentPlacemark = CurrentPlacemark();
    currentPlacemark.getLocation();
    var locationFuture = currentPlacemark.getPosition();
    locationFuture.then((position) {
      var weatherFuture = getWeather(position.latitude, position.longitude);
      weatherFuture.then((listItem) {
        print('ListItem: $listItem');
        isLoading = false;
      });
    });
  }

  Widget get _pageToDisplay {
    if (isLoading) {
      return _loadingView;
    } else {
      return _contentView:
    }
  }

  @override
  void initState() {
    _loadData();

    var itCurrentDay = DateTime.now();
    _weatherForecast.add(DayHeading(itCurrentDay));
    List<ListItem> weatherData = _weatherData.getData(itCurrentDay);

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
        _weatherForecast.add(DayHeading(itCurrentDay));
      } else {
        _weatherForecast.add(iterator.current);
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
              itemCount: _weatherForecast.length,
              itemBuilder: (BuildContext context, int index) {
                final item = _weatherForecast[index];
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
