import 'package:flutter/material.dart';

const profileIconHeight = 43.0;
const profileIconWidth = 43.0;
profileIcon() {
  return Container(
    margin: EdgeInsets.only(right: 9.0, top: 16.0),
    height: profileIconHeight,
    width: profileIconWidth,
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
    ),
    child: Icon(
      Icons.person,
      color: Color(0xffB0E3FF),
    ),
  );
}
