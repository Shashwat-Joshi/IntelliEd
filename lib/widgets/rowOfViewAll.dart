import 'package:IntelliEd/style/theme.dart';
import 'package:flutter/material.dart';

Widget rowofViewAll(String headingText) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        headingText,
        style: heading2,
      ),
      InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {},
        child: Text(
          'View All',
          style: viewAllStyle,
        ),
      ),
    ],
  );
}
