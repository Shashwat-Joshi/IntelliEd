import 'dart:ui';
import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/widgets/profileIcon.dart';
import 'package:flutter/material.dart';

subjectWiseAcademicsliverAppBar(
  Size size,
  String headingText,
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
        margin: EdgeInsets.only(right: 23.0, bottom: 0.0),
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
    onStretchTrigger: () {
      return;
    },
    collapsedHeight: 65.0,
    expandedHeight: 200.0,
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: EdgeInsetsDirectional.only(start: 10.0, bottom: 10.0),
      stretchModes: [
        StretchMode.zoomBackground,
        StretchMode.fadeTitle,
      ],
      collapseMode: CollapseMode.pin,
      title: Container(
        padding: EdgeInsets.all(7.0),
        width: size.width - 27 - 9 - profileIconWidth - 10.0,
        child: Text(
          '$headingText',
          style: heading1.copyWith(color: textColor),
          textAlign: TextAlign.left,
        ),
      ),
      background: ClipPath(
        clipper: CustomClipperWidget(),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/student/images/academicSubjects/${headingText.toLowerCase()}.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
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
