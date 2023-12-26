import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {super.key,
      required this.webScreenlayout,
      required this.mobileScreenlayout});
  final Widget webScreenlayout;
  final Widget mobileScreenlayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          // web screen
          return webScreenlayout;
        }
        // mobile and tab screen
        return mobileScreenlayout;
      },
    );
  }
}
