import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/users/student/presentation/widgets/graphs/perExamGraphChart.dart';
import 'package:IntelliEd/users/student/presentation/widgets/graphs/perSubjectMainGraph.dart';
import 'package:IntelliEd/users/student/presentation/widgets/slivers/subjectWiseSliverAppBar.dart';
import 'package:flutter/material.dart';

class SubjectWiseAcademicPage extends StatefulWidget {
  final int index;
  SubjectWiseAcademicPage({
    @required this.index,
  });
  @override
  _SubjectWiseAcademicPageState createState() =>
      _SubjectWiseAcademicPageState();
}

class _SubjectWiseAcademicPageState extends State<SubjectWiseAcademicPage> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> exams = getExamNames(finalSubjects[widget.index]);
    double height = 550.0 + (exams.length * 490.0);

    return Scaffold(
      body: Scrollbar(
        radius: Radius.circular(20.0),
        thickness: 4.0,
        controller: _scrollController,
        child: CustomScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          slivers: [
            subjectWiseAcademicsliverAppBar(
              size,
              finalSubjects[widget.index],
              analyticsFeatures[0].imagePath,
              Color(0xFFB0E3FF),
              analyticsFeatures[0].textColor,
              this.context,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 26.0,
                    ),
                    height: height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 36.0),
                        Text(
                          'Your performance',
                          style: heading2,
                        ),
                        SizedBox(height: 26.0),
                        Container(
                          height: 320.0,
                          width: size.width,
                          child: LineChartSample1(
                            studentMarks: getStudentAverageAndClassAverageMarks(
                                finalSubjects[widget.index])[0],
                            classAverageMarks:
                                getStudentAverageAndClassAverageMarks(
                                    finalSubjects[widget.index])[1],
                            examNames:
                                getExamNames(finalSubjects[widget.index]),
                          ),
                        ),
                        SizedBox(height: 19.0),
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
                                        finalSubjects[widget.index],
                                        exams[i])[1],
                                    marksList: perExamData(
                                        finalSubjects[widget.index],
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
