import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:IntelliEd/users/teacher/presentation/widgets/slivers/commonSliverForTeacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentWiseReportPage extends StatefulWidget {
  @override
  _StudentWiseReportPageState createState() => _StudentWiseReportPageState();
}

class _StudentWiseReportPageState extends State<StudentWiseReportPage> {
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
              'My Report',
              studentWiseAnalyticsFeatures[5].subHeading,
              'assets/student/images/calendar.png',
              Color(0xFFB0E3FF),
              Color(0xFF1CAAFA),
              this.context,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 30.0),
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
                                "You posses great interpersonal skills. You are doing great with your  academics as well. Maintain a good balance and keep growing.And do remember hardwork pays off.",
                              ),
                              SizedBox(height: 20.0),
                              Divider(thickness: 1.2),
                              SizedBox(height: 20.0),
                              summaryWidget1(
                                'Professional Interest',
                                "As per the analysis we have found that you have proficiency in science and technology. So we highly recommend you to keep working. You can come with great ideas and bring a positive change in the society.",
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
                                "As per the analysis we have found that you are well mannered. So we highly recommend you to keep working on your interpersonal skills. It is a never ending learning process.",
                              ),
                              SizedBox(height: 20.0),
                              Divider(thickness: 1.2),
                              SizedBox(height: 20.0),
                              summaryWidget2(
                                'Academics',
                                "As per the analysis we have found that you have worked really hard to achieve good grades and came up with a nice working plan. So we highly recommend you to follow the same in the upcoming semester. You will surely come up with better results in the coming exams also.",
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
            "As per the analysis we have found that you are an all rounder student. You are doing great in Mathematics and physics and we really appreciate your efforts. You are also a good sports person. We want you to make a schedule and give required attention to specific tasks.",
          ),
          SizedBox(height: 20.0),
          Divider(thickness: 1.2),
          SizedBox(height: 20.0),
          summaryWidget3(
            'Performance Projection',
            "As per the analysis we have found that you are an all rounder student. You are doing great in Mathematics and physics and we really appreciate your efforts. You are also a good sports person. We want you to make a schedule and give required attention to specific tasks.",
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
