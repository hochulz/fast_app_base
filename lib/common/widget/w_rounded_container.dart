import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final double radius;
  final BorderRadiusGeometry? radiusGeometry;

  const RoundedContainer(
      {super.key,
      required this.child,
      this.padding,
      this.margin,
      this.color,
      this.radius = 15,
      this.radiusGeometry});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: radiusGeometry ?? BorderRadius.circular(radius),
      ),
      child: child,

    );
  }
}
