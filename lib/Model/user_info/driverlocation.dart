import 'package:geolocator/geolocator.dart';

class DriverLoc {
  Position? position;
  DriverLoc({this.position});
  getDriverLoc() {
    return position;
  }
}
