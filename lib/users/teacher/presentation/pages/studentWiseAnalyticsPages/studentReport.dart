import 'package:IntelliEd/model/analyticsLocalDB.dart';
import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/examData.dart';
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
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  String bullet = "\u2022 ";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldState,
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
                                currentSelectedStudentId == 2
                                    ? "As per the analysis we have found that your your behaviour towards your peers and other faculties is inappropriate. So we highly recommend you to keep working on your interpersonal skills. It is a never ending learning process."
                                    : behaviorSummary,
                                currentSelectedStudentId == 2 ? true : false,
                              ),
                              SizedBox(height: 20.0),
                              Divider(thickness: 1.2),
                              SizedBox(height: 20.0),
                              summaryWidget2(
                                'Academics',
                                academicsSummary,
                                false,
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
            learningStyleSummary,
            false,
          ),
          SizedBox(height: 20.0),
          Divider(thickness: 1.2),
          SizedBox(height: 20.0),
          summaryWidget3(
            'Performance\n    Projection',
            currentSelectedStudentId == 2
                ? "We have checked your overall response of the quiz and other responses and gathered that your academic performance is not going pretty well and also you need to focus on extra co-curricular activities."
                : performanceProjectionSummary,
            currentSelectedStudentId == 2 ? true : false,
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

  Widget summaryWidget2(String heading, String subheading, bool showConcern) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                bullet + ' $heading',
                style: heading2.copyWith(
                  color: Color(0xFF00C968),
                  fontSize: 20.0,
                ),
              ),
              SizedBox(width: 10.0),
              showConcern
                  ? InkWell(
                      onTap: () {
                        _scaffoldState.currentState.showSnackBar(
                          SnackBar(
                            action: SnackBarAction(
                              label: 'Ok',
                              textColor: Colors.white,
                              onPressed: () {},
                            ),
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            content: Text(
                              'Note: Please look into this! We found something unusual',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.info,
                        color: Colors.redAccent,
                      ),
                    )
                  : Container(),
            ],
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

  Widget summaryWidget3(String heading, String subheading, bool showConcern) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                bullet + ' $heading',
                style: heading2.copyWith(
                  color: Color(0xFFE3AE01),
                  fontSize: 20.0,
                ),
              ),
              SizedBox(width: 20.0),
              showConcern
                  ? InkWell(
                      onTap: () {
                        _scaffoldState.currentState.showSnackBar(
                          SnackBar(
                            action: SnackBarAction(
                              label: 'Ok',
                              onPressed: () {},
                            ),
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            content: Text(
                              'Note: Please look into this! We found something unusual',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.info,
                        color: Colors.redAccent,
                      ),
                    )
                  : Container(),
            ],
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
