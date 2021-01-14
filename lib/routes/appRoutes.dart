import 'package:IntelliEd/users/student/presentation/pages/homePage.dart';
import 'package:flutter/material.dart';

Route onGeneratedRoutes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (context, _, __) => StudentHomePage(),
      );
      break;
    default:
      return null;
  }
}
