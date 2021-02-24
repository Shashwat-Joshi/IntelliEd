import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:IntelliEd/users/teacher/presentation/pages/aboutStudentsSkillPage.dart';
import 'package:IntelliEd/widgets/rowOfViewAll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/analyticsCardWidget.dart';

Widget teacherAnnouncementWidget(BuildContext context) => Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 27.0),
          rowofViewAll('Announcements', context, '/teacher/announcements'),
          SizedBox(height: 5.0),
          globalAnnouncementData.length == 0
              ? Text(
                  'No announcement records found',
                  textAlign: TextAlign.left,
                  style: viewAllStyle.copyWith(
                    color: Colors.grey,
                  ),
                )
              : globalAnnouncementData.length == 1
                  ? Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            globalAnnouncementData[0],
                            textAlign: TextAlign.left,
                            style: viewAllStyle.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          Divider(thickness: 1.5),
                        ],
                      ),
                    )
                  : Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0; i < 2; i++)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  globalAnnouncementData[i],
                                  textAlign: TextAlign.left,
                                  style: viewAllStyle.copyWith(
                                    color: Colors.grey,
                                  ),
                                ),
                                Divider(thickness: 1.5),
                              ],
                            ),
                        ],
                      ),
                    ),
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
                  if (i == analyticsFeatures.length - 1) {
                    showQuizDialog(context, size);
                  } else {
                    Navigator.pushNamed(
                      context,
                      '/teacher/analytics/$i',
                    );
                  }
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

showQuizDialog(BuildContext context, Size size) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    'Quiz',
                    style: heading2,
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xffFF5252),
                    ),
                    child: GestureDetector(
                      child: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
            content: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // SizedBox(height: 15.0),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 30.0),
                  //   height: 60.0,
                  //   width: size.width,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10.0),
                  //     color: Color(0xff1CAAFA),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         'Create Quiz',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 18.0,
                  //         ),
                  //       ),
                  //       Spacer(),
                  //       Icon(
                  //         Icons.arrow_right_alt_rounded,
                  //         color: Colors.white,
                  //         size: 26.0,
                  //       )
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 15.0),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => AboutStudentsSkillPage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 60.0,
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xff00C968),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'About Students',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_right_alt_rounded,
                            color: Colors.white,
                            size: 26.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Widget calendarWidget(BuildContext context) => Container(
      child: Column(
        children: [
          SizedBox(height: 27.0),
          rowofViewAll('Calendar', context, '/teacher/calendar'),
          SizedBox(height: 5.0),
          Text(
            'This calender displays the syllabus covered on a weekly basis',
            style: viewAllStyle.apply(
              color: Color(0xFFACACAC),
            ),
          ),
        ],
      ),
    );
