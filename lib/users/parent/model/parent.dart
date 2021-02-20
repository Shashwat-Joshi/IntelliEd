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

CustomSliverAppBar parentTestAppBar = CustomSliverAppBar(
  name: 'Vertika',
  imagePath: 'assets/student/images/appBar-bg.png',
);

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
    subheading: "You can keep a check on your ward's performance here.",
    textColor: Color(0xff1CAAFA),
    bgColor: Color(0xffD0EEFF),
  ),
  AnalyticsWidget(
    heading: 'Student Summary',
    subheading:
        'Here is all you need to know about his progress in academic and extra curricular activities',
    textColor: Color(0xffFA861C),
    bgColor: Color(0xffFFE2C7),
  ),
  AnalyticsWidget(
    heading: 'Teacher Contact',
    subheading:
        'If you want to discuss your child performance with their teachers. Here you go.',
    textColor: Color(0xff477AFF),
    bgColor: Color(0xffD1DEFF),
  ),
];

// For Student wise Analytics features
class StudentWiseAnalyticsFeaturesForParent {
  final String heading, subHeading, imagePath;
  final Color color, textColor;

  StudentWiseAnalyticsFeaturesForParent({
    @required this.heading,
    @required this.subHeading,
    @required this.imagePath,
    @required this.color,
    @required this.textColor,
  });
}

List<StudentWiseAnalyticsFeaturesForParent>
    studentWiseAnalyticsFeaturesForParent = [
  StudentWiseAnalyticsFeaturesForParent(
    heading: 'Academic Performance',
    subHeading: "Check Your child's performance",
    imagePath: 'assets/student/images/analyticsVectors/1.png',
    color: Color(0xFFD0EEFF),
    textColor: Color(0xFF1CAAFA),
  ),
  StudentWiseAnalyticsFeaturesForParent(
    heading: 'Co-Curricular and Skills',
    subHeading: 'Every Child is unique check their skills and activities',
    imagePath: 'assets/student/images/analyticsVectors/2.png',
    color: Color(0xFFAFFFD9),
    textColor: Color(0xFF00C968),
  ),
  StudentWiseAnalyticsFeaturesForParent(
    heading: 'Wellness',
    subHeading: 'Here is the wellness report of your child',
    imagePath: 'assets/student/images/analyticsVectors/3.png',
    color: Color(0xFFFFF2CA),
    textColor: Color(0xFFE3AE01),
  ),
  StudentWiseAnalyticsFeaturesForParent(
    heading: 'Attendance',
    subHeading: 'Is your child Regular to school check here.',
    imagePath: 'assets/student/images/analyticsVectors/4.png',
    color: Color(0xFFFCDCFF),
    textColor: Color(0xFFF14CFF),
  ),
];

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
List<String> studentWisefinalSubjects = [];

// For student wise academic performance
// For Academic Performance page 1

// Student Name
String studentName = 'Shashwat Joshi';

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

// Data for calendar Page
Map calendarData = {
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

// Lorem Ipsum
String loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. At proin nisi nunc quam. ";

// Text for co-curricular page (LOREM)
String bigLoremText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. At proin nisi nunc quam. Non sit metus fermentum eget semper non nullam. Placerat orci lorem gravida at purus et. Lectus commodo donec consectetur odio amet, facilisi dolor viverra. Facilisis sit malesuada ultricies scelerisque nec.";

// Data for Co-Curricular main graph
Map<String, double> professionalInterestsMainPageDataForParent = {
  'Space Science': 97.3,
  'Literature': 77.6,
  'Theoretical Computer Science': 97.3,
  'Cyber Security': 25.7,
  'Public Policy': 95.6,
};

List globalAnnouncementData = [];

// To store all the user data from sign in
Map userData = {};
