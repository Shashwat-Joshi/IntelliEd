import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:IntelliEd/widgets/rowOfViewAll.dart';
import 'package:flutter/material.dart';
import 'analyticsCardWidget.dart';

Widget teacherAnnouncementWidget(BuildContext context) => Container(
      child: Column(
        children: [
          SizedBox(height: 27.0),
          rowofViewAll('Announcements', context, '/teacher/announcements'),
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

class AttendanceAndAnalyticsWidget extends StatefulWidget {
  final Size size;
  AttendanceAndAnalyticsWidget({@required this.size});

  @override
  _AttendanceAndAnalyticsWidgetState createState() =>
      _AttendanceAndAnalyticsWidgetState();
}

class _AttendanceAndAnalyticsWidgetState
    extends State<AttendanceAndAnalyticsWidget> {
  int turns = 1, listLength = 2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 27.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width / 1.5,
                  child: Text(
                    'Attendance and Analytics',
                    style: heading2,
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      (turns == 1) ? turns = 3 : turns = 1;
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
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/teacher/analytics/$i',
                  );
                },
                child: analyticsCardWidget(
                  analyticsFeatures[i].heading,
                  analyticsFeatures[i].subHeading,
                  analyticsFeatures[i].imagePath,
                  analyticsFeatures[i].color,
                  analyticsFeatures[i].textColor,
                  widget.size,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

Widget calendarWidget(BuildContext context) => Container(
      child: Column(
        children: [
          SizedBox(height: 27.0),
          rowofViewAll('Calendar', context, '/teacher/calendar'),
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
