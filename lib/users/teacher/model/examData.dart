// To display name of student in appBar
import 'package:IntelliEd/model/commanModel.dart';

int currentSelectedStudentId;

// For student wise academic performance
// For Academic Performance page 1
List<StudentAverageMarks> modelStudentWiseAverageMarks = [
  StudentAverageMarks(
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
  ),
  StudentAverageMarks(
    studentMarks: {
      'Maths': [88.5, 80.8],
      'Physics': [92.4, 95.1],
      'Chemistry': [83.2, 88.6],
      'Biology': [74.7, 88.4],
      'CS': [77.3, 92.2],
      'English': [89.6, 90.3],
      'Hindi': [89.9, 91.4],
      'SST': [74.3, 84.6],
    },
  ),
  StudentAverageMarks(
    studentMarks: {
      'Maths': [86.5, 80.8],
      'Physics': [85.2, 95.1],
      'Chemistry': [85.4, 88.6],
      'Biology': [80.9, 88.4],
      'CS': [90.3, 92.2],
      'English': [83.7, 90.3],
      'Hindi': [84.1, 91.4],
      'SST': [70.2, 84.6],
    },
  ),
  StudentAverageMarks(
    studentMarks: {
      'Maths': [81.7, 80.8],
      'Physics': [97.4, 95.1],
      'Chemistry': [80.2, 88.6],
      'Biology': [81.7, 88.4],
      'CS': [94.9, 92.2],
      'English': [67.6, 90.3],
      'Hindi': [75.5, 91.4],
      'SST': [87.4, 84.6],
    },
  ),
  StudentAverageMarks(
    studentMarks: {
      'Maths': [87.0, 80.8],
      'Physics': [86.2, 95.1],
      'Chemistry': [85.2, 88.6],
      'Biology': [88.3, 88.4],
      'CS': [90.6, 92.2],
      'English': [82.4, 90.3],
      'Hindi': [83.3, 91.4],
      'SST': [75.3, 84.6],
    },
  ),
  StudentAverageMarks(
    studentMarks: {
      'Maths': [84.8, 80.8],
      'Physics': [90.5, 95.1],
      'Chemistry': [87.7, 88.6],
      'Biology': [86.4, 88.4],
      'CS': [94.1, 92.2],
      'English': [84.4, 90.3],
      'Hindi': [88.2, 91.4],
      'SST': [79.6, 84.6],
    },
  ),
];

// To store the final subjects for future use
List<String> studentWisefinalSubjects = [];

// Main list to store the data as local app time cache
List<SubjectWiseData> subjectData = [
  SubjectWiseData(
    subjectWiseData: {
      "general": [
        // Student Average
        [88, 73, 95],
        // Class Average
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
      'name': 'Shayna Joshi',
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
  ],
};

// Data for behaviour
List<Map<String, Map>> behaviourChart = [
  {
    'result': {
      'jan': 34.0,
      'feb': 60.0,
      'mar': 77.0,
      'apr': 70.0,
      'may': 88.0,
      'jun': 60.0,
      'jul': 92.0,
    },
  },
  {
    'result': {
      'jan': 34.0,
      'feb': 60.0,
      'mar': 77.0,
      'apr': 70.0,
      'may': 72.0,
      'jun': 40.0,
      'jul': 28.0,
    },
  },
  {
    'result': {
      'jan': 34.0,
      'feb': 60.0,
      'mar': 77.0,
      'apr': 70.0,
      'may': 88.0,
      'jun': 60.0,
      'jul': 92.0,
    },
  },
  {
    'result': {
      'jan': 34.0,
      'feb': 60.0,
      'mar': 77.0,
      'apr': 70.0,
      'may': 88.0,
      'jun': 60.0,
      'jul': 92.0,
    },
  },
  {
    'result': {
      'jan': 34.0,
      'feb': 60.0,
      'mar': 77.0,
      'apr': 70.0,
      'may': 88.0,
      'jun': 60.0,
      'jul': 92.0,
    },
  },
  {
    'result': {
      'jan': 34.0,
      'feb': 60.0,
      'mar': 77.0,
      'apr': 70.0,
      'may': 88.0,
      'jun': 60.0,
      'jul': 92.0,
    },
  },
];
