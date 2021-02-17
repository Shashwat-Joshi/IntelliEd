import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/users/student/presentation/pages/analytics/mentalWellnessQuizPage.dart';
import 'package:IntelliEd/users/student/presentation/widgets/assignmetsCardWidget.dart';
import 'package:IntelliEd/widgets/rowOfViewAll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'analyticsCardWidget.dart';

Widget announcementWidget(BuildContext context) => Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 27.0),
          rowofViewAll('Announcements', context, '/student/announcements'),
          SizedBox(height: 8.0),
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

class AnalyticsWidget extends StatefulWidget {
  final Size size;
  AnalyticsWidget({@required this.size});

  @override
  _AnalyticsWidgetState createState() => _AnalyticsWidgetState();
}

class _AnalyticsWidgetState extends State<AnalyticsWidget> {
  int turns = 1, listLength = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0),
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
                  selectedCardWidget = i;
                  if (i == 4) {
                    showQuizDialog(context, widget.size);
                  } else {
                    Navigator.pushNamed(
                      context,
                      '/student/analytics/$i',
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
              SizedBox(height: 15.0),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => MentalWellnessQuizPage(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 60.0,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xff1CAAFA),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Mental Wellness',
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
              SizedBox(height: 15.0),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  // TODO: Add route to professional Interest quiz
                  //  Navigator.push(
                  //   context,
                  //   CupertinoPageRoute(
                  //     builder: (context) => MentalWellnessQuizPage(),
                  //   ),
                  // );
                },
                child: Container(
                  height: 60.0,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xff00C968),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Professional Interest',
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
}

Widget assignmentWidget(Size size, BuildContext context) => Container(
      child: Column(
        children: [
          SizedBox(height: 27.0),
          rowofViewAll('Assignments', context, null),
          SizedBox(height: 14.0),
          Container(
            height: 210.0,
            child: Column(
              children: [
                Container(
                  height: 100.0,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) =>
                        assignmentsCard(size, index),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 100.0,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) =>
                        assignmentsCard(size, index, 'second'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

Widget calendarWidget(BuildContext context) => Container(
      child: Column(
        children: [
          SizedBox(height: 27.0),
          rowofViewAll('Calendar', context, '/student/calender'),
          SizedBox(height: 5.0),
          Text(
            'Here you can find the syllabus covered on a weekly basis',
            style: viewAllStyle.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );

Widget todaysClasses(BuildContext context) => Container(
      child: Column(
        children: [
          SizedBox(height: 27.0),
          rowofViewAll('Today’s Classes', context, '/student/timetable'),
          SizedBox(height: 14.0),
          for (int i = 0; i < sampleTimeTable.length; i++)
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        sampleTimeTable[i].subjectAndTeacherName,
                        style: viewAllStyle.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Text(
                        sampleTimeTable[i].timePeriod,
                        style: viewAllStyle.copyWith(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1.5,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
