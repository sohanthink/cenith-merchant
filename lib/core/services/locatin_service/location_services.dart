import 'dart:ui';
import 'package:cenith_marchent/core/keys/api_key.dart';
import 'package:cenith_marchent/core/services/network_services/urls.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';

class LocationServices {
  static final logger = Logger();

  static Future getCurrentPosition({
    required VoidCallback onPermissionDenied,
    required Function(Object error) onFailed,
  }) async {
    try {
      bool serviceEnabled;
      LocationPermission permission;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        logger.i("is enabled: $serviceEnabled");
        onPermissionDenied();
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        logger.i("checked permission: $permission");
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          logger.i("permission status: $serviceEnabled");
          return Future.error('Location permissions are denied');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        logger.i("is enabled: $serviceEnabled");
        onPermissionDenied();
      }

      Position position = await Geolocator.getCurrentPosition();

      logger.i("is enabled: $position");

      return position;
    } catch (e) {
      onFailed(e);
      logger.i("Error: $e");
      return null;
    }
  }

  static Future<Placemark?> locationName(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );
      if (placemarks.isNotEmpty) {
        return placemarks.first;
      } else {
        print("No placemarks found");
        return null;
      }
    } catch (e) {
      print("Error in reverse geocoding: $e");
      return null;
    }
  }

  static Future<ScreenCoordinate> placeMarkToCoordinate(
    Placemark placemark,
  ) async {
    ScreenCoordinate coordinate = await placeMarkToCoordinate(placemark);

    return coordinate;
  }

  static Future predictionToLatLng({
    required String placeId,
    required Function onFailed,
  }) async {
    try {
      final dio = Dio();
      String url = Urls.getLatLngFromPredictionUrl(
        placeId: placeId,
        apiKey: ApiKey.googleMapApiKey,
      );
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        final location = response.data['result']['geometry']['location'];

        LatLng latLng = LatLng(location['lat'], location['lng']);

        print(latLng);

        return latLng;
      }
    } catch (e) {
      onFailed(e);
    }
  }

  static Future placeNameToLatLng({
    required String placeName,
    required Function onFailed
  }) async {
    try {
      final dio = Dio();

      String url = Urls.getLatLngFromPlacesUrl(placeName: placeName);

      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        final loc = response.data["results"][0]["geometry"]["location"];
        return LatLng(loc["lat"], loc["lng"]);
      }
    } catch (e) {
     onFailed(e.toString());
    }

  }
}
