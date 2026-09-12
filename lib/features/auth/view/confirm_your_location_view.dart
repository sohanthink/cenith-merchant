import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/auth/view/Search_and_pick_location.dart';
import 'package:cenith_marchent/features/auth/view_model/location_view_model.dart';
import 'package:cenith_marchent/features/auth/view_model/registration_view_model.dart';
import 'package:cenith_marchent/features/auth/widgets/tooltip_portal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/confirm_your_location_model.dart';

class ConfirmYourLocationView extends StatefulWidget {
  const ConfirmYourLocationView({super.key, required this.onValidChanged});

  static const name = 'confirm your location view';

  final Function(bool isValid) onValidChanged;

  @override
  State<ConfirmYourLocationView> createState() =>
      ConfirmYourLocationViewState();
}

class ConfirmYourLocationViewState extends State<ConfirmYourLocationView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Position? position;

  void checkFormValidity() {
    final isValid = _formKey.currentState?.validate() ?? false;
    widget.onValidChanged(isValid);
  }

  GoogleMapController? _mapController;

  final TextEditingController additionalTEController = TextEditingController();

  setLanMark() {
    Get.find<LocationViewModel>().update();
  }

  animateCameraIfCurrentPositionNotNull() {
    Position? currentLocation = Get.find<LocationViewModel>().currentLocation;
    if (Get.find<LocationViewModel>().currentLocation != null &&
        _mapController != null) {
      position = currentLocation;

      _mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              currentLocation!.latitude,
              currentLocation.longitude,
            ),
            zoom: 8,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      setLanMark();
      FocusScope.of(context).unfocus();
      if (position == null) {
        animateCameraIfCurrentPositionNotNull();
      }
    });
  }

  Future<void> getDataFromCache() async {
    Map<String, dynamic> data = await Get.find<RegistrationViewModel>()
        .getDataFromCache();

    ConfirmYourLocationModel processedData = ConfirmYourLocationModel.fromJson(
      data,
    );

    additionalTEController.text = processedData.additionalInfo;
    position = processedData.position;
    Get.find<LocationViewModel>().updateLandMark(processedData.streetAddress);
  }

  @override
  Widget build(BuildContext context) {
    final style = fontSize16(context)!.copyWith(color: Colors.black);
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(16.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 7)],
              ),
              child: Column(
                children: [
                  GetBuilder<LocationViewModel>(
                    id: 'landmark',
                    builder: (controller) {
                      return TextFormField(
                        textInputAction: TextInputAction.go,
                        style: style,
                        controller: controller.landMarkTEController,
                        decoration: InputDecoration(hintText: 'Land mark'),
                        validator: (v) =>
                            v == null || v.isEmpty ? 'Required' : null,
                        onChanged: (v) {
                          checkFormValidity();
                        },
                        onFieldSubmitted: (value) {
                          onTextFieldChange(value);
                        },
                        onEditingComplete: () {
                          FocusScope.of(context).unfocus();
                        },
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    controller: additionalTEController,
                    style: style,
                    maxLines: 3,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(bottom: 48.h),
                        child: ToolTipPortal(
                          context: context,
                          toolTipTitle:
                              'Provide clear directions so customers can find your location without difficulty. (not mandatory) SKIP Option',
                        ),
                      ),
                      hintText: 'Additional information...',
                      hintStyle: fontSize14(
                        context,
                      )!.copyWith(color: Colors.grey.shade400),
                    ),
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Required' : null,
                    onChanged: (v) => checkFormValidity(),
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).unfocus();
                    },
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    width: double.infinity,
                    height: 150.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(24),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(20),
                          child: GetBuilder<LocationViewModel>(
                            builder: (controller) {
                              return GoogleMap(
                                onMapCreated: (controller) {
                                  _mapController = controller;
                                  if (position != null) {
                                    Get.find<LocationViewModel>().getLocation(
                                      _mapController,
                                    );
                                  }
                                },
                                markers: controller.markers,

                                onTap: (location) {
                                  controller.addMarker(location);
                                },
                                initialCameraPosition: CameraPosition(
                                  zoom: 8,
                                  target: controller.target,
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 10,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                SearchAndPickLocation.name,
                              );
                            },
                            child: Icon(
                              Icons.fullscreen,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  Future onTextFieldChange(String? value) async {
    try {
      if (value != null && _mapController != null) {
        await Get.find<LocationViewModel>().onLandMarkChange(
          value,
          _mapController!,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}
