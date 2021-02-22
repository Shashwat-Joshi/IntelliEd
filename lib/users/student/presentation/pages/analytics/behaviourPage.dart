import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/model/analyticsLocalDB.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/users/student/presentation/widgets/slivers/commanStudentSliverAppBar.dart';
import 'package:IntelliEd/widgets/graphs/behaviourGraphChart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BehaviourPage extends StatefulWidget {
  @override
  _BehaviourPageState createState() => _BehaviourPageState();
}

class _BehaviourPageState extends State<BehaviourPage> {
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
            commanSliverAppBarForStudent(
              size,
              'Behaviour',
              analyticsFeatures[selectedCardWidget].subHeading,
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
                      score: behaviourChart['result'].values.toList(),
                      months: behaviourChart['result'].keys.toList(),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  behaviourSummaryWidget('Summary', behaviorSummary),
                  SizedBox(height: 30.0),
                  behaviourSummaryWidget(
                      'Recommendation', behaviorRecommendationForStudent),
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
              color: Color(0xff717171),
            ),
          )
        ],
      ),
    );
  }
}
