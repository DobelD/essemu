import 'package:geolocator/geolocator.dart';

double calculateDistance(double startLatitude, double startLongitude,
    double endLatitude, double endLongitude) {
  double distanceInMeters = Geolocator.distanceBetween(
    startLatitude,
    startLongitude,
    endLatitude,
    endLongitude,
  );

  return distanceInMeters;
}
