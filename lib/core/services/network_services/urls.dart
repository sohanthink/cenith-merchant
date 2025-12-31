import 'package:cenith_marchent/core/keys/api_key.dart';

class Urls {
  static getLatLngFromPredictionUrl({
    required String placeId,
    required String apiKey,
  }) {
    String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';
    return url;
  }

  static getLatLngFromPlacesUrl({required String placeName}) {
    final url =
        "https://maps.googleapis.com/maps/api/geocode/json?address=$placeName&key=${ApiKey.googleMapApiKey}";
    return url;
  }
}
