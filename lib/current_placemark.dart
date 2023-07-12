import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class CurrentPlacemark {
  Future<Placemark> get() async {
    Position position = await getPosition();
    List<Placemark> placemark =
    await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemark.isNotEmpty) {
      print('GOOD REQUEST ${placemark[0]}');
      return placemark[0];
    } else {
      print('ERRROR: empty PLACAMARK');
      return Placemark();
    }
  }

  Future<Position> getPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print('Positon is: $position');
    return position;
  }
}
