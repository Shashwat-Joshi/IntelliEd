import 'package:IntelliEd/auth/authPage1.dart';
import 'package:IntelliEd/auth/authPage2.dart';
import 'package:IntelliEd/users/student/presentation/pages/academicPerformancePage.dart';
import 'package:IntelliEd/users/student/presentation/pages/announcementPage.dart';
import 'package:IntelliEd/users/student/presentation/pages/homePage.dart';
import 'package:IntelliEd/users/student/presentation/pages/profilePage.dart';
import 'package:flutter/material.dart';

Route onGeneratedRoutes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (context, _, __) => AuthPage1(),
      );
      break;
    case '/login':
      return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (context, _, __) => AuthPage2(),
      );
      break;
    //make the below route /student
    case '/student':
      return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 300),
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
      return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (context, _, __) => AnnouncementPage(),
      );
      break;
    case '/student/analytics/0':
      return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 400),
        reverseTransitionDuration: Duration(milliseconds: 250),
        pageBuilder: (context, _, __) => AcademicPerformance(),
      );
      break;
    default:
      return null;
  }
}
