import 'package:IntelliEd/users/student/presentation/pages/homePage.dart';
import 'package:IntelliEd/users/student/presentation/pages/profilePage.dart';
import 'package:flutter/material.dart';

Route onGeneratedRoutes(RouteSettings settings) {
  switch (settings.name) {
    // FIXME: Change / route to login page later on
    case '/':
      return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (context, _, __) => StudentHomePage(),
      );
      break;
    case '/student/profile':
      return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 400),
        reverseTransitionDuration: Duration(milliseconds: 400),
        pageBuilder: (context, _, __) => StudentProfilePage(),
      );
      break;
    default:
      return null;
  }
}
