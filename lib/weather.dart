class Weather {
  static const String weatherURL = 'http://openweathermap.org/img/w/';

  DateTime dateTime;
  num degree;
  int clouds;
  String iconURL;

  Weather(this.dateTime, this.degree, this.clouds, this.iconURL);

  String getIconURL() {
    return '$weatherURL$iconURL.png';
  }
}
