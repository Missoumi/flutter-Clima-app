import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  Future<void> getLocation() async {
    try {
      Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      this.longitude = position.longitude;
      this.latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}