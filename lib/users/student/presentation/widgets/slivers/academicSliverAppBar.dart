import 'dart:ui';

import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/widgets/profileIcon.dart';
import 'package:flutter/material.dart';

academicsliverAppBar(
  Size size,
  String headingText,
  String subheadingtext,
  String imagePath,
  Color bgColor,
  Color textColor,
  BuildContext context,
) {
  return SliverAppBar(
    automaticallyImplyLeading: false,
    backgroundColor: bgColor,
    actions: [
      Container(
        margin: EdgeInsets.only(right: 23.0, bottom: 10.0),
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
    pinned: true,
    floating: false,
    snap: false,
    primary: true,
    stretch: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
    ),
    shadowColor: Colors.grey,
    elevation: 10.0,
    toolbarHeight: 80.0,
    onStretchTrigger: () {
      return;
    },
    collapsedHeight: 90.0,
    expandedHeight: 220.0,
    flexibleSpace: FlexibleSpaceBar(
      stretchModes: [
        StretchMode.zoomBackground,
        StretchMode.fadeTitle,
      ],
      centerTitle: false,
      titlePadding: EdgeInsetsDirectional.only(start: 10.0, bottom: 10.0),
      collapseMode: CollapseMode.pin,
      title: Container(
        padding: EdgeInsets.only(top: 25.0, left: 7.0, right: 7.0, bottom: 7.0),
        width: size.width - 27 - 9 - profileIconWidth - 10.0,
        child: RichText(
          softWrap: true,
          textAlign: TextAlign.start,
          text: TextSpan(
            children: [
              TextSpan(text: '\n'),
              TextSpan(
                text: '$headingText',
                style: heading1.copyWith(color: textColor),
              ),
              TextSpan(
                text: '\n$subheadingtext',
                style: subheading.copyWith(color: Colors.white),
              ),
              TextSpan(text: '\n'),
            ],
          ),
        ),
      ),
      background: ClipPath(
        clipper: CustomClipperWidget(),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.2)),
            ),
          ),
        ),
      ),
    ),
  );
}

class CustomClipperWidget extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double curve = 0.6;
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(size.width / 2 - ((size.width / 2) * curve),
        size.height / 2 + ((size.height / 2) * curve), 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
