import 'package:flutter/material.dart';
import 'dart:math' as math;

class LoadingAnimation extends StatefulWidget {
  final double size;
  final Color baseColor;
  final Color highlightColor;

  const LoadingAnimation({
    super.key,
    this.size = 80,
    this.baseColor = const Color(0xFFE3F2FD),
    this.highlightColor = const Color(0xFF1976D2),
  });

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final int numberOfBars = 12;
  final double anglePerBar = 360 / 12;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color getBarColor(int index) {
    final currentStep = (_controller.value * numberOfBars).floor();

    // Calculate the difference in steps and ensure it wraps correctly
    int diff = (index - currentStep);
    if (diff < 0) {
      diff += numberOfBars;
    }

    // Determine opacity based on distance from the highlight (currentStep)
    // The bar immediately behind the current one is slightly dimmer, etc.
    final double opacity = (1.0 - (diff / numberOfBars)).clamp(0.1, 1.0);

    return Color.lerp(widget.baseColor, widget.highlightColor, opacity)!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: List.generate(numberOfBars, (index) {
              return Transform.rotate(
                angle: (index * anglePerBar) * (math.pi / 180),

                // Pivot for rotation is at the top of the Transform widget (which is the center of the Stack).
                alignment: Alignment.topCenter,

                child: Align(
                  alignment: Alignment.topCenter,
                  // FIX: top Padding যোগ করে বারগুলিকে কেন্দ্র থেকে দূরে ঠেলে দেওয়া হলো, ফলে মাঝখানে ফাঁক তৈরি হবে।
                  child: Padding(
                    padding: EdgeInsets.only(top: widget.size * 0.15), // 15% size gap
                    child: Container(
                      width: 6.0,
                      height: widget.size * 0.2, // Bar height
                      decoration: BoxDecoration(
                        color: getBarColor(index),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
