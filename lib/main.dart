import 'package:IntelliEd/routes/appRoutes.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IntelliEd',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGeneratedRoutes,
      theme: ThemeData(
        primaryColor: Color(0xFF36865F),
      ),
    );
  }
}
