import 'package:IntelliEd/auth/authPage1.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

String logoPath = 'assets/student/images/logo.png';

String tagLine = "The Intelligent Learning Assistance Platform";

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

getCurrentWeek() {
  int date = DateTime.now().day;
  if (date <= 7)
    return 1;
  else if (date > 7 && date <= 14)
    return 2;
  else if (date > 14 && date <= 21)
    return 3;
  else
    return 4;
}

//URL
String apiUrl = "https://intelliedapi.azurewebsites.net";

// Log Out function
logOutUser(BuildContext context) async {
  await Hive.deleteBoxFromDisk('userData');
  await Hive.deleteFromDisk();
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => AuthPage1(),
    ),
    (route) => false,
  );
}
