import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/parent/model/parent.dart';
import 'package:IntelliEd/users/student/presentation/widgets/slivers/commanStudentSliverAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourReportPage extends StatefulWidget {
  @override
  _YourReportPageState createState() => _YourReportPageState();
}

class _YourReportPageState extends State<YourReportPage> {
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
              'My Report',
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Augue a ut nisl blandit.',
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
                    decoration: BoxDecoration(
                      color: Color(0xffE8F7FF),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 26.0),
                    padding:
                        EdgeInsets.symmetric(vertical: 26.0, horizontal: 26.0),
                    child: summaryWidget(
                      'Qualities',
                      "You posses great interpersonal skills. You are doing great with your  academics as well. Maintain a good balance and keep growing.And do remember hardwork pays off.",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 26.0),
                    child: Column(
                      children: [
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
