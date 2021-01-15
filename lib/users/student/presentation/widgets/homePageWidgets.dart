import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/widgets/rowOfViewAll.dart';
import 'package:flutter/material.dart';
import 'analyticsCardWidget.dart';

class AnalyticsWidget extends StatefulWidget {
  final Function onTapArrow;
  final Size size;
  AnalyticsWidget({@required this.size, this.onTapArrow});

  @override
  _AnalyticsWidgetState createState() => _AnalyticsWidgetState();
}

class _AnalyticsWidgetState extends State<AnalyticsWidget> {
  int turns = 1, listLength = 2;
  double analyticsHeight = 400.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: analyticsHeight,
      padding: EdgeInsets.all(0.0),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 27.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Analytics',
                  style: heading2,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      (turns == 1) ? turns = 3 : turns = 1;
                      analyticsHeight == 400.0
                          ? analyticsHeight = 1045.0
                          : analyticsHeight = 400.0;
                      widget.onTapArrow(turns);
                      listLength == 2
                          ? listLength = analyticsFeatures.length
                          : listLength = 2;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0, bottom: 7.0, top: 7.0),
                    child: RotatedBox(
                      quarterTurns: turns,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 20.0,
                        color: Color(0xFF00C968),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.0),
            for (int i = 0; i < listLength; i++)
              analyticsCardWidget(
                analyticsFeatures[i].heading,
                analyticsFeatures[i].subHeading,
                analyticsFeatures[i].imagePath,
                analyticsFeatures[i].color,
                analyticsFeatures[i].textColor,
                widget.size,
              ),
          ],
        ),
      ),
    );
  }
}

Widget announcementWidget() => Container(
      child: Column(
        children: [
          SizedBox(height: 27.0),
          rowofViewAll('Announcements'),
          SizedBox(height: 14.0),
          Text(
            announcementText['0'],
            style: viewAllStyle.apply(
              color: Color(0xFFACACAC),
            ),
          ),
          Divider(
            thickness: 1.5,
          ),
          Text(
            announcementText['0'],
            style: viewAllStyle.apply(
              color: Color(0xFFACACAC),
            ),
          ),
          Divider(thickness: 1.5),
        ],
      ),
    );

Widget calendarWidget() => Container(
      child: Column(
        children: [
          SizedBox(height: 27.0),
          rowofViewAll('Calander'),
          SizedBox(height: 14.0),
          Text(
            announcementText['0'],
            style: viewAllStyle.apply(
              color: Color(0xFFACACAC),
            ),
          ),
          Divider(
            thickness: 1.5,
          ),
        ],
      ),
    );
