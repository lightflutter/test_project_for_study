import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_project_for_study/permission.dart';

class CurrentPlacemark {
  final Permission _permission = Permission();

  Future<void> _loadLocationWithPermission() async {
    CurrentPlacemark currentPlacemark = CurrentPlacemark();
    bool hasPermission = await _permission.handleLocationPermission();
    if (!hasPermission) {
      Future.error(Exception('Not have permission'));
    } else {
      await currentPlacemark._getPlacemark();
    }
  }

  Future<Placemark> _getPlacemark() async {
    Position position = await _getPosition();
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemark.isNotEmpty) {
      return placemark[0];
    } else {
      return Future.error(Exception('Not have placemark'));
    }
  }

  Future<Position> _getPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    return position;
  }

  Future<Position> getPosition() async {
    _loadLocationWithPermission();
    return _getPosition();
  }
}
