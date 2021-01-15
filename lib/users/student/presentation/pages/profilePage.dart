import 'dart:ui' as ui;
import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/users/student/presentation/widgets/profileDescWidget.dart';
import 'package:IntelliEd/widgets/profileIcon.dart';
import 'package:flutter/material.dart';

class StudentProfilePage extends StatefulWidget {
  @override
  _StudentProfilePageState createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Image.asset('assets/student/images/logo.png'),
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFF00C968),
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 7.0),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {},
            icon: Icon(
              Icons.edit_rounded,
              color: Color(0xFF00C968),
            ),
          ),
        ],
      ),
      // extendBodyBehindAppBar: true,
      body: Container(
        color: Colors.grey,
        height: 300,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: "profilepic",
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: profileIcon(106.0, 106.0),
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Text(
              'Shashwat Joshi',
              style: heading1,
            ),
            SizedBox(height: 10.0),
            Text(
              '12-C',
              style: viewAllStyle.copyWith(fontWeight: FontWeight.w600),
            ),
            // SizedBox(
            //   height: 100.0,
            // ),
            Row(
              children: [
                profileDescWidget(
                  Icons.calendar_today_rounded,
                  'Age',
                  '18',
                  Color(0xFFD1DEFF),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
