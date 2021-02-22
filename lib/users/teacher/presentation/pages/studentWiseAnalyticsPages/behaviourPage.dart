import 'package:IntelliEd/model/analyticsLocalDB.dart';
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
              'Wellness',
              studentWiseAnalyticsFeatures[2].subHeading,
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
                      score: behaviourChart[currentSelectedStudentId - 1]
                              ['result']
                          .values
                          .toList(),
                      months: behaviourChart[currentSelectedStudentId - 1]
                              ['result']
                          .keys
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  behaviourSummaryWidget(
                    'Summary',
                    currentSelectedStudentId == 2
                        ? "Based upon your response and our analysis, you just have few mild symptoms associated with depression. For most people, this kind of response is likely an indication of normal ups and downs associated with life. It is unlikely for a person in this response range to qualify for a diagnosis of clinical depression. However, you may benefit from a consultation with a trianed professional if in case you experience difficulties in daily functioning in near future."
                        : behaviorSummary,
                  ),
                  SizedBox(height: 30.0),
                  behaviourSummaryWidget(
                    'Recommendation',
                    currentSelectedStudentId == 2
                        ? "You might suppose that you just don't seem to be keeping pace together with your peers, however, that is not the permanent scenario. We recommend you to eat alimental food, take eight hours of sleep and exercise daily so as maintain a healthy lifestyle. Create a routine for your daily activities as following a routine might help you in bringing things back on track. Lastly, don't forget to smile, as a result of it is the best remedy that you're going to ever notice."
                        : behaviorRecommendationForStudent,
                  ),
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
              color: Color(0xFF717171),
            ),
          )
        ],
      ),
    );
  }
}
