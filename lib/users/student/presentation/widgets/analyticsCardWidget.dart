import 'package:IntelliEd/style/theme.dart';
import 'package:flutter/material.dart';

analyticsCardWidget(
  String heading,
  String subheading,
  String imagePath,
  Color color,
  Color textColor,
  Size size,
) {
  return Container(
    margin: EdgeInsets.only(bottom: 21.0),
    padding: EdgeInsets.only(left: 22.0, top: 10.0, bottom: 10.0),
    height: 165.0,
    width: size.width - 0.0,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size.width / 2 - 44.0,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  style: viewAllStyle.copyWith(color: Color(0xFF717171)),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: size.width / 2 - 44.0,
          height: 100.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.centerRight,
              fit: BoxFit.contain,
              image: AssetImage(imagePath),
            ),
          ),
        ),
        SizedBox(width: 2.0),
      ],
    ),
  );
}
