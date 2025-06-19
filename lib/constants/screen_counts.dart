import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenCounts {
  final IconData? icon;
  final String? imagePath;
  final String title;
  final Function(BuildContext context) onPress;

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
    onPress: (context) => context.push("/youtube"),
  ),
  ScreenCounts(
    imagePath: "assets/images/instagram.png",
    title: "Instagram",
    onPress: (context) => context.push("/instagram"),
  ),
  ScreenCounts(
    imagePath: "assets/images/x.png",
    title: "X",
    onPress: (context) => context.push("/x"),
  ),
  ScreenCounts(
    imagePath: "assets/images/facebook.png",
    title: "Facebook",
    onPress: (context) => context.push("/facebook"),
  ),
  ScreenCounts(
    icon: Icons.picture_as_pdf_rounded,
    title: "PDF",
    onPress: (context) => {},
  ),
];
