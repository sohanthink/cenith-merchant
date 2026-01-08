import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/auth/view/Search_and_pick_location.dart';
import 'package:cenith_marchent/features/auth/view_model/location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ConfirmYourLocationView extends StatefulWidget {
  const ConfirmYourLocationView({super.key, required this.onValidChanged});

  static const name = 'confirm your location view';

  final Function(bool isValid) onValidChanged;

  @override
  State<ConfirmYourLocationView> createState() =>
      _ConfirmYourLocationViewState();
}

class _ConfirmYourLocationViewState extends State<ConfirmYourLocationView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _checkFormValidity() {
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
    });
    animateCameraIfCurrentPositionNotNull();

  }

  @override
  Widget build(BuildContext context) {
    final style = fontSize16(context)!.copyWith(color: Colors.black);
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24.h),
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
                  // GetBuilder<LocationViewModel>(
                  //   id: 'landmark',
                  //   builder: (controller) {
                  //     updateTextFieldWithMarker(controller);
                  //     return TextFormField(
                  //       enabled: true,
                  //       style: style,
                  //       controller: landMarkTEController,
                  //       decoration: InputDecoration(
                  //         hintText: 'Land mark',
                  //         hintStyle: fontSize14(
                  //           context,
                  //         )!.copyWith(color: Colors.grey.shade400),
                  //         contentPadding: EdgeInsets.symmetric(
                  //           horizontal: 16.w,
                  //         ),
                  //       ),
                  //       validator: (v) =>
                  //           v == null || v.isEmpty ? 'Required' : null,
                  //       onChanged: (v) {
                  //         _checkFormValidity();
                  //         onTextFieldChange(v);
                  //       },
                  //     );
                  //   },
                  // ),
                  GetBuilder<LocationViewModel>(
                    id: 'landmark',
                    builder: (controller) {
                      return TextFormField(
                        textInputAction: TextInputAction.go,
                        style: style,
                        // ViewModel থেকে কন্ট্রোলারটি ব্যবহার করুন
                        controller: controller.landMarkTEController,
                        decoration: InputDecoration(
                          hintText: 'Land mark',
                          // ...
                        ),
                        validator: (v) =>
                            v == null || v.isEmpty ? 'Required' : null,
                        onChanged: (v) {
                          _checkFormValidity();
                          // টাইপ করার সময় ম্যাপ আপডেট করার দরকার নেই,
                          // এতে ইউজার শান্তিতে টাইপ করতে পারবে।
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
                      hintText: 'Additional information...',
                      hintStyle: fontSize14(
                        context,
                      )!.copyWith(color: Colors.grey.shade400),
                    ),
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Required' : null,
                    onChanged: (v) => _checkFormValidity(),
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
                                  Get.find<LocationViewModel>().getLocation(
                                    _mapController,
                                  );
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

}
