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
List globalAnnouncementData = [];

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
    heading: 'Wellness',
    subHeading:
        'Your wellness is your identity and your character is your certificate. Keep it up!!',
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
  AnalyticsFeatures(
    heading: 'Professional Interests',
    subHeading:
        'Here you may explore your field of interest with the ease of analysis.',
    imagePath: 'assets/student/images/analyticsVectors/5.png',
    color: Color(0xFFB8F7FF),
    textColor: Color(0xFF00A5BB),
  ),
  AnalyticsFeatures(
    heading: 'My Report',
    subHeading: 'We have updated the report as per the survey. Do check it.',
    imagePath: 'assets/student/images/analyticsVectors/5.png',
    color: Color(0xFFF3E3A8),
    textColor: Color(0xFFA19361),
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

Map userData = {};

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

StudentAverageMarks modelStudentAverageMarks;

// To save model student data and to fetch class Average and student Average
createModelMarksForAcademicPerformancePage() {
  modelStudentAverageMarks = StudentAverageMarks(
    studentMarks: {
      'Maths': [40.5, 80.8],
      'Physics': [30.4, 95.1],
      'Chemistry': [85.2, 88.6],
      'Biology': [81.7, 88.4],
      'CS': [97.3, 92.2],
      'English': [55.6, 90.3],
      'Hindi': [87.9, 91.4],
      'SST': [15.3, 84.6],
    },
  );
}

List<double> getStudentAverageMarks() {
  List<double> result = [];
  modelStudentAverageMarks.studentMarks.values.toList().forEach((element) {
    result.add(element[0]);
  });
  return result;
}

List<double> getClassAverageMarks() {
  List<double> result = [];
  modelStudentAverageMarks.studentMarks.values.toList().forEach((element) {
    result.add(element[1]);
  });
  return result;
}

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
  List<dynamic> result = [];
  for (int i = 0; i < subjectData.length; i++) {
    if (subjectData[i].subjectName.toLowerCase() == subject.toLowerCase()) {
      result = subjectData[i].subjectWiseData['general'].toList();
    }
  }
  print(result);
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
  'result': [
    {
      'english':
          'Chapter 1\nHow old are Margie and Tommy?,Where was Margie’s school? Did she have any classmates?,What subjects did Margie and Tommy learn?,wouldn’t throw it away.”\n\nWho says these words?\nWhat does ‘it’ refer to?\nWhat is it being compared with by the speaker?',
      'history':
          'Chapter 3\nDescribe the problems faced by the Weimar Republic,Discuss why Nazism became popular in Germany by 1930,What are the peculiar features of Nazi thinking,Explain why Nazi propaganda was effective in creating a hatred for Jews.,Explain the role of women in Nazi society. Return to Chapter 1 on the French Revolution. Write a paragraph comparing and contrasting the role of women in the two periods.',
      'hindi':
          'Chapter 3\nBook Kristina\nरामस्वरूप और गोपाल प्रसाद बात-बात पर ”एक हमारा ज़माना था…” कहकर अपने समय की तुलना वर्तमान समय से करते हैं। इस प्रकार की तुलना करना कहाँ तक तर्कसंगत है?,रामस्वरूप की अपनी बेटी को उच्च शिक्षा दिलवाना और विवाह के लिए छिपाना, यह विरोधाभास उनकी किस विवशता को उजागर करता है?,अपनी बेटी का रिश्ता तय करने के लिए रामस्वरूप उमा से जिस प्रकार के व्यवहार की अपेक्षा कर रहे हैं, वह उचित क्यों नहीं है?',
      'maths':
          'Chapter 10- Circles\nRecall that two circles are congruent if they have the same radii. Prove that equal chords of congruent circles subtend equal angles at their ,Prove that if chords of congruent circles subtend equal angles at their centres, then the chords are equal,Suppose you are given a circle. Give a construction to find its centre.',
      'physics':
          'Chapter- gravitational\nWhat happens to the force between two objects, if (i) The mass of one object is doubled?(ii) The distance between the objects is doubled and tripled?(iii) The masses of both objects are doubled?Amit buys few grams of gold at the poles as per the instruction of one of his friends. He hands over the same when he meets him at the equator. Will the friend agree with the weight of gold bought? If not, why? [Hint: The value of g is greater at the poles than at the equator.',
    },
    {
      'chemistry':
          'Chapter 3 - Atoms and molecules\nName the scientist who coined the term Parmanu, state the law of conservation of mass , state the law of constant proportion with an example, Slove the formula of hydrogen chloride, plate the number of particles in 8kg O2 molecules (no. of molecules from mass)',
      'maths':
          'Chapter 2 - polynomial\nExercise 2.2\n1. Find the value of the polynomial (x)=5x−4x2+3\n(i) x = 0,(ii) x = – 1(iii) x = 2Check whether 7+3x is a factor of 3x3+7x., Determine which of the following polynomials has (x + 1) a factoro of 3+x2+x+1,',
      'english':
          'Poem - Wind\nWhat are the things the wind does in the first stanza, what does the poem say the wind God winnows, what should we do to make friends with the winds, what do the last four lines of the poem means to you, how does the poem speak to the wind in the anger or with humour? Must also have seen or heard of the wind“crumbling lives."what is your response to this? Is it like the poem',
      'history':
          'Chapter 1 - French Revolution .\nWhy was the Bastille hated by all? , Why Did the French government increase the taxes? , Describe the event of 14th July 1789? ,what is Estates general?',
      'biology':
          'Chapter 5- The fundamental unit of life\nWho discovered cell and how, the main part of a typical cell, name three uni cellular organisms , why is plasma membrane called the selectively permeable membrane, who presented the cell theory, name the smallest and the largest cell',
      'computer':
          'Chapter 6 - Consent teacnology\nWhat is multimedia , Write three advantages of multimedia, Name three places where multimedia is used, list each component of multimedia & explain the purpose of each component ,Data encryption means.',
    },
  ]
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

// Data for behaviour
Map<String, Map> behaviourChart = {
  'result': {
    'jan': 34.0,
    'feb': 60.0,
    'mar': 77.0,
    'apr': 70.0,
    'may': 88.0,
    'jun': 60.0,
    'jul': 92.0,
  },
};

// Text for co-curricular page (LOREM)
String bigLoremText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. At proin nisi nunc quam. Non sit metus fermentum eget semper non nullam. Placerat orci lorem gravida at purus et. Lectus commodo donec consectetur odio amet, facilisi dolor viverra. Facilisis sit malesuada ultricies scelerisque nec.";

// Data model for time table
Map timeTableSample = {
  'result': {
    '0': [
      {
        'initial': '9:30',
        'final': '10:10',
        'subName': 'Hindi',
        'subTeacher': 'Ms. Shayna Kapoor',
        'isAcademic': 1,
      },
      {
        'initial': '10:10',
        'final': '10:50',
        'subName': 'Maths',
        'subTeacher': 'Mr. Shashwat Joshi',
        'isAcademic': 1,
      },
      {
        'initial': '10:50',
        'final': '11:30',
        'subName': 'Geography',
        'subTeacher': 'Mr. Aman',
        'isAcademic': 1,
      },
      {
        'initial': '11:30',
        'final': '11:45',
        'subName': 'Lunch Break',
        'subTeacher': '',
        'isAcademic': '',
      },
      {
        'initial': '11:45',
        'final': '12:25',
        'subName': 'English',
        'subTeacher': 'Mr. Anant Jakhmola',
        'isAcademic': 1,
      },
      {
        'initial': '12:25',
        'final': '1:00',
        'subName': 'Biology',
        'subTeacher': 'Ms. Ishani Oberoi',
        'isAcademic': 1,
      }
    ],
    '1': [
      {
        'initial': '9:30',
        'final': '10:10',
        'subName': 'Hindi',
        'subTeacher': 'Ms. Shayna Kapoor',
        'isAcademic': 1,
      },
      {
        'initial': '10:10',
        'final': '10:50',
        'subName': 'Maths',
        'subTeacher': 'Mr. Shashwat Joshi',
        'isAcademic': 1,
      },
      {
        'initial': '10:50',
        'final': '11:30',
        'subName': 'His/Civics/Eco',
        'subTeacher': 'Mrs. Sunita',
        'isAcademic': 1,
      },
      {
        'initial': '11:30',
        'final': '11:45',
        'subName': 'Lunch Break',
        'subTeacher': '',
        'isAcademic': '',
      },
      {
        'initial': '11:45',
        'final': '12:25',
        'subName': 'English',
        'subTeacher': 'Mr.Anant Jakhmola',
        'isAcademic': 1,
      },
      {
        'initial': '12:25',
        'final': '1:00',
        'subName': 'Chemistry',
        'subTeacher': 'Mr. Amit Arora',
        'isAcademic': 1,
      }
    ],
    '2': [
      {
        'initial': '9:30',
        'final': '10:10',
        'subName': 'Computer',
        'subTeacher': 'Mr. Adhyansh Bharadwaj',
        'isAcademic': 1,
      },
      {
        'initial': '10:10',
        'final': '10:50',
        'subName': 'Maths',
        'subTeacher': 'Mr. Shashwat Joshi',
        'isAcademic': 1,
      },
      {
        'initial': '10:50',
        'final': '11:30',
        'subName': 'His/Civics/Eco',
        'subTeacher': 'Mrs. Sunita',
        'isAcademic': 1,
      },
      {
        'initial': '11:30',
        'final': '11:45',
        'subName': 'Lunch Break',
        'subTeacher': '',
        'isAcademic': '',
      },
      {
        'initial': '11:45',
        'final': '12:25',
        'subName': 'English',
        'subTeacher': 'Mr.Anant Jakhmola',
        'isAcademic': 1,
      },
      {
        'initial': '12:25',
        'final': '1:00',
        'subName': 'Physics',
        'subTeacher': 'Mr. Manoj Kumar',
        'isAcademic': 1,
      }
    ],
    '3': [
      {
        'initial': '9:30',
        'final': '10:30',
        'subName': 'Hindi',
        'subTeacher': 'Ms. Shayna Kapoor',
        'isAcademic': 1,
      },
      {
        'initial': '10:30',
        'final': '11:30',
        'subName': 'Maths',
        'subTeacher': 'Mr. Shashwat Joshi',
        'isAcademic': 1,
      },
      {
        'initial': '11:30',
        'final': '12:30',
        'subName': 'Geography',
        'subTeacher': 'Mr. Aman',
        'isAcademic': 1,
      },
      {
        'initial': '11:30',
        'final': '11:45',
        'subName': 'Lunch Break',
        'subTeacher': '',
        'isAcademic': '',
      },
      {
        'initial': '11:45',
        'final': '12:25',
        'subName': 'English',
        'subTeacher': 'Mr. Anant Jakhmola',
        'isAcademic': '1',
      },
      {
        'initial': '12:25',
        'final': '1:00',
        'subName': 'Biology',
        'subTeacher': 'Ms. Ishani Oberoi',
        'isAcademic': 1,
      }
    ],
    '4': [
      {
        'initial': '9:30',
        'final': '10:10',
        'subName': 'Hindi',
        'subTeacher': 'Ms. Shayna Kapoor',
        'isAcademic': 1,
      },
      {
        'initial': '10:10',
        'final': '10:50',
        'subName': 'Maths',
        'subTeacher': 'Mr. Shashwat Joshi',
        'isAcademic': 1,
      },
      {
        'initial': '10:50',
        'final': '11:30',
        'subName': 'His/Civics/Eco',
        'subTeacher': 'Mrs. Sunita',
        'isAcademic': 1,
      },
      {
        'initial': '11:30',
        'final': '11:45',
        'subName': 'Lunch Break',
        'subTeacher': '',
        'isAcademic': '',
      },
      {
        'initial': '11:45',
        'final': '12:25',
        'subName': 'English',
        'subTeacher': 'Mr.Anant Jakhmola',
        'isAcademic': 1,
      },
      {
        'initial': '12:25',
        'final': '1:00',
        'subName': 'Chemistry',
        'subTeacher': 'Mr. Amit Arora',
        'isAcademic': 1,
      }
    ],
    '5': [
      {
        'initial': '9:30',
        'final': '10:10',
        'subName': 'Computer',
        'subTeacher': 'Mr. Adhyansh Bharadwaj',
        'isAcademic': 1,
      },
      {
        'initial': '10:10',
        'final': '10:50',
        'subName': 'Maths',
        'subTeacher': 'Mr. Shashwat Joshi',
        'isAcademic': 1,
      },
      {
        'initial': '10:50',
        'final': '11:30',
        'subName': 'His/Civics/Eco',
        'subTeacher': 'Mrs. Sunita',
        'isAcademic': 1,
      },
      {
        'initial': '11:30',
        'final': '11:45',
        'subName': 'Lunch Break',
        'subTeacher': '',
        'isAcademic': '',
      },
      {
        'initial': '11:45',
        'final': '12:25',
        'subName': 'English',
        'subTeacher': 'Mr.Anant Jakhmola',
        'isAcademic': 1,
      },
      {
        'initial': '12:25',
        'final': '1:00',
        'subName': 'Physics',
        'subTeacher': 'Mr. Manoj Kumar',
        'isAcademic': 1,
      }
    ],
  },
};
// Quiz options
List<String> optionsForQuiz = [
  'Very much',
  'Quite a lot',
  'Moderately',
  'Somewhat',
  'Just a little',
  'Not at all',
];

List<String> customOptions1 = [
  'I always make a last moment plan',
  'Sometimes I make plan when time is very limited',
  'I always make schedule before staring my work.',
  'As a matter of principle, I don’t. I think it is waste of time.',
];

List<String> customOptions2 = [
  'My decision goes with majority of people.',
  'I always take crucial decisions my won.',
  'I prefer to take advice from others before taking decisions.',
  'I usually follow decisions of others.',
];

// Questions for quiz
List<String> questionsForMentalHealthQuiz = [
  'How often  do you value and practice self-exploration and self-improvement ?',
  'How often does it happens that sometime you are greatly interested in being with people and at other times I just want to be left alone with my thoughts.',
  'Do you find it hard to concentrate at one thing at a time ?',
  'Have you lost interests in many things that used to be fun and important to you ?',
  'Do you think that your sleep is disturbed - too little, too much, or broken sleep ?',
  'Without intentional dieting, have you lost , or gained weight with big margins ?',
];

List<String> questionsForProfessionalInterestQuiz = [
  'Do you like Physical Activities that requires physical strength rather than sitting and watching ?',
  'Do you enjoy repairing, fixing a home appliance, machines etc ?',
  'Do you enjoy opening gadgets or toys to see the mechanism and how it works ?',
  'Do you enjoy travelling, exploring new places and learning about other cultures ?',
  'Do you learn the best by practicing skills by yourself rather than having someone show you ?',
  'Do you like to participate in social events, debates, presentations, community services and volunteering ?',
  'How often are you interested in finding out how humans think and behave ?',
  'Do you see yourself helping people in educating them about their basic rights in society ?',
  'How often are you interested in exploring about how politics influence business and public policy decisions?',
  'How often are you updated and keep the near ones updated about things happening around the globe ?',
  'How do you plan your work ?',
  'How do you take crucial decisions ? Imagine a situation and select the best suited option.'
];

// Data for Co-Curricular main graph
Map<String, double> professionalInterestsMainPageData = {
  'Space science': 97.3,
  'Astrophysics': 77.6,
  'Computer science': 97.3,
  'Literature': 25.7,
  'Mathematics': 95.6,
};

int selectedCardWidget;

List<String> skills = [
  "Space Science",
  "Astrophysics",
  "Computer science",
  "Literature",
  "Mathematics",
];
