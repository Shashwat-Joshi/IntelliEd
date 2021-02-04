import 'package:flutter/material.dart';

// For Sliver app bar
class CustomSliverAppBar {
  final String name, imagePath;
  CustomSliverAppBar({
    @required this.name,
    @required this.imagePath,
  });
}

CustomSliverAppBar parentTestAppBar = CustomSliverAppBar(
  name: 'Lorem Ipsum',
  imagePath: 'assets/student/images/appBar-bg.png',
);

// For announcement section
Map<String, String> announcementText = {
  '0': 'Winter Vacation Holiday from 25-December-2020 to 20-January-2021',
  '1': 'Unit Test Will be starting from 30 January 2021.',
  '2': 'New lecture uploaded on platform on Energy and Resources.',
  '3': 'Assignment for Science to be submitted by 26th Jan',
};

// For Analytics Widget section
class AnalyticsWidget {
  final String heading, subheading;
  final Color textColor, bgColor;
  AnalyticsWidget({
    @required this.heading,
    @required this.subheading,
    @required this.textColor,
    @required this.bgColor,
  });
}

List<AnalyticsWidget> analyticsWidgetData = [
  AnalyticsWidget(
    heading: 'Child Performance',
    subheading: 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
    textColor: Color(0xff1CAAFA),
    bgColor: Color(0xffD0EEFF),
  ),
  AnalyticsWidget(
    heading: 'Student Summary',
    subheading: 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
    textColor: Color(0xffFA861C),
    bgColor: Color(0xffFFE2C7),
  ),
  AnalyticsWidget(
    heading: 'Teacher Contact',
    subheading: 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
    textColor: Color(0xff477AFF),
    bgColor: Color(0xffD1DEFF),
  ),
];
