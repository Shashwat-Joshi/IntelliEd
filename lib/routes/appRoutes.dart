import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Misc. imports
import 'package:IntelliEd/users/student/model/student.dart';

// Route pages
import 'package:IntelliEd/auth/authPage1.dart';
import 'package:IntelliEd/auth/authPage2.dart';
import 'package:IntelliEd/users/student/presentation/pages/academicPerformancePage.dart';
import 'package:IntelliEd/users/student/presentation/pages/announcementPage.dart';
import 'package:IntelliEd/users/student/presentation/pages/attendancePage.dart';
import 'package:IntelliEd/users/student/presentation/pages/calendarPage.dart';
import 'package:IntelliEd/users/student/presentation/pages/coCurricularPage.dart';
import 'package:IntelliEd/users/student/presentation/pages/homePage.dart';
import 'package:IntelliEd/users/student/presentation/pages/profilePage.dart';
import 'package:IntelliEd/users/student/presentation/pages/studentTimeTablePage.dart';
import 'package:IntelliEd/users/teacher/presentation/pages/announcementPage.dart';
import 'package:IntelliEd/users/teacher/presentation/pages/homePage.dart';
import 'package:IntelliEd/users/teacher/presentation/pages/profilePage.dart';
import 'package:IntelliEd/users/teacher/presentation/pages/classDataPage.dart';
import 'package:IntelliEd/users/teacher/presentation/pages/createAnnouncementPage.dart';
import 'package:IntelliEd/users/teacher/presentation/pages/studentWiseAnalyticsPages/academicPerformance.dart';
import 'package:IntelliEd/users/teacher/presentation/pages/studentWiseAnalyticsPages/attendancePage.dart';
import 'package:IntelliEd/users/teacher/presentation/pages/studentWiseAnalyticsPages/coCurricular.dart';

Route onGeneratedRoutes(RouteSettings settings) {
  switch (settings.name) {
    // case '/':
    //   return PageRouteBuilder(

    //     transitionDuration: Duration(milliseconds: 0),
    //     pageBuilder: (context, _, __) => AuthPage1(),
    //   );
    //   break;
    case '/login':
      return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (context, _, __) => AuthPage2(),
      );
      break;

    // Route to student Home Page
    // convert to /student
    case '/student':
      return CupertinoPageRoute(
        builder: (context) => StudentHomePage(),
      );
      break;

    case '/student/profile':
      return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 800),
        reverseTransitionDuration: Duration(milliseconds: 800),
        pageBuilder: (context, _, __) => StudentProfilePage(),
      );
      break;

    case '/student/announcements':
      return CupertinoPageRoute(
        builder: (context) => AnnouncementPage(),
      );
      break;

    // Route to academic Performance
    case '/student/analytics/0':
      return CupertinoPageRoute(
        maintainState: true,
        builder: (context) => AcademicPerformance(),
      );
      break;

    // Route to co curricular Page
    case '/student/analytics/1':
      return CupertinoPageRoute(
        maintainState: true,
        builder: (context) => CoCurricularPage(),
      );
      break;

    // Route to attendance Page
    case '/student/analytics/3':
      return CupertinoPageRoute(
        maintainState: true,
        builder: (context) => StudentAttendancePage(
          studentAverage: attendanceData['studentAverage'],
          classAverage: attendanceData['classAverage'],
          months: getPreviousAttendanceData().keys.toList(),
          monthWiseAttendance: getPreviousAttendanceData().values.toList(),
        ),
      );
      break;

    case '/student/calender':
      return CupertinoPageRoute(
        maintainState: true,
        builder: (context) => CalendarPage(),
      );
      break;

    case '/student/timetable':
      return CupertinoPageRoute(
        builder: (context) => StudentTimeTablePage(),
      );
      break;

    // Change this route to /teacher
    case '/':
      return CupertinoPageRoute(
        builder: (context) => TeacherHomePage(),
      );
      break;

    case '/teacher/profile':
      return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 800),
        reverseTransitionDuration: Duration(milliseconds: 800),
        pageBuilder: (context, _, __) => TeacherProfilePage(),
      );
      break;

    case '/teacher/announcements':
      return CupertinoPageRoute(
        builder: (context) => TeacherAnnouncementPage(),
      );
      break;

    case '/teacher/createAnnouncements':
      return CupertinoPageRoute(
        builder: (context) => CreateAnnouncementPage(),
      );
      break;

    // Route to class data page
    case '/teacher/analytics/0':
      return CupertinoPageRoute(
        builder: (context) => ClassDataPage(),
      );
      break;

    //Route to student wise academic page
    case '/teacher/analytics/classData/0':
      return CupertinoPageRoute(
        builder: (context) => StudentWiseAcademicPerformance(),
      );
      break;

    case '/teacher/analytics/classData/1':
      return CupertinoPageRoute(
        builder: (context) => StudentWiseCoCurricularPage(),
      );

    // Route to student wise attendance page
    case '/teacher/analytics/classData/3':
      return CupertinoPageRoute(
        builder: (context) => StudentWiseAttendancePage(),
      );
      break;
    default:
      return null;
  }
}
