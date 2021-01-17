import 'package:IntelliEd/style/theme.dart';
import 'package:flutter/material.dart';

Widget rowofViewAll(String headingText, BuildContext context, String route) {
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
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(
          'View All',
          style: viewAllStyle.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    ],
  );
}
