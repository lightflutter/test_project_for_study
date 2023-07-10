import 'package:flutter/material.dart';
import 'package:test_project_for_study/day_heading.dart';
import 'package:test_project_for_study/list_item.dart';
import 'package:test_project_for_study/weather_data.dart';
import 'package:test_project_for_study/weather_list_item.dart';
import 'package:test_project_for_study/weather.dart';
import 'package:test_project_for_study/heading_list_item.dart';
import 'package:test_project_for_study/permission.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

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
  final Permission _permission = Permission();
  final WeatherData _weatherData = WeatherData();
  List<ListItem> weatherForecast = <ListItem>[];

  Future<void> getLocation() async {
    bool isGetPermission = await _permission.handleLocationPermission();
    print('$isGetPermission');

    Position position = await Geolocator.getCurrentPosition(
        forceAndroidLocationManager: false,
        desiredAccuracy: LocationAccuracy.low);
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemark.isNotEmpty) {
      print('GOOD REQUEST ${placemark[0]}');
    } else {
      print('ERRROR: empty PLACAMARK ${placemark[0]}');
    }
  }

  @override
  void initState() {
    getLocation();

    var itCurrentDay = DateTime.now();
    weatherForecast.add(DayHeading(itCurrentDay));
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
