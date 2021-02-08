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
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Divider(thickness: 1.2),
                        SizedBox(height: 20.0),
                        summaryWidget(
                            'Summary',
                            //Todo: Text Changed
                            "As per the analysis we have found that you have worked really hard to achieve good grades and came up with a nice working plan. So we highly recommend you to follow the same in the upcoming semester. You will surely come up with better results in the coming exams also."),
                        SizedBox(height: 20.0),
                        Divider(thickness: 1.2),
                        SizedBox(height: 20.0),
                        summaryWidget(
                          'Qualities',
                          "You posses great interpersonal skills. You are doing great with your  academics as well. Maintain a good balance and keep growing.And do remember hardwork pays off.",
                        ),
                        SizedBox(height: 20.0),
                        Divider(thickness: 1.2),
                        SizedBox(height: 20.0),
                        summaryWidget(
                          'Professional Interest',
                          "As per the analysis we have found that you have proficiency in science and technology. So we highly recommend you to keep working. You can come with great ideas and bring a positive change in the society.",
                        ),
                        SizedBox(height: 20.0),
                        Divider(thickness: 1.2),
                        SizedBox(height: 20.0),
                        summaryWidget(
                          'Behaviour',
                          "As per the analysis we have found that you are well mannered. So we highly recommend you to keep working on your interpersonal skills. It is a never ending learning process.",
                        ),
                        SizedBox(height: 20.0),
                        Divider(thickness: 1.2),
                        SizedBox(height: 20.0),
                        summaryWidget(
                          'Academics',
                          "As per the analysis we have found that you have worked really hard to achieve good grades and came up with a nice working plan. So we highly recommend you to follow the same in the upcoming semester. You will surely come up with better results in the coming exams also.",
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
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
}
