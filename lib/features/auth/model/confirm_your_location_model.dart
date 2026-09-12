import 'package:geolocator/geolocator.dart';

class ConfirmYourLocationModel {
  final String streetAddress;
  final String additionalInfo;
  // final LatLng latLng;
  final Position? position;

  ConfirmYourLocationModel({
    required this.streetAddress,
    required this.additionalInfo,
    // required this.latLng,
    required this.position
  });

  factory ConfirmYourLocationModel.fromJson(Map<String, dynamic> json) {
    return ConfirmYourLocationModel(
      streetAddress: json['street_address'],
      additionalInfo: json['additionalLocationInfo'] ?? '',
      // latLng: LatLng.fromJson(json['latLng']),
      position: json['position']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street_address': streetAddress,
      'additionalLocationInfo': additionalInfo,
      // 'latLng': latLng.toJson(),
      'position':position
    };
  }
}

// class LatLng {
//   final double latitude;
//   final double longitude;
//
//   LatLng({required this.latitude, required this.longitude});
//
//   factory LatLng.fromJson(Map<String, dynamic> json) {
//     return LatLng(
//       latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
//       longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {'latitude': latitude, 'longitude': longitude};
//   }
// }
