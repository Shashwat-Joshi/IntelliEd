import 'package:IntelliEd/style/theme.dart';
import 'package:flutter/material.dart';

Widget notFoundWidget(Size size) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 250.0,
        child: Image(
          image: AssetImage('assets/notFound.png'),
        ),
      ),
      SizedBox(height: 50.0),
      Text(
        'Results not found',
        style: heading2.copyWith(
          fontWeight: FontWeight.w400,
        ),
      )
    ],
  );
}
