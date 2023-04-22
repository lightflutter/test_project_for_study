class WeatherModel {
  static const String weatherURL = '';

  DateTime dateTime;
  num degree;
  int clouds;
  String iconURL;

  WeatherModel(this.dateTime, this.degree, this.clouds, this.iconURL);

  String getIconURL() {
    return '$weatherURL$iconURL.png';
  }

}