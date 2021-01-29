import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:flutter/material.dart';

class ClassWiseMarksPage extends StatefulWidget {
  @override
  _ClassWiseMarksPageState createState() => _ClassWiseMarksPageState();
}

class _ClassWiseMarksPageState extends State<ClassWiseMarksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentSelectedClassForYourClassData),
      ),
    );
  }
}
