import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/examData.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:IntelliEd/widgets/graphs/perExamGraphChart.dart';
import 'package:IntelliEd/widgets/graphs/perSubjectMainGraph.dart';
import 'package:IntelliEd/widgets/graphs/subjectWiseSliverAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentWiseSubjectWiseAcademicPage extends StatefulWidget {
  final int index;
  StudentWiseSubjectWiseAcademicPage({
    @required this.index,
  });
  @override
  _StudentWiseSubjectWiseAcademicPageState createState() =>
      _StudentWiseSubjectWiseAcademicPageState();
}

class _StudentWiseSubjectWiseAcademicPageState
    extends State<StudentWiseSubjectWiseAcademicPage> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> exams = getExamNames(studentWisefinalSubjects[widget.index]);

    return Scaffold(
      body: CupertinoScrollbar(
        radius: Radius.circular(20.0),
        thickness: 4.0,
        controller: _scrollController,
        child: CustomScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          slivers: [
            subjectWisecommanSliverAppBar(
              size,
              studentWisefinalSubjects[widget.index],
              studentWiseAnalyticsFeatures[0].imagePath,
              Color(0xFFB0E3FF),
              Color(0xFF1CAAFA),
              this.context,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 26.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 36.0),
                        Text(
                          'Performance',
                          style: heading2,
                        ),
                        SizedBox(height: 26.0),
                        Container(
                          height: 320.0,
                          width: size.width,
                          child: LineChartSample1(
                            studentMarks: getStudentAverageAndClassAverageMarks(
                                studentWisefinalSubjects[widget.index])[0],
                            classAverageMarks:
                                getStudentAverageAndClassAverageMarks(
                                    studentWisefinalSubjects[widget.index])[1],
                            examNames: getExamNames(
                                studentWisefinalSubjects[widget.index]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 19.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 26.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width,
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
                                        color: Color(0xffaa4cfc),
                                      ),
                                    ),
                                    Text('Class Average', style: subheading),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 19.0),
                        Text(
                          loremIpsum,
                          style: viewAllStyle.apply(
                            color: Color(0xFFACACAC),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        for (int i = 0; i < exams.length; i++)
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 26.0),
                                Text(
                                  exams[i],
                                  style: heading2,
                                ),
                                SizedBox(height: 26.0),
                                Container(
                                  height: 350.0,
                                  width: size.width,
                                  child: PerExamChartGraph(
                                    totalMarks: perExamData(
                                        studentWisefinalSubjects[widget.index],
                                        exams[i])[1],
                                    marksList: perExamData(
                                        studentWisefinalSubjects[widget.index],
                                        exams[i])[0],
                                  ),
                                ),
                                SizedBox(height: 19.0),
                                Text(
                                  loremIpsum,
                                  style: viewAllStyle.apply(
                                    color: Color(0xFFACACAC),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 20.0),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
