import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/users/student/presentation/widgets/slivers/commanStudentSliverAppBar.dart';
import 'package:IntelliEd/widgets/graphs/CoCurricularGraphs/coCurricularMainGraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfessionalInterestPage extends StatefulWidget {
  @override
  _ProfessionalInterestPageState createState() =>
      _ProfessionalInterestPageState();
}

class _ProfessionalInterestPageState extends State<ProfessionalInterestPage> {
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
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Augue a ut nisl blandit.',
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
                    margin: EdgeInsets.all(26.0),
                    child: MainCoCurricularMainGraph(
                      data: professionalInterestsMainPageData,
                      bgColor: Color(0xffE8F7FF),
                      size: size,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  summaryWidget('Summary', bigLoremText),
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
}
