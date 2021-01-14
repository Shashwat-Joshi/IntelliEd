import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/widgets/profileIcon.dart';
import 'package:flutter/material.dart';

sliverAppBarWidget(
  Size size,
  String name,
  String techSummary,
  String imagePath,
) {
  return SliverAppBar(
    actions: [
      profileIcon(),
    ],
    primary: true,
    snap: true,
    floating: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
    ),
    forceElevated: false,
    elevation: 0.0,
    onStretchTrigger: () {
      return;
    },
    stretch: true,
    pinned: true,
    collapsedHeight: 110.0,
    flexibleSpace: FlexibleSpaceBar(
      stretchModes: [
        StretchMode.zoomBackground,
        StretchMode.blurBackground,
        StretchMode.fadeTitle,
      ],
      centerTitle: false,
      titlePadding: EdgeInsetsDirectional.only(start: 18.0, bottom: 20.0),
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
                style: heading1,
              ),
              TextSpan(
                text: '\n$techSummary',
                style: subheading,
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
        child: Image.asset(
          imagePath,
          height: 240.0,
          fit: BoxFit.cover,
        ),
      ),
    ),
    expandedHeight: 240.0,
  );
}
