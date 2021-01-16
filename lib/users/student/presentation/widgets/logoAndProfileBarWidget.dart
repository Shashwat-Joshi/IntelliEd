import 'package:IntelliEd/model/commanModel.dart';
import 'package:IntelliEd/widgets/profileIcon.dart';
import 'package:flutter/material.dart';

Widget logoAndProfileBarWidget(BuildContext context, Size size) {
  return Container(
    width: size.width,
    color: Color(0xFFE8F7FF),
    height: 70.0,
    margin: EdgeInsets.only(top: 26.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.0, left: 23.0),
          child: Image(
            image: AssetImage(logoPath),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 23.0, top: 10.0),
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
    ),
  );
}
