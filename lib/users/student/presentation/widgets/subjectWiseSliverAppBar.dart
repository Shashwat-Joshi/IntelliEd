import 'dart:ui';
import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/widgets/profileIcon.dart';
import 'package:flutter/material.dart';

subjectWiseAcademicsliverAppBar(
  Size size,
  String headingText,
  String imagePath,
  Color bgColor,
  Color textColor,
  BuildContext context,
) {
  return SliverAppBar(
    automaticallyImplyLeading: false,
    backgroundColor: bgColor,
    actions: [
      Container(
        margin: EdgeInsets.only(right: 23.0, bottom: 10.0),
        child: Hero(
          tag: "profilepic",
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.pushNamed(context, '/student/profile');
              },
              child: profileIcon(),
            ),
          ),
        ),
      ),
    ],
    pinned: true,
    floating: false,
    snap: false,
    primary: true,
    stretch: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
    ),
    forceElevated: false,
    elevation: 0.0,
    toolbarHeight: 80.0,
    onStretchTrigger: () {
      return;
    },
    // collapsedHeight: 90.0,
    expandedHeight: 240.0,
    flexibleSpace: FlexibleSpaceBar(
      stretchModes: [
        StretchMode.zoomBackground,
        StretchMode.fadeTitle,
      ],
      centerTitle: true,
      collapseMode: CollapseMode.pin,
      title: Text(
        '$headingText',
        style: heading1.copyWith(color: textColor),
      ),
      background: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        child: Hero(
          tag: imagePath,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/student/images/academicSubjects/${headingText.toLowerCase()}.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
