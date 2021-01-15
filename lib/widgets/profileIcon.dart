import 'package:flutter/material.dart';

const profileIconHeight = 43.0;
const profileIconWidth = 43.0;
profileIcon(
    [double height = profileIconHeight, double width = profileIconWidth]) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
    ),
    child: Icon(
      Icons.person,
      color: Color(0xffB0E3FF),
      size: (height / 3 <= 24) ? 24 : height / 3,
    ),
  );
}
