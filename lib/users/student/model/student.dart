import 'package:IntelliEd/model/commanModel.dart';
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

CustomSliverAppBar studentTestAppBar = CustomSliverAppBar(
    name: 'Shashwat',
    techSummary: 'Student of class 9th A at ABC School',
    imagePath: 'assets/student/images/appBar-bg.png');

// For announcement section
Map<String, String> announcementText = {
  '0': 'Winter Vacation Holiday from 25-December-2020 to 20-January-2021',
  '1': 'Unit Test Will be starting from 30 January 2021.',
  '2': 'New lecture uploaded on platform on Energy and Resources.',
  '3': 'Assignment for Science to be submitted by 26th Jan',
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
    subHeading: 'Want to know where to improve. Check your performance here!!',
    imagePath: 'assets/student/images/analyticsVectors/1.png',
    color: Color(0xFFD0EEFF),
    textColor: Color(0xFF1CAAFA),
  ),
  AnalyticsFeatures(
    heading: 'Co-Curricular and Skills',
    subHeading:
        'Embrace yourself for all the skills you possess. Check your skillset here!!',
    imagePath: 'assets/student/images/analyticsVectors/2.png',
    color: Color(0xFFAFFFD9),
    textColor: Color(0xFF00C968),
  ),
  AnalyticsFeatures(
    heading: 'Behavior',
    subHeading:
        'Your behaviour is your identity and your character is your certificate. Keep it up!!',
    imagePath: 'assets/student/images/analyticsVectors/3.png',
    color: Color(0xFFFFF2CA),
    textColor: Color(0xFFE3AE01),
  ),
  AnalyticsFeatures(
    heading: 'Attendance',
    subHeading: 'Punctuality is key to success. Check how regular you are!!',
    imagePath: 'assets/student/images/analyticsVectors/4.png',
    color: Color(0xFFFCDCFF),
    textColor: Color(0xFFF14CFF),
  ),
  AnalyticsFeatures(
    heading: 'Quiz',
    subHeading:
        'The best way to learn is continuous learning. Try to score well!!',
    imagePath: 'assets/student/images/analyticsVectors/5.png',
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
  TodaysClass('Maths | Mr. Aman Jagdev', '09:00 - 9:45'),
  TodaysClass('Physics | Mr. Anant Jakhmola', '9:50 - 10:25'),
  TodaysClass('Chemistry | Mr. Adhyansh', '10:30 - 11:15'),
  TodaysClass('English | Mr. Shashwat Joshi', '12:00 - 12:45'),
  TodaysClass('C.S | Ms. Shayna Kapoor', '12:50 - 13:25'),
  TodaysClass('Hindi | Mr. Mukesh Arthur', '13:30 - 14:15'),
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
  'Mrs. Monika Joshi',
  'A+',
  'shashwat2002joshi@gmail.com',
  '+91 91345 XXXXX',
  [
    '+91 91345 XXXXX',
    '+91 91345 XXXXX',
  ],
);

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

