import 'package:flutter/material.dart';

// For Sliver app bar
class CustomSliverAppBar {
  final String name, imagePath;
  CustomSliverAppBar({
    @required this.name,
    @required this.imagePath,
  });
}

CustomSliverAppBar teacherTestAppBar = CustomSliverAppBar(
  name: 'Anant',
  imagePath: 'assets/student/images/appBar-bg.png',
);

// For announcement section
Map<String, String> announcementText = {
  '0': 'Winter Vacation Holiday from 25-December-2020 to 20-January-2021',
  '1': 'Unit Test Will be starting from 30 January 2021.',
  '2': 'New lecture uploaded on platform on Energy and Resources.',
  '3': 'Assignment for Science to be submitted by 26th Jan',
};

// Teacher other class data
Map classData = {
  'main': '7A',
  'other': [
    '9C',
    '10D',
    '12E',
    '11G',
  ],
};

// Create announcement data
String announcementData = "";

// For Analytics features
class AnalyticsFeatures {
  final String heading, subHeading, imagePath;
  final Color color, textColor;

  AnalyticsFeatures({
    @required this.heading,
    @required this.subHeading,
    @required this.imagePath,
    @required this.color,
    @required this.textColor,
  });
}

List<AnalyticsFeatures> analyticsFeatures = [
  AnalyticsFeatures(
    heading: 'Class Data',
    subHeading: 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
    imagePath: 'assets/teacher/analyticsVectors/1.png',
    color: Color(0xFFFFE2C7),
    textColor: Color(0xFFFA861C),
  ),
  AnalyticsFeatures(
    heading: 'Attendence',
    subHeading: 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
    imagePath: 'assets/student/images/analyticsVectors/2.png',
    color: Color(0xFFAFFFD9),
    textColor: Color(0xFF00C968),
  ),
  AnalyticsFeatures(
    heading: 'Your Other Classes',
    subHeading: 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
    imagePath: 'assets/student/images/analyticsVectors/3.png',
    color: Color(0xFFFFF2CA),
    textColor: Color(0xFFE3AE01),
  ),
  AnalyticsFeatures(
    heading: 'Behaviour',
    subHeading: 'General Questions For Teachers for Behaviourial Analysis',
    imagePath: 'assets/student/images/analyticsVectors/4.png',
    color: Color(0xFFD0EEFF),
    textColor: Color(0xFF1CAAFA),
  ),
  AnalyticsFeatures(
    heading: 'Quiz',
    subHeading:
        'The best way to learn is continuous learning. Try to score well!!',
    imagePath: 'assets/student/images/analyticsVectors/5.png',
    color: Color(0xFFD1DEFF),
    textColor: Color(0xFF477AFF),
  ),
];

// For Profile Page Details
class TeacherDetails {
  final String name, age, gender, bloodGroup, email, emergencyContact;

  final List<String> phoneNumbers;

  TeacherDetails(this.name, this.age, this.gender, this.bloodGroup, this.email,
      this.emergencyContact, this.phoneNumbers);
}

TeacherDetails teacherDetails = TeacherDetails(
  'Anant Jakhmola',
  '21',
  'M',
  'A+',
  'anantjakhmola@gmail.com',
  '+91 91345 XXXXX',
  [
    '+91 91345 XXXXX',
    '+91 91345 XXXXX',
  ],
);

// Data for class data page
Map classDataStudent = {
  'result': [
    {
      'name': 'Shashwat Joshi',
      'academicMarks': 86,
      'cocurricularMarks': 34,
      'attendance': 89,
      'cocurricularTotal': 50,
    },
    {
      'name': 'Anant Jakhmola',
      'academicMarks': 86,
      'cocurricularMarks': 34,
      'attendance': 89,
      'cocurricularTotal': 50,
    },
    {
      'name': 'Anant',
      'academicMarks': 86,
      'cocurricularMarks': 34,
      'attendance': 89,
      'cocurricularTotal': 50,
    },
    {
      'name': 'A7X',
      'academicMarks': 86,
      'cocurricularMarks': 34,
      'attendance': 89,
      'cocurricularTotal': 50,
    },
    {
      'name': 'Aman',
      'academicMarks': 86,
      'cocurricularMarks': 34,
      'attendance': 89,
      'cocurricularTotal': 50,
    },
  ],
};

List<Color> colors = [
  Color(0xffB692F7),
  Color(0xffFFA64D),
  Color(0xff5564FD),
  Color(0xffF8867E),
];

// Lorem Ipsum
String loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. At proin nisi nunc quam. ";

// Text for co-curricular page (LOREM)
String bigLoremText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. At proin nisi nunc quam. Non sit metus fermentum eget semper non nullam. Placerat orci lorem gravida at purus et. Lectus commodo donec consectetur odio amet, facilisi dolor viverra. Facilisis sit malesuada ultricies scelerisque nec.";
