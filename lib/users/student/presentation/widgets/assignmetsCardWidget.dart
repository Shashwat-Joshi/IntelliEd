import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:flutter/material.dart';

Widget assignmentsCard(Size size, int index, [String isSecond]) {
  index = isSecond == "second" ? index + 2 : index;
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xFFD1DEFF),
        ),
        margin: (index % 2 == 0)
            ? EdgeInsets.only(right: 10.0)
            : EdgeInsets.only(left: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        height: 150.0,
        width: size.width / 2 - 30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              assignmentModelData[index].subName,
              style: heading1.copyWith(
                fontSize: 16.0,
                color: Color(0xFF477AFF),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 3.0),
            Text(
              assignmentModelData[index].submissionDate,
              style: subheading.copyWith(color: Color(0xFF717171)),
            ),
            Text(
              assignmentModelData[index].timeLeft,
              textAlign: TextAlign.center,
              style: subheading.copyWith(
                color: Color(0xFF717171),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      assignmentModelData[index].timeLeft == "Submitted"
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.4),
              ),
              margin: (index % 2 == 0)
                  ? EdgeInsets.only(right: 10.0)
                  : EdgeInsets.only(left: 10.0),
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              height: 150.0,
              width: size.width / 2 - 30,
            )
          : Container(),
    ],
  );
}