// Main list to store the data as local app time cache
List<SubjectWiseData> subjectData = [
  SubjectWiseData(
    subjectWiseData: {
      "general": [
        [88, 73, 95],
        [90, 87, 77],
      ],
      "UT1": [
        [20, 20, 19, 22, 21, 18],
        40
      ],
      "UT2": [
        [39, 23, 17, 21, 22, 18],
        40
      ],
      "SA1": [
        [11, 37, 31, 37, 32, 38],
        70
      ],
    },
    subjectName: "SST",
  ),
  SubjectWiseData(
    subjectWiseData: {
      "general": [
        [85, 81, 95],
        [91, 86, 79],
      ],
      "UT1": [
        [5, 23, 20, 19, 19, 19],
        40
      ],
      "UT2": [
        [15, 21, 19, 19, 23, 22],
        40
      ],
      "SA1": [
        [38, 34, 37, 34, 33, 34],
        70
      ],
    },
    subjectName: "Physics",
  ),
  SubjectWiseData(
    subjectWiseData: {
      "general": [
        [86, 79, 90],
        [91, 87, 83],
      ],
      "UT1": [
        [25, 19, 18, 20, 21, 19],
        40
      ],
      "UT2": [
        [21, 20, 20, 23, 20, 23],
        40
      ],
      "SA1": [
        [46, 36, 28, 39, 34, 38],
        70
      ],
    },
    subjectName: "Hindi",
  ),
  SubjectWiseData(
    subjectWiseData: {
      "general": [
        [88, 73, 95],
        [90, 87, 77],
      ],
      "UT1": [
        [18, 18, 17, 19, 22, 22],
        40
      ],
      "UT2": [
        [28, 21, 22, 20, 21, 20],
        40
      ],
      "SA1": [
        [37, 35, 33, 37, 39, 36],
        70
      ],
    },
    subjectName: "English",
  ),
  SubjectWiseData(
    subjectWiseData: {
      "general": [
        [88, 73, 95],
        [90, 87, 77],
      ],
      "UT1": [
        [37, 20, 20, 18, 20, 21],
        40
      ],
      "UT2": [
        [38, 21, 19, 22, 23, 17],
        40
      ],
      "SA1": [
        [66, 38, 33, 34, 36, 39],
        70
      ],
    },
    subjectName: "Maths",
  ),
  SubjectWiseData(
    subjectWiseData: {
      "general": [
        [88, 73, 95],
        [90, 87, 77],
      ],
      "UT1": [
        [10, 20, 21, 21, 15, 18],
        40
      ],
      "UT2": [
        [33, 19, 18, 18, 21, 21],
        40
      ],
      "SA1": [
        [22, 31, 35, 34, 34, 33],
        70
      ],
    },
    subjectName: "CS",
  ),
  SubjectWiseData(
    subjectWiseData: {
      "general": [
        [82, 77, 95],
        [88, 86, 84],
      ],
      "UT1": [
        [28, 19, 20, 19, 21, 20],
        40
      ],
      "UT2": [
        [27, 22, 21, 19, 22, 21],
        40
      ],
      "SA1": [
        [57, 36, 36, 38, 33, 35],
        70
      ],
    },
    subjectName: "Language",
  ),
  SubjectWiseData(
    subjectWiseData: {
      "general": [
        [68, 77, 89],
        [73, 83, 71],
      ],
      "UT1": [
        [33, 21, 20, 19, 22, 23],
        40
      ],
      "UT2": [
        [33, 19, 18, 18, 21, 21],
        40
      ],
      "SA1": [
        [22, 31, 35, 34, 34, 33],
        70
      ],
    },
    subjectName: "Biology",
  ),
  SubjectWiseData(
    subjectWiseData: {
      "general": [
        [88, 73, 95],
        [90, 87, 77],
      ],
      "UT1": [
        [23, 20, 19, 20, 22, 19],
        40
      ],
      "UT2": [
        [23, 20, 20, 21, 22, 18],
        40
      ],
      "SA1": [
        [4, 36, 38, 31, 30, 38],
        70
      ],
    },
    subjectName: "Chemistry",
  ),
];

//To check if the data is loaded or not
int isSubjectWisedataAvailable(String subject) {
  // Returns index if data is available, returns -1 is data is not available !
  int index;
  for (int i = 0; i < subjectData.length; i++) {
    index = subjectData[i].subjectName.toLowerCase() == subject.toLowerCase()
        ? i
        : -1;
  }
  return index;
}

// To simplify the json
getStudentAverageAndClassAverageMarks(String subject) {
  var result = [];
  for (int i = 0; i < subjectData.length; i++) {
    if (subjectData[i].subjectName.toLowerCase() == subject.toLowerCase()) {
      result = subjectData[i].subjectWiseData['general'].toList();
    }
  }
  return result;
}

