import 'package:cenith_marchent/core/keys/api_key.dart';
import 'package:cenith_marchent/core/services/locatin_service/location_services.dart';
import 'package:cenith_marchent/features/auth/view_model/location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';
import '../../../core/constants/app_colors.dart';

class SearchAndPickLocation extends StatefulWidget {
  const SearchAndPickLocation({super.key});

  static final String name = 'search and pick location';

  @override
  State<SearchAndPickLocation> createState() => _SearchAndPickLocationState();
}

class _SearchAndPickLocationState extends State<SearchAndPickLocation> {
  GoogleMapController? _mapController;

  final TextEditingController searchSuggestionTETionController =
      TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus &&
          Get.find<LocationViewModel>().isShowDeopDown == false) {
        Get.find<LocationViewModel>().updateViewDorpDownStatus(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // Android icons white
        statusBarBrightness: Brightness.dark, // iOS support
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GetBuilder<LocationViewModel>(
              builder: (stateController) {
                return GoogleMap(
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height - 250,
                    right: 8,
                  ),
                  onMapCreated: (controller) {
                    _mapController = controller;
                  },
                  markers: Get.find<LocationViewModel>().markers,

                  onTap: (location) {
                    stateController.addMarker(location);
                    stateController.updateName(location);
                  },
                  initialCameraPosition: CameraPosition(
                    zoom: 14,
                    target: stateController.target,
                  ),
                );
              },
            ),
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: GooglePlaceAutoCompleteTextField(
                focusNode: _focusNode,
                boxDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.themeColor.withAlpha(100),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                radius: 30,
                textInputAction: TextInputAction.search,
                debounceTime: 800,
                isLatLngRequired: true,
                formSubmitCallback: () async {
                  FocusScope.of(context).unfocus();

                  if (searchSuggestionTETionController.text.trim().isEmpty) {
                    return;
                  }

                  LatLng latLng = await LocationServices.placeNameToLatLng(
                    placeName: searchSuggestionTETionController.text,
                    onFailed: (e) {
                      onFailed(e);
                    },
                  );

                  await Get.find<LocationViewModel>()
                      .updateCurrentLocationAndCameraPosition(
                        _mapController!,
                        latLng,
                      );

                  Get.find<LocationViewModel>().updateName(latLng);
                  Get.find<LocationViewModel>().updateViewDorpDownStatus(false);
                },
                itemClick: (Prediction prediction) async {
                  // print(
                  //   "${prediction.lat}, lng: ${prediction.lng}, plceId ${prediction.placeId}",
                  // );
                  FocusScope.of(context).unfocus();

                  final latLng = await LocationServices.predictionToLatLng(
                    placeId: prediction.placeId ?? '',
                    onFailed: onFailed,
                  );

                  await Get.find<LocationViewModel>()
                      .updateCurrentLocationAndCameraPosition(
                        _mapController!,
                        latLng,
                      );

                  searchSuggestionTETionController.text =
                      prediction.description ?? '';
                  searchSuggestionTETionController.selection =
                      TextSelection.fromPosition(
                        TextPosition(
                          offset: prediction.description != null
                              ? prediction.description!.length
                              : 0,
                        ),
                      );

                  Get.find<LocationViewModel>().updateName(latLng);
                },
                isCrossBtnShown: false,
                placeType: PlaceType.geocode,
                itemBuilder: (context, index, Prediction prediction) {
                  return GetBuilder<LocationViewModel>(
                    builder: (controller) {
                      return !controller.isShowDeopDown
                          ? Container()
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(width: 7),
                                  Expanded(
                                    child: Text(prediction.description ?? ""),
                                  ),
                                ],
                              ),
                            );
                    },
                  );
                },
                getPlaceDetailWithLatLng: (Prediction prediction) {
                  // debugPrint('place Details ${prediction.lng}');
                },
                inputDecoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  prefixIcon: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.themeColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      if (searchSuggestionTETionController.text
                          .trim()
                          .isEmpty) {
                        return;
                      }

                      LatLng latLng = await LocationServices.placeNameToLatLng(
                        placeName: searchSuggestionTETionController.text,
                        onFailed: (e) {
                          onFailed(e);
                        },
                      );

                      await Get.find<LocationViewModel>()
                          .updateCurrentLocationAndCameraPosition(
                            _mapController!,
                            latLng,
                          );
                      Get.find<LocationViewModel>().updateName(latLng);

                      Get.find<LocationViewModel>().updateViewDorpDownStatus(
                        false,
                      );
                    },
                    icon: Icon(
                      Icons.search,
                      color: AppColors.themeColor,
                      size: 30,
                    ),
                  ),
                ),
                textEditingController: searchSuggestionTETionController,
                googleAPIKey: ApiKey.googleMapApiKey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  onFailed(e) {
    Get.showSnackbar(
      GetSnackBar(
        title: 'Location not found',
        message: 'Try with different location',
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
