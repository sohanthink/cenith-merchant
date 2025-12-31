import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LearnHowToTakeGoodPhotoWidget extends StatefulWidget {
  const LearnHowToTakeGoodPhotoWidget({super.key});

  static const name = 'learn how to take good photo';

  @override
  State<LearnHowToTakeGoodPhotoWidget> createState() =>
      _LearnHowToTakeGoodPhotoWidgetState();
}

class _LearnHowToTakeGoodPhotoWidgetState
    extends State<LearnHowToTakeGoodPhotoWidget> {
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier(0);

  @override
  void dispose() {
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Builder(
          builder: (context) {
            final controller = DefaultTabController.of(context);

            controller.addListener(() {
              if (controller.indexIsChanging) {
                _currentIndexNotifier.value = controller.index;
              }
            });

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30.h),
                    Text(
                      'Avoid Cropped Photos',
                      style: fontSize18(
                        context,
                      )!.copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 5),
                    Text(
                      textAlign: TextAlign.center,
                      'Show where your business is relative to \nits surroundings.',
                      style: fontSize14(context),
                    ),
                    SizedBox(height: 20),

                    SizedBox(
                      height: 380.h,
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          buildPhotoSection(),
                          buildPhotoSection(),
                          buildPhotoSection(),
                          buildPhotoSection(),
                        ],
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: _currentIndexNotifier,
                      builder: (BuildContext context, value, Widget? child) {
                        return Text(
                          '${value + 1} of ${DefaultTabController.of(context).length}',
                        );
                      },
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final controller = DefaultTabController.of(context);

                          if (controller.index < controller.length - 1) {
                            controller.animateTo(controller.index + 1);
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        child: ValueListenableBuilder(
                          valueListenable: _currentIndexNotifier,
                          builder:
                              (
                                BuildContext context,
                                int value,
                                Widget? child,
                              ) {
                                return Text(
                                  value >= controller.length - 1
                                      ? 'Finish'
                                      : 'Next',
                                );
                              },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildPhotoSection() {
    return Column(
      children: [
        buildPhotoCard(color: Colors.greenAccent, iconData: Icons.done),
        buildPhotoCard(color: Colors.red, iconData: Icons.cancel),
      ],
    );
  }

  Widget buildPhotoCard({required Color color, required IconData iconData}) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(12),
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        Positioned(
          right: 0,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: color,
            child: Icon(iconData),
          ),
        ),
      ],
    );
  }
}