List<String> getExamNames(String subject) {
  List<String> result = [];
  for (int i = 0; i < subjectData.length; i++) {
    if (subjectData[i].subjectName.toLowerCase() == subject.toLowerCase()) {
      subjectData[i].subjectWiseData.keys.forEach((key) {
        result.add(key);
      });
    }
  }
  result.remove('general');
  return result;
}

perExamData(String subject, String examName) {
  for (int i = 0; i < subjectData.length; i++) {
    if (subjectData[i].subjectName.toLowerCase() == subject.toLowerCase()) {
      return (subjectData[i].subjectWiseData['$examName'.toUpperCase()]);
    }
  }
}

// Lorem Ipsum
String loremIpsum =
    "Here is the score card for.... Keep learning, keep growing !!";

// For Attendance data
Map<String, Object> attendanceData = {
  'studentAverage': 82.2,
  'classAverage': 90.0,
  'previous': {
    'jan': 34.0,
    'feb': 60.0,
    'mar': 77.0,
    'apr': 70.0,
    'may': 88.0,
    'jun': 60.0,
    'jul': 92.0,
  }
};

Map getPreviousAttendanceData() {
  return attendanceData['previous'];
}

// Data for calendar Page
Map calendarData = {
  'physics':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque in. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque in.',
  'maths': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque in.',
  'english':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque in. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque in. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque in. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque in.',
  'hindi':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque in. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque in. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque in. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque in. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque in. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque in.',
  'chemistry':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque in.',
};

// Data for Co-Curricular main graph
Map<String, double> coCurricularMainPageData = {
  'Art & Craft': 97.3,
  'Sports': 77.6,
  'Music': 97.3,
  'Club Activity': 25.7,
  'Others': 95.6,
};

// Data for Co-curricular donut graph
Map<String, int> coCurricularDonut1Data = {
  'Work Habit': 50,
  'Respect': 10,
  'Initiatives': 35,
  'Collaboration': 5,
};

// Data for Co-curricular Pie graph
Map<String, int> coCurricularPieNo2Data = {
  'Leadership': 20,
  'Communication': 40,
  'Problem Solving': 30,
  'Creativity': 10,
};

// Text for co-curricular page (LOREM)

String bigLoremText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. At proin nisi nunc quam. Non sit metus fermentum eget semper non nullam. Placerat orci lorem gravida at purus et. Lectus commodo donec consectetur odio amet, facilisi dolor viverra. Facilisis sit malesuada ultricies scelerisque nec.";

// Data model for time table

Map timeTableSample = {
  'result': [
    {
      'initial': '8:30',
      'final': '9:30',
      'subName': 'Chemistry',
      'subTeacher': 'Ms. Shayna Kapoor',
      'isAcademic': 1,
    },
    {
      'initial': '9:30',
      'final': '10:30',
      'subName': 'CS',
      'subTeacher': 'Mr. Shashwat Joshi',
      'isAcademic': 1,
    },
    {
      'initial': '10:30',
      'final': '11:30',
      'subName': 'Music',
      'subTeacher': 'Mr. Aman',
      'isAcademic': 0,
    },
    {
      'initial': '11:30',
      'final': '12:30',
      'subName': 'Maths',
      'subTeacher': 'Mr. Anant Jakhmola',
      'isAcademic': 1,
    },
    {
      'initial': '12:30',
      'final': '1:30',
      'subName': 'Lunch Break',
      'subTeacher': '',
      'isAcademic': '',
    },
    {
      'initial': '1:30',
      'final': '2:30',
      'subName': 'Biology',
      'subTeacher': 'Ms. Ishani Oberoi',
      'isAcademic': 1,
    },
    {
      'initial': '2:30',
      'final': '3:30',
      'subName': 'English',
      'subTeacher': 'Mr. Kartikay Sawhaney',
      'isAcademic': 1,
    },
    {
      'initial': '3:30',
      'final': '4:30',
      'subName': 'Physics',
      'subTeacher': 'Mr. Adhyansh',
      'isAcademic': 1,
    }
  ],
};
