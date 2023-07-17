import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_project_for_study/permission.dart';

class CurrentPlacemark {
  final Permission _permission = Permission();

  Future<Placemark> getLocation() async {
    CurrentPlacemark currentPlacemark = CurrentPlacemark();
    bool hasPermission = await _permission.handleLocationPermission();
    print('$hasPermission');
    if (!hasPermission) {
      print('Hasn\'t permission ${Placemark()}');
      return Placemark();
    } else {
      return await currentPlacemark.get();
    }
  }

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
