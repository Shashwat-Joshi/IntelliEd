import 'package:IntelliEd/routes/appRoutes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: 1.1),
          child: child,
        );
      },
      title: 'IntelliEd',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGeneratedRoutes,
      theme: ThemeData(
        primaryColor: Color(0xFF36865F),
        canvasColor: Color(0xfffcfcfc),
        fontFamily: 'Nunito',
      ),
    );
  }
}
