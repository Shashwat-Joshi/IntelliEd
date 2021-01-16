import 'package:flutter/material.dart';

// For Sliver app bar
class CustomSliverAppBar {
  final String name, techSummary, imagePath;
  CustomSliverAppBar({
    @required this.name,
    @required this.techSummary,
    @required this.imagePath,
  });
}

CustomSliverAppBar testAppBar = CustomSliverAppBar(
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
    heading: 'Academic Performance',
    subHeading: 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
    imagePath: 'assets/student/images/analyticsVectors/1.png',
    color: Color(0xFFD0EEFF),
    textColor: Color(0xFF1CAAFA),
  ),
  AnalyticsFeatures(
    heading: 'Co-Curricular',
    subHeading: 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
    imagePath: 'assets/student/images/analyticsVectors/2.png',
    color: Color(0xFFD1DEFF),
    textColor: Color(0xFF477AFF),
  ),
  AnalyticsFeatures(
    heading: 'Behavior',
    subHeading: 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
    imagePath: 'assets/student/images/analyticsVectors/3.png',
    color: Color(0xFFFFF2CA),
    textColor: Color(0xFFE3AE01),
  ),
  AnalyticsFeatures(
    heading: 'Skills',
    subHeading: 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
    imagePath: 'assets/student/images/analyticsVectors/4.png',
    color: Color(0xFFAFFFD9),
    textColor: Color(0xFF00C968),
  ),
  AnalyticsFeatures(
    heading: 'Attendance',
    subHeading: 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
    imagePath: 'assets/student/images/analyticsVectors/5.png',
    color: Color(0xFFFCDCFF),
    textColor: Color(0xFFF14CFF),
  ),
  AnalyticsFeatures(
    heading: 'Quiz',
    subHeading: 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
    imagePath: 'assets/student/images/analyticsVectors/6.png',
    color: Color(0xFFFFE2C7),
    textColor: Color(0xFFFA861C),
  ),
];

// For Assignments features
class AssignmentsModelData {
  final String subName, submissionDate, timeLeft;
  AssignmentsModelData(this.subName, this.submissionDate, this.timeLeft);
}

List<AssignmentsModelData> assignmentModelData = [
  AssignmentsModelData('Maths', '23 January 2020 | 12:00', '1 day Left'),
  AssignmentsModelData('Physics', '23 January 2020 | 12:00', '2 days Left'),
  AssignmentsModelData('Chemistry', '23 January 2020 | 12:00', '2 days Left'),
  AssignmentsModelData('Maths', '21 January 2020 | 12:00', 'Submitted'),
];

// For Today's class feature
class TodaysClass {
  final String subjectAndTeacherName, timePeriod;
  TodaysClass(this.subjectAndTeacherName, this.timePeriod);
}

List<TodaysClass> sampleTimeTable = [
  TodaysClass('Maths | Mr. Aman Jagdev', '12:00 - 14:00'),
  TodaysClass('Physics | Mr. Anant Jakhmola', '12:00 - 14:00'),
  TodaysClass('Chemistry | Mr. Adhyansh', '12:00 - 14:00'),
  TodaysClass('English | Mr. Shashwat Joshi', '12:00 - 14:00'),
  TodaysClass('C.S | Ms. Shayna Kapoor', '12:00 - 14:00'),
  TodaysClass('Hindi | Mr. Mukesh Arthur', '12:00 - 14:00'),
];

// For Profile Page Details
class StudentDetails {
  final String name,
      age,
      fatherName,
      motherName,
      bloodGroup,
      email,
      emergencyContact;
  final List<String> phoneNumbers;

  StudentDetails(this.name, this.age, this.fatherName, this.motherName,
      this.bloodGroup, this.email, this.emergencyContact, this.phoneNumbers);
}

StudentDetails studentDetails = StudentDetails(
  'Shashwat Joshi',
  '18',
  'Mr. J.C Joshi',
  'Monika Joshi',
  'A+',
  'shashwat2002joshi@gmail.com',
  '+91 91345 XXXXX',
  [
    '+91 91345 XXXXX',
    '+91 91345 XXXXX',
  ],
);

// For Academic Performance page 1
class StudentAverageMarks {
  final Map<String, List<double>> studentMarks;
  StudentAverageMarks({
    @required this.studentMarks,
  });
}

StudentAverageMarks modelStudentAverageMarks = StudentAverageMarks(
  studentMarks: {
    'Maths': [88.5, 80.8],
    'Physics': [92.4, 95.1],
    'Chemistry': [85.2, 88.6],
    'Biology': [81.7, 88.4],
    'CS': [97.3, 92.2],
    'English': [81.6, 90.3],
    'Hindi': [87.9, 91.4],
    'SST': [78.3, 84.6],
  },
);

// To store the final subjects for future use
List<String> finalSubjects = [];

Map<String, List> english = {
  "general": [
    [88, 73, 95, 77],
    [90, 87, 77, 89],
  ],
  "UT1": [38, 36, 37, 39, 36, 40],
  "UT2": [38, 36, 37, 39, 36, 40],
  "SA1": [38, 36, 37, 39, 36, 40],
};
