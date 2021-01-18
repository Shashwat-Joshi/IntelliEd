import 'package:IntelliEd/auth/authPage1.dart';
import 'package:IntelliEd/auth/authPage2.dart';
import 'package:IntelliEd/users/student/presentation/pages/academicPerformancePage.dart';
import 'package:IntelliEd/users/student/presentation/pages/announcementPage.dart';
import 'package:IntelliEd/users/student/presentation/pages/attendancePage.dart';
import 'package:IntelliEd/users/student/presentation/pages/homePage.dart';
import 'package:IntelliEd/users/student/presentation/pages/profilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route onGeneratedRoutes(RouteSettings settings) {
  switch (settings.name) {
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

    // Route to student Home Page
    //make the below route /student
    case '/student':
      return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 0),
        pageBuilder: (context, _, __) => StudentHomePage(),
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

    //Route to attendance Page
    case '/student/analytics/3':
      return CupertinoPageRoute(
        maintainState: true,
        builder: (context) => AttendancePage(),
      );
      break;
    default:
      return null;
  }
}
