import 'package:IntelliEd/model/commanModel.dart';
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

List<String> subjects = [
  'maths',
  'cs',
];

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
    subHeading:
        ' Check the performance of the individual students of your class.',
    imagePath: 'assets/teacher/analyticsVectors/1.png',
    color: Color(0xFFFFE2C7),
    textColor: Color(0xFFFA861C),
  ),
  AnalyticsFeatures(
    heading: 'Attendence',
    subHeading: 'Check whether all the students are regular with the classes',
    imagePath: 'assets/student/images/analyticsVectors/4.png',
    color: Color(0xFFAFFFD9),
    textColor: Color(0xFF00C968),
  ),
  AnalyticsFeatures(
    heading: 'Your Other Classes',
    subHeading:
        'You can keep a check of the performance of all the classes you take.',
    imagePath: 'assets/student/images/analyticsVectors/3.png',
    color: Color(0xFFFFF2CA),
    textColor: Color(0xFFE3AE01),
  ),
  AnalyticsFeatures(
    heading: 'Behaviour',
    subHeading:
        'There is always a scope for improvement. Here you can check for that.',
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
      'name': 'Adhyansh',
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
    {
      'name': 'Anant Jakhmola',
      'academicMarks': 86,
      'cocurricularMarks': 34,
      'attendance': 89,
      'cocurricularTotal': 50,
    },
    {
      'name': 'Kartikay Sawhaney',
      'academicMarks': 86,
      'cocurricularMarks': 34,
      'attendance': 89,
      'cocurricularTotal': 50,
    },
    {
      'name': 'Shashwat Joshi',
      'academicMarks': 86,
      'cocurricularMarks': 34,
      'attendance': 89,
      'cocurricularTotal': 50,
    },
    {
      'name': 'Shayna Kapoor',
      'academicMarks': 86,
      'cocurricularMarks': 34,
      'attendance': 89,
      'cocurricularTotal': 50,
    },
    {
      'name': 'Vaishnavi Aggarwal',
      'academicMarks': 86,
      'cocurricularMarks': 34,
      'attendance': 89,
      'cocurricularTotal': 50,
    },
    {
      'name': 'A pretty girl',
      'academicMarks': 86,
      'cocurricularMarks': 34,
      'attendance': 89,
      'cocurricularTotal': 50,
    },
    {
      'name': 'She loves you',
      'academicMarks': 86,
      'cocurricularMarks': 34,
      'attendance': 89,
      'cocurricularTotal': 50,
    },
    {
      'name': 'You have a lot in common',
      'academicMarks': 86,
      'cocurricularMarks': 34,
      'attendance': 89,
      'cocurricularTotal': 50,
    },
    {
      'name': 'Wake TF up',
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

// For Student wise Analytics features
class StudentWiseAnalyticsFeatures {
  final String heading, subHeading, imagePath;
  final Color color, textColor;

  StudentWiseAnalyticsFeatures({
    @required this.heading,
    @required this.subHeading,
    @required this.imagePath,
    @required this.color,
    @required this.textColor,
  });
}

List<StudentWiseAnalyticsFeatures> studentWiseAnalyticsFeatures = [
  StudentWiseAnalyticsFeatures(
    heading: 'Academic Performance',
    subHeading: 'Want to check your student performance? Check here',
    imagePath: 'assets/student/images/analyticsVectors/1.png',
    color: Color(0xFFD0EEFF),
    textColor: Color(0xFF1CAAFA),
  ),
  StudentWiseAnalyticsFeatures(
    heading: 'Co-Curricular and Skills',
    subHeading: 'Check out the skillset of your student',
    imagePath: 'assets/student/images/analyticsVectors/2.png',
    color: Color(0xFFAFFFD9),
    textColor: Color(0xFF00C968),
  ),
  StudentWiseAnalyticsFeatures(
    heading: 'Behaviour',
    subHeading: 'Your behaviour in all aspects',
    imagePath: 'assets/student/images/analyticsVectors/3.png',
    color: Color(0xFFFFF2CA),
    textColor: Color(0xFFE3AE01),
  ),
  StudentWiseAnalyticsFeatures(
    heading: 'Attendance',
    subHeading: "Check out your student's attendence",
    imagePath: 'assets/student/images/analyticsVectors/4.png',
    color: Color(0xFFFCDCFF),
    textColor: Color(0xFFF14CFF),
  ),
];

// For student wise attendance
Map<String, Object> perStudentAttendanceData = {
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
  return perStudentAttendanceData['previous'];
}

// To display name of student in appBar
String currentSelectedStudent;

// For student wise academic performance
// For Academic Performance page 1

StudentAverageMarks modelStudentWiseAverageMarks = StudentAverageMarks(
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
List<String> studentWisefinalSubjects = [];

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

// To check if the data is loaded or not
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

// Data for Co-Curricular main graph
Map<String, double> perStudentCoCurricularMainPageData = {
  'Art & Craft': 97.3,
  'Sports': 77.6,
  'Music': 97.3,
  'Club Activity': 25.7,
  'Others': 95.6,
};

// Data for Co-curricular donut graph
Map<String, int> perStudentCoCurricularDonut1Data = {
  'Work Habit': 50,
  'Respect': 10,
  'Initiatives': 35,
  'Collaboration': 5,
};

// Data for Co-curricular Pie graph
Map<String, int> perStudentcoCurricularPieNo2Data = {
  'Leadership': 20,
  'Communication': 40,
  'Problem Solving': 30,
  'Creativity': 10,
};

// For student attendance
List<String> studentNames = [];

// Current selectedClass
String currentSelectedClassForYourClassData;

// Map for exam names loading
Map<String, int> examNames = {
  'UT1': 1,
  'UT2': 1,
  'SA1': 1,
  'UT3': 0,
  'UT4': 0,
};

Map perClassMarks = {
  'result': [
    {
      'name': 'Adhyansh Bharadwaj',
      'marks': 18,
    },
    {
      'name': 'Anant Jakhmola',
      'marks': 16,
    },
    {
      'name': 'Shashwat Joshi',
      'marks': 12,
    },
    {
      'name': 'Shayna Joshi',
      'marks': 20,
    },
    {
      'name': 'Vaishnavi Aggarwal',
      'marks': 17,
    },
  ],
  'maxMarks': 20.0,
};

// Data for calendar Page
Map calendarData = {
  //TODO:
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
//TODO :
// Data for quiz
/*
  Abbreviations
  0 -> below
  1 -> 1
  2 -> 2
  3 -> 3
*/
Map quizData = {
  'collaborative': {
    '0': [
      'Rarely participates in team/group activities.',
      'Rarely provides thoughtful ideas in teams or class activities.',
      'Rarely values and encourages team members.'
    ],
    '1': [
      'Participates minimally and requires some prompting/motivation as a team member.',
      'Sometimes provide thoughtful ideas in team.',
      'Sometimes values and encourages all the team members.',
    ],
    '2': [
      'A strong and self – motivated team member.',
      'Provides thoughtful ideas in team.',
      'Values and encourages all team members.',
    ],
    '3': [
      'Act as a leader or exemplary team.',
      'Consistently provides thoughtful ideas in teams.',
      'Consistently values and encourages all members of teams.',
    ],
  },
  'respect': {
    '0': [
      'Usually ignores the opinions and input of others.',
      'Needs improvement in demonstrating respectful and helpful behavior.',
      'Disrespectful towards teachers or school management or fellow students.',
    ],
    '1': [
      'Shows growth in accepting others.',
      'Improvement noticed in demonstrating respectful and helpful behaviors.',
      'Apologizes and learns from mistakes.',
    ],
    '2': [
      'Listens and accepts the opinion of others.',
      'Demonstrate both respectful and helpful behavior.',
      'Is generally polite while having conversation with fellow students and school management.',
    ],
    '3': [
      'Seeks and accepts the opinions and input of others.',
      'Consistently demonstrates both respectful and helpful behavior.',
      'Maintains 2 conduct while conversating in school premises.',
    ],
  },
  'initiative': {
    '0': [
      'Seldom demonstrates curiosity in learning activities.',
      'Rarely engages in learning activities.',
      'Lacks perseverance',
      'Rarely uses alternate resources to assist with learning new skills.',
    ],
    '1': [
      'Occasionally demonstrates curiosity and interests in learning.',
      'Sometimes engages in learning activities.',
      'Occasionally perseveres',
      'Shows growth in resourcefulness and sometimes seeks assistance.',
    ],
    '2': [
      'Demonstrates curiosity and interests in learning.',
      'Engage in learning activities.',
      'Demonstrates perseverance.',
      'Demonstrates resourcefulness and seeks assistance as necessary.'
    ],
    '3': [
      'Initiates curiosity and interests in learning.',
      'Independently engages in learning activities.',
      'Consistently perseveres and problem solving.',
      'Demonstrates resourcefulness and seeks assistance when crucial.',
    ],
  },
  'workHabits': {
    '0': [
      'Seldom punctual and prepared for new things.',
      'Rarely displays a positive/optimistic attitude.',
      'Needs to remain focused on task.',
      'Does not strives to meet full potential.',
      'Needs to be more punctual in completing tasks and meeting deadlines.',
    ],
    '1': [
      'Occasionally punctual and prepared for new roles.',
      'Shows improvement in displaying a positive attitude.',
      'Sometimes completes the task but is late.',
      'Beginning to strive to meet potential.',
      'Inconsistent with task completion but improving day by day.',
    ],
    '2': [
      'Punctual and prepared for new activities and tasks.',
      'Displays a positive and optimistic attitude.',
      'Completes the task in hand and is generally on time.',
      'Strives to meet full potential',
      'Complete tasks and meets deadline on a consistent basis.',
    ],
    '3': [
      'Always punctual and prepared.',
      'Consistently displays a positive attitude.',
      'Always completes the tasks and that too before deadline.',
      'Always strives to achieve full potential.',
      'Spends extra time and care to ensure tasks are well done.',
    ],
  }
};

// Lorem Ipsum
String loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. At proin nisi nunc quam. ";

// Text for co-curricular page (LOREM)
String bigLoremText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. At proin nisi nunc quam. Non sit metus fermentum eget semper non nullam. Placerat orci lorem gravida at purus et. Lectus commodo donec consectetur odio amet, facilisi dolor viverra. Facilisis sit malesuada ultricies scelerisque nec.";
