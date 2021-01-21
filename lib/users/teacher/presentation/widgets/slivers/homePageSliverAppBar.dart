import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/widgets/profileIcon.dart';
import 'package:flutter/material.dart';

teacherSliverAppBarWidget(
  Size size,
  String name,
  String imagePath,
  BuildContext context,
) {
  return SliverAppBar(
    automaticallyImplyLeading: false,
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
                Navigator.pushNamed(context, '/teacher/profile');
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
    forceElevated: false,
    elevation: 0.0,
    toolbarHeight: 70.0,
    onStretchTrigger: () {
      return;
    },
    collapsedHeight: 80.0,
    expandedHeight: 240.0,
    flexibleSpace: FlexibleSpaceBar(
      stretchModes: [
        StretchMode.zoomBackground,
        StretchMode.fadeTitle,
      ],
      centerTitle: false,
      titlePadding: EdgeInsetsDirectional.only(start: 10.0, bottom: 10.0),
      collapseMode: CollapseMode.pin,
      title: Container(
        padding: EdgeInsets.all(7.0),
        width: size.width - 27 - 9 - profileIconWidth - 10.0,
        child: RichText(
          softWrap: true,
          textAlign: TextAlign.start,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Good Morning, $name',
                style: heading1.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      background: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        child: Hero(
          tag: imagePath,
          child: Image.asset(
            imagePath,
            height: 240.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
