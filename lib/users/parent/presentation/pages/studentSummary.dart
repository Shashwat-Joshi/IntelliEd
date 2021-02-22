import 'package:IntelliEd/model/analyticsLocalDB.dart';
import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/parent/model/parent.dart';
import 'package:IntelliEd/users/parent/presentation/widgets/slivers/commanSliverForParent.dart';
import 'package:IntelliEd/widgets/graphs/CoCurricularGraphs/coCurricularMainGraph.dart';
import 'package:IntelliEd/widgets/graphs/behaviourGraphChart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StudentSummaryForParent extends StatefulWidget {
  @override
  _StudentSummaryForParentState createState() =>
      _StudentSummaryForParentState();
}

class _StudentSummaryForParentState extends State<StudentSummaryForParent> {
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
            commanSliverAppBarForParent(
              size,
              'Summary',
              'Here is all you need to know about his progress in academic and extra curricular activities',
              'assets/student/images/calendar.png',
              Color(0xFFB0E3FF),
              Color(0xFF1CAAFA),
              this.context,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: 400.0,
                    width: size.width,
                    margin: EdgeInsets.symmetric(horizontal: 26.0),
                    child: MainCoCurricularMainGraph(
                      data: professionalInterestsMainPageDataForParent,
                      bgColor: Color(0xffE8F7FF),
                      size: size,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Divider(thickness: 1.0),
                  SizedBox(height: 20.0),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 40.0),
                          decoration: BoxDecoration(
                            color: Color(0xffE8F7FF),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 26.0),
                          child: Column(
                            children: [
                              SizedBox(height: 26.0),
                              summaryWidget1(
                                'Qualities',
                                qualitiesSummary,
                              ),
                              SizedBox(height: 20.0),
                              Divider(thickness: 1.2),
                              SizedBox(height: 20.0),
                              summaryWidget1(
                                'Professional Interest',
                                professionalInterestSummary,
                              ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          margin: EdgeInsets.only(left: 40.0),
                          decoration: BoxDecoration(
                            color: Color(0xffAFFFD9),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              bottomLeft: Radius.circular(50.0),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 26.0),
                          child: Column(
                            children: [
                              SizedBox(height: 20.0),
                              summaryWidget2(
                                'Behaviour',
                                behaviorSummary,
                              ),
                              SizedBox(height: 20.0),
                              Divider(thickness: 1.2),
                              SizedBox(height: 20.0),
                              summaryWidget2(
                                'Academics',
                                academicsSummary,
                              ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  mainFeaturesCard(),
                  SizedBox(height: 20.0),
                  Container(
                    width: size.width,
                    child: Text(
                      '© Copyright | Team intelli-ed | 2020',
                      style: subheading.copyWith(
                        color: Color(0xFFA2A2A2),
                        fontSize: 13.0,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
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

  Widget summaryWidget(String heading, String subheading) {
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

  Widget mainFeaturesCard() {
    return Container(
      margin: EdgeInsets.only(right: 40.0),
      decoration: BoxDecoration(
        color: Color(0xffFFF2CA),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 26.0),
      child: Column(
        children: [
          SizedBox(height: 30.0),
          summaryWidget3(
            'Learning Style',
            learningStyleSummary,
          ),
          SizedBox(height: 20.0),
          Divider(thickness: 1.2),
          SizedBox(height: 20.0),
          summaryWidget3(
            'Performance Projection',
            performanceProjectionSummary,
          ),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget summaryWidget1(String heading, String subheading) {
    return Container(
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

  Widget summaryWidget2(String heading, String subheading) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bullet + ' $heading',
            style: heading2.copyWith(
              color: Color(0xFF00C968),
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

  Widget summaryWidget3(String heading, String subheading) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bullet + ' $heading',
            style: heading2.copyWith(
              color: Color(0xFFE3AE01),
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
