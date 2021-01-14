import 'package:IntelliEd/style/theme.dart';
import 'package:flutter/material.dart';

analyticsCardWidget(String heading, String subheading, Color color,
    Color textColor, Size size) {
  print('H-${size.height} W-${size.width}');
  return Container(
    margin: EdgeInsets.only(bottom: 21.0),
    padding: EdgeInsets.symmetric(horizontal: 22.0),
    height: 140.0,
    width: size.width,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Row(
      children: [
        Container(
          width: size.width / 2,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  heading,
                  style: heading1.copyWith(
                    fontSize: 16.0,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 7.0),
                Text(
                  subheading,
                  style: viewAllStyle.copyWith(
                      color: Color(0xFF717171), fontSize: 15.0),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
