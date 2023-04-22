import 'package:flutter/material.dart';
import 'weather_model.dart';

class WeatherListItem extends StatelessWidget {
  //static var _dateFormat = Datefor;
  final WeatherModel weather;
  const WeatherListItem(this.weather, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: const [
          Expanded(child: Text('')),
          Expanded(child: Text('C')),
          Expanded(child: Icon(Icons.abc))
        ],
      ),
    );
  }
}
