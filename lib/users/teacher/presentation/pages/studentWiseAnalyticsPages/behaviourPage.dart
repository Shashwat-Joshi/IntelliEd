import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/examData.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:IntelliEd/users/teacher/presentation/widgets/slivers/commonSliverForTeacher.dart';
import 'package:IntelliEd/widgets/graphs/behaviourGraphChart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StudentWiseBehaviourPage extends StatefulWidget {
  @override
  _StudentWiseBehaviourPageState createState() =>
      _StudentWiseBehaviourPageState();
}

class _StudentWiseBehaviourPageState extends State<StudentWiseBehaviourPage> {
  ScrollController _scrollController = ScrollController();
  String bullet = "\u2022 ";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CupertinoScrollbar(
        controller: _scrollController,
        child: CustomScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          slivers: [
            commanSliverAppBarForTeacher(
              size,
              'Behaviour',
              analyticsFeatures[3].subHeading,
              'assets/student/images/calendar.png',
              Color(0xFFB0E3FF),
              Color(0xFF1CAAFA),
              this.context,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: 340.0,
                    width: size.width,
                    margin: EdgeInsets.all(26.0),
                    child: BehaviourGraph(
                      monthWiseAttendance:
                          behaviourChart[currentSelectedStudentId - 1]['result']
                              .values
                              .toList(),
                      months: behaviourChart[currentSelectedStudentId - 1]
                              ['result']
                          .keys
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  behaviourSummaryWidget('Summary',
                      "As per the analysis we have found that you are doing great. Although you have seen several ups and downs in the past but you have came up with great solutions. Go with the flow"),
                  SizedBox(height: 30.0),
                  behaviourSummaryWidget('Recommendation',
                      "First of all, Smile. Believe or not it's the best remedy you will ever found. You might think you are not keeping the pace with your peers, but that's not the permanent situation. So keep it up"),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget behaviourSummaryWidget(String heading, String subheading) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 27.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bullet + ' $heading',
            style: heading2.copyWith(
              color: Color(0xFF1CAAFA),
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            subheading,
            style: viewAllStyle.apply(
              color: Color(0xFFACACAC),
            ),
          )
        ],
      ),
    );
  }
}
