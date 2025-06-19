import 'package:flutter/material.dart';

class ScreenCounts {
  final IconData? icon;
  final String? imagePath;
  final String title;
  final Function onPress;

  const ScreenCounts({
    this.icon,
    required this.title,
    this.imagePath,
    required this.onPress,
  });
}

final List<ScreenCounts> screens = [
  ScreenCounts(
    imagePath: "assets/images/youtube.png",
    title: "Youtube",
    onPress: () => {},
  ),
  ScreenCounts(
    imagePath: "assets/images/instagram.png",
    title: "Instagram",
    onPress: () => {},
  ),
  ScreenCounts(imagePath: "assets/images/x.png", title: "X", onPress: () => {}),
  ScreenCounts(
    imagePath: "assets/images/facebook.png",
    title: "Facebook",
    onPress: () => {},
  ),
  ScreenCounts(
    icon: Icons.picture_as_pdf_rounded,
    title: "PDF",
    onPress: () => {},
  ),
];
