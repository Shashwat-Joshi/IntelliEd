import 'package:flutter/material.dart';

Widget profileDescWidget(
  IconData iconData,
  String heading,
  String subheading,
  Color widgetColor,
) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        height: 55.0,
        width: 55.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widgetColor,
        ),
        child: Icon(iconData),
      ),
      SizedBox(width: 10.0),
      Column(
        children: [
          Text(heading),
          Text(subheading),
        ],
      ),
    ],
  );
}
