import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test_project_for_study/current_placemark.dart';
import 'package:test_project_for_study/model/forecast_entity.dart';
import 'package:test_project_for_study/network_manager.dart';
import 'package:test_project_for_study/weather_list_item.dart';

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
  List<ForecastList> _weatherForecast = <ForecastList>[];
  bool isLoading = false;

  Widget _pageToDisplay() {
    if (isLoading) {
      return _loadingView();
    } else {
      return _contentView();
    }
  }

  Widget _loadingView() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _contentView() {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
          itemCount: _weatherForecast.length,
          itemBuilder: (BuildContext context, int index) {
            final item = _weatherForecast[index];
            return WeatherListItem(item);
          }),
    );
  }

  Future<void> _onRefresh() async {
    Completer<void> completer = Completer();
    _loadData();
    completer.complete(null);
    return completer.future;
  }

  _loadData() {
    isLoading = true;
    CurrentPlacemark currentPlacemark = CurrentPlacemark();
    currentPlacemark.getLocation();
    var locationFuture = currentPlacemark.getPosition();
    locationFuture.then((position) {
      var weatherFuture = getWeather(position.latitude, position.longitude);
      weatherFuture.then((weatherData) {
        print('WEATHEData: $weatherData');
        setState(() {
          _weatherForecast = weatherData.list;
        });
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
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
          body: _pageToDisplay()),
    );
  }
}
