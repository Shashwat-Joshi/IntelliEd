import 'package:flutter/material.dart';

// For Sliver app bar
class AppBar {
  final String name, techSummary, imagePath;
  AppBar({
    @required this.name,
    @required this.techSummary,
    @required this.imagePath,
  });
}

AppBar testAppBar = AppBar(
    name: 'Shashwat',
    techSummary:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean donec sagittis, eget ac aliquet. Eros gravida mauris sit enim',
    imagePath: 'assets/student/images/appBar-bg.png');

// For announcement section
Map<String, String> announcementText = {
  '0':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Augue a ut nisl blandit sagittis nunc porttitor.',
  '1':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Augue a ut nisl blandit sagittis nunc porttitor.',
  '2':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Augue a ut nisl blandit sagittis nunc porttitor.',
  '3':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Augue a ut nisl blandit sagittis nunc porttitor.',
};

// For Analytics features
class AnalyticsFeatures {
  final String heading, subHeading;
  final Color color, textColor;

  AnalyticsFeatures({
    @required this.heading,
    @required this.subHeading,
    @required this.color,
    @required this.textColor,
  });
}

List<AnalyticsFeatures> analyticsFeatures = [
  AnalyticsFeatures(
    heading: 'Academic Performance',
    subHeading: 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
    color: Color(0xFFD0EEFF),
    textColor: Color(0xFF1CAAFA),
  ),
  AnalyticsFeatures(
    heading: 'Co-Curricular',
    subHeading: 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
    color: Color(0xFFD1DEFF),
    textColor: Color(0xFF477AFF),
  ),
  AnalyticsFeatures(
    heading: 'Behaviour',
    subHeading: 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
    color: Color(0xFFFFF2CA),
    textColor: Color(0xFFE3AE01),
  ),
  AnalyticsFeatures(
    heading: 'Skills',
    subHeading: 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
    color: Color(0xFFAFFFD9),
    textColor: Color(0xFF00C968),
  ),
  AnalyticsFeatures(
    heading: 'Attendance',
    subHeading: 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
    color: Color(0xFFFCDCFF),
    textColor: Color(0xFFF14CFF),
  ),
  AnalyticsFeatures(
    heading: 'Quiz',
    subHeading: 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
    color: Color(0xFFFFE2C7),
    textColor: Color(0xFFFA861C),
  ),
];
