import 'package:cenith_marchent/core/constants/asstes_path/image_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/services/locatin_service/location_services.dart';

class LocationViewModel extends GetxController {
  bool isShowDeopDown = true;

  Set<Marker> markers = {
    Marker(position: LatLng(22.886861, 89.941040), markerId: MarkerId('value')),
  };

  String name = '';

  LatLng target = LatLng(37.4219983, -122.084);
  GoogleMapController? primaryMapController;

  Position? currentLocation;

  addMarker(LatLng latLng) async {
    markers.clear();
    markers.add(
      Marker(
        markerId: MarkerId(latLng.longitude.toString()),
        position: latLng,
        icon: await BitmapDescriptor.asset(
          ImageConfiguration(size: Size(50, 50)),
          ImagePaths.hueImage,
        ),
      ),
    );
    update();
    updateName(LatLng(latLng.latitude, latLng.longitude));
  }

  _showSnackBar({required String title, required String message}) {
    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: message,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void updateViewDorpDownStatus(bool status) {
    isShowDeopDown = status;
    update();
  }

  Future getLocation(GoogleMapController? mapController) async {
    Position? presentLocation = await LocationServices.getCurrentPosition(
      onPermissionDenied: () {
        _showSnackBar(
          title: 'Warning',
          message: 'To get better experifsdence enable location service',
        );
      },
      onFailed: (error) {
        _showSnackBar(title: 'Warning', message: error.toString());
      },
    );
    if (presentLocation != null && mapController != null) {
      currentLocation = presentLocation;
      Placemark? placemark = await LocationServices.locationName(
        LatLng(currentLocation!.latitude, currentLocation!.longitude),
      );

      updateName(LatLng(currentLocation!.latitude, currentLocation!.longitude));

      // print("Success: $presentLocation");
      primaryMapController = mapController;
      animateCamera(
        mapController,
        LatLng(currentLocation!.latitude, currentLocation!.longitude),
      );

      addMarker(LatLng(currentLocation!.latitude, currentLocation!.longitude));
      target = LatLng(presentLocation.latitude, presentLocation.longitude);
      update();
    } else {
      print("Failed Location: $presentLocation");
    }
  }

  animateCamera(GoogleMapController controller, LatLng latLng) {
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(currentLocation!.latitude, currentLocation!.longitude),
          zoom: 8,
        ),
      ),
    );
  }

  updateCurrentLocationAndCameraPosition(
    GoogleMapController controller,
    LatLng latLng,
  ) {
    currentLocation = Position(
      latitude: latLng.latitude,
      longitude: latLng.longitude,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0,
      altitudeAccuracy: 0,
      headingAccuracy: 0,
    );
    target = latLng;
    addMarker(latLng);
    animateCamera(controller, latLng);
    animateCamera(primaryMapController!, latLng);
    updateName(latLng);
    update();
  }

  updateName(LatLng latLng) async {
    try {
      Placemark? placemark = await LocationServices.locationName(latLng);
      if (placemark != null) {
        name = '${placemark.name}, ${placemark.street}, ${placemark.country}';
        update(['landmark']);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
