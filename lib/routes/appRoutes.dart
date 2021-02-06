import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Misc. imports
import 'package:IntelliEd/users/student/model/student.dart';

// Route pages
import 'allRoutes.dart';

Route onGeneratedRoutes(RouteSettings settings) {
  switch (settings.name) {

    //TODO: Not a todo a marker: Below are the AUTH PAGE ROUTES
    case '/':
      return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 0),
        pageBuilder: (context, _, __) => AuthPage1(),
      );
      break;
    case '/login':
      return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (context, _, __) => AuthPage2(),
      );
      break;

    //TODO: Not a todo a marker: Below are the STUDENT ROUTES
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
        builder: (context) => CoCurricularPage(),
      );
      break;

    // Route to attendance Page
    case '/student/analytics/3':
      return CupertinoPageRoute(
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
        builder: (context) => CalendarPage(),
      );
      break;

    case '/student/timetable':
      return CupertinoPageRoute(
        builder: (context) => StudentTimeTablePage(),
      );
      break;

    //TODO: Not a todo a marker: Below are the TEACHER ROUTES
    // Change this route to /teacher
    case '/teacher':
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

    // Route to attendance page
    case '/teacher/analytics/1':
      return CupertinoPageRoute(
        builder: (context) => SubmitAttendancePage(),
      );

    // Route to your other classes page
    case '/teacher/analytics/2':
      return CupertinoPageRoute(
        builder: (context) => YourOtherClasses(),
      );

    case '/teacher/otherClasses/marks':
      return CupertinoPageRoute(
        builder: (context) => ClassWiseMarksPage(),
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

    case '/teacher/calendar':
      return CupertinoPageRoute(
        builder: (context) => TeacherCalendarPage(),
      );
      break;

    //TODO: Not a todo a marker: Below are the PARENT ROUTES
    // Change route to /parent
    case '/parent':
      return CupertinoPageRoute(
        builder: (context) => ParentHomePage(),
      );
      break;

    case '/parent/announcements':
      return CupertinoPageRoute(
        builder: (context) => ParentAnnouncementPage(),
      );
      break;
    // Student's Academic Performance for Parent
    case '/parent/childPerformance/classData/0':
      return CupertinoPageRoute(
        builder: (context) => StudentAcademicPerformanceForParent(),
      );
      break;

    // Student's Co-curricular Performance for Parent
    case '/parent/childPerformance/classData/1':
      return CupertinoPageRoute(
        builder: (context) => StudentCoCurricularPageForParent(),
      );
      break;

    // Student's Attendance Performance for Parent
    case '/parent/childPerformance/classData/3':
      return CupertinoPageRoute(
        builder: (context) => StudentAttendancePageForParent(),
      );
      break;

    case '/parent/analytics/1':
      return CupertinoPageRoute(
        builder: (context) => StudentSummaryForParent(),
      );
      break;

    case '/parent/calendar':
      return CupertinoPageRoute(
        builder: (context) => ParentCalendarPage(),
      );
      break;
    default:
      return null;
  }
}
