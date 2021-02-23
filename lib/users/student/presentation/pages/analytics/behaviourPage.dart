import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/model/analyticsLocalDB.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/users/student/presentation/widgets/slivers/commanStudentSliverAppBar.dart';
import 'package:IntelliEd/widgets/clipperWidgetsAndScrollBehavior.dart';
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
        child: ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: CustomScrollView(
            controller: _scrollController,
            physics: AlwaysScrollableScrollPhysics(),
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
                    ClipPath(
                      clipper: CustomBehaviorPageDesign(),
                      child: Container(
                        width: size.width,
                        color: Color(0xffE8F7FF),
                        child: Column(
                          children: [
                            SizedBox(height: 50.0),
                            behaviourSummaryWidget(
                                'Summary', behaviorSummary, 0),
                            SizedBox(height: 10.0),
                            ClipPath(
                              clipper: CustomBehaviorPageDesign(),
                              child: Container(
                                color: Color(0xffAFFFD9),
                                child: Column(
                                  children: [
                                    SizedBox(height: 40.0),
                                    behaviourSummaryWidget('Recommendation',
                                        behaviorRecommendationForStudent, 1),
                                    SizedBox(height: 30.0),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget behaviourSummaryWidget(String heading, String subheading, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 27.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bullet + ' $heading',
            style: heading2.copyWith(
              color: index == 0 ? Color(0xFF1CAAFA) : Color(0xFF00C968),
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
