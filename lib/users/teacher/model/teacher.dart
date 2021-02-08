import 'package:IntelliEd/users/teacher/model/examData.dart';
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
        'Check the performance of the individual students of your class.',
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
  // AnalyticsFeatures(
  //   heading: 'Behaviour',
  //   subHeading:
  //       'There is always a scope for improvement. Here you can check for that.',
  //   imagePath: 'assets/student/images/analyticsVectors/4.png',
  //   color: Color(0xFFD0EEFF),
  //   textColor: Color(0xFF1CAAFA),
  // ),
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
      'name': 'Adhyansh',
      'marks': 18,
    },
    {
      'name': 'Anant Jakhmola',
      'marks': 16,
    },
    {
      'name': 'Kartikay Sawhaney',
      'marks': 16,
    },
    {
      'name': 'Shashwat Joshi',
      'marks': 20,
    },
    {
      'name': 'Shayna Joshi',
      'marks': 17,
    },
    {
      'name': 'Vaishnavi Aggarwal',
      'marks': 19,
    },
  ],
  'maxMarks': 20.0,
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

List<String> higherAuthoritiesAnnouncement = [
  'Teachers kindly note that we are soon going to reopen the schools. Date and schedule will be forwarded soon.',
  'Teachers kindly note that we are soon going to reopen the schools. Date and schedule will be forwarded soon. All of you have to be present in the meeting for the discussion on the same.',
  'All the teachers kindly note that as per the guidelines under covid 19,we have reduced the time slot of classes to 25 minutes. In case you find any difficulty you may reach out to us to arrange extra classes.',
  'All the teachers kindly note that as per the guidelines under covid 19, we are soon going to reopen the schools. Date and schedule will be forwarded soon. Keep a check on social distancing and make sure all the students are wearing mask in the classes.',
  'This was a bad time for all of us. Covid 19 has drastically affected students mental health in one way or the other. So it\'s our responsibility to ensure that all the students feel confident enough and should actively participate in the offline classes. Help them in adapting the new normal.',
  'Timely check is important when it comes to improvement. Co curricular activities are important in a way or the other to bring some positive changes in your personality and eliminate the negative one. So keep a timely check on the data and keep improving.',
];

// Lorem Ipsum
String scoreCardText =
    "Here is the score card for.... Keep learning, keep growing !!";

// Text for co-curricular page (LOREM)
String bigLoremText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. At proin nisi nunc quam. Non sit metus fermentum eget semper non nullam. Placerat orci lorem gravida at purus et. Lectus commodo donec consectetur odio amet, facilisi dolor viverra. Facilisis sit malesuada ultricies scelerisque nec.";

// Data for calendar Page
Map calendarDataForTeacher = {
  'result': {
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
};
