import 'package:geolocator/geolocator.dart';
class Permission {
  check() async{
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    print('$permission');
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      throw Exception('Error');
    }
  }

}
