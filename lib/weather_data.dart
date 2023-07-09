import 'package:test_project_for_study/weather.dart';
import 'package:test_project_for_study/list_item.dart';

class WeatherData {
  List<ListItem> getData(DateTime itCurrentDay) {
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
    return weatherData;
  }

}