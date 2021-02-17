import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/presentation/widgets/slivers/commanStudentSliverAppBar.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:IntelliEd/widgets/graphs/CoCurricularGraphs/coCurricularMainGraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentWiseProfessionalInterestPage extends StatefulWidget {
  @override
  _StudentWiseProfessionalInterestPageState createState() =>
      _StudentWiseProfessionalInterestPageState();
}

class _StudentWiseProfessionalInterestPageState
    extends State<StudentWiseProfessionalInterestPage> {
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
              'Professional Interests',
              'Here you may explore your field of interest with the ease of analysis.',
              'assets/student/images/calendar.png',
              Color(0xFFB0E3FF),
              Color(0xFF1CAAFA),
              this.context,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: 400.0 - 26.0,
                    width: size.width,
                    margin: EdgeInsets.symmetric(horizontal: 26.0),
                    child: MainCoCurricularMainGraph(
                      data: professionalInterestsMainPageData,
                      bgColor: Color(0xffE8F7FF),
                      size: size,
                    ),
                  ),
                  SizedBox(height: 26.0),
                  keyInterestsWidget(),
                  SizedBox(height: 16.0),
                  summaryWidget(
                      'Summary',
                      //TODO: Text Changed
                      "As per the analysis we have found that you have proficiency in physics. So we highly recommend you to keep working and have deep study of Astrophysics . You can come with great ideas and bring a positive change in the society."),
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
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bullet + ' $heading',
            style: heading2.copyWith(
              color: Colors.black54,
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

  Widget keyInterestsWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bullet + ' Key Interest',
            style: heading2.copyWith(
              color: Colors.black54,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 5.0),
          Wrap(
            children: [
              for (int i = 0; i < skills.length; i++)
                Container(
                  margin: EdgeInsets.all(5.0),
                  child: Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(
                        color: Color(0xff00C968),
                        width: 0.5,
                      ),
                    ),
                    padding: EdgeInsets.all(10.0),
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check,
                          color: Color(0xff00C968),
                          size: 18.0,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          skills[i],
                          style: TextStyle(
                            color: Color(0xff00C968),
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: Color(0xff00C968).withOpacity(0.2),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
