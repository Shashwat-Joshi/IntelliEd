import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/users/student/presentation/pages/subjectWiseAcademicPage.dart';
import 'package:IntelliEd/widgets/graphs/AcademicsbarChart.dart';
import 'package:IntelliEd/users/student/presentation/widgets/slivers/commanStudentSliverAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AcademicPerformance extends StatefulWidget {
  @override
  _AcademicPerformanceState createState() => _AcademicPerformanceState();
}

class _AcademicPerformanceState extends State<AcademicPerformance> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (finalSubjects.isEmpty) {
      modelStudentAverageMarks.studentMarks.keys.forEach((key) {
        finalSubjects.add(key.toString());
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CupertinoScrollbar(
        radius: Radius.circular(20.0),
        thickness: 4.0,
        controller: _scrollController,
        child: CustomScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          slivers: [
            commanSliverAppBarForStudent(
              size,
              analyticsFeatures[0].heading,
              analyticsFeatures[0].subHeading,
              analyticsFeatures[0].imagePath,
              Color(0xFFB0E3FF),
              analyticsFeatures[0].textColor,
              this.context,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.all(26.0),
                    height: 380.0,
                    width: size.width,
                    child: AcademicsBarGraph(
                      studentAverageMarks: modelStudentAverageMarks,
                      finalSubjects: finalSubjects,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 26.0),
                    height: 15.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10.0),
                                height: 15.0,
                                width: 15.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff1CAAFA),
                                ),
                              ),
                              Text('Your percentage', style: subheading),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10.0),
                                height: 15.0,
                                width: 15.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff00C968),
                                ),
                              ),
                              Text('Class Average', style: subheading),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 26.0 + 7.0),
                    child: Text(
                      'Subjects',
                      style: heading2,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 26.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: createSubjectCardsWidget(size),
                    ),
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> createSubjectCardsWidget(Size size) {
    List<Widget> finalList = [];
    for (int i = 0; i < finalSubjects.length; i++) {
      finalList.add(
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Color(0xFFB0E3FF),
          ),
          margin: EdgeInsets.all(7.0),
          height: 50.0,
          width: size.width / 2 - 40,
          child: FlatButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubjectWiseAcademicPage(
                    index: i,
                  ),
                ),
              );
            },
            child: Center(
              child: Text(
                finalSubjects[i],
                style: heading1.copyWith(
                  fontSize: 18.0,
                  color: Color(0xff1CAAFA),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return finalList;
  }
}
