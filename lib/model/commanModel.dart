import 'package:flutter/material.dart';

String logoPath = 'assets/student/images/logo.png';

String tagLine =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque in.";

List<String> monthNames = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

List<String> weekDayName = [
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
];

String currentDate =
    "${DateTime.now().day} ${monthNames[int.parse('${DateTime.now().month - 1}')]} ${DateTime.now().year}";

int weekDay = DateTime.now().weekday - 1;

// For Academic Performance page 1
class StudentAverageMarks {
  final Map<String, List<double>> studentMarks;
  StudentAverageMarks({
    @required this.studentMarks,
  });
}

// SubjectWise Data and Logic
class SubjectWiseData {
  final Map<String, List> subjectWiseData;
  final String subjectName;
  SubjectWiseData({
    @required this.subjectWiseData,
    @required this.subjectName,
  });
}

// Color Palette for pie and donut charts
List<Color> colorPalette = [
  Color(0xff1CAAFA),
  Color(0xffFF5252),
  Color(0xff00C968),
  Color(0xffFA861C),
  Color(0xff6C63FF),
];
