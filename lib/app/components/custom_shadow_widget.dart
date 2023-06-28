import 'package:flutter/material.dart';

class CustomShadowWidget extends StatelessWidget {
  const CustomShadowWidget({
    super.key,
    this.height,
    this.width,
    this.gradient,
  });

  final double? height;
  final double? width;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: gradient,
      ),
    );
  }
}
