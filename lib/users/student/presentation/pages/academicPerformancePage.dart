import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/users/student/presentation/widgets/AcademicsbarChart.dart';
import 'package:IntelliEd/users/student/presentation/widgets/academicSliverAppBar.dart';
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
    modelStudentAverageMarks.studentMarks.keys.forEach((key) {
      finalSubjects.add(key.toString());
    });
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
      body: Scrollbar(
        radius: Radius.circular(20.0),
        thickness: 4.0,
        controller: _scrollController,
        child: CustomScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          slivers: [
            academicsliverAppBar(
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
                    child: BarChartSample2(
                      studentAverageMarks: modelStudentAverageMarks,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 26.0),
                    height: 15.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 15.0,
                          width: 15.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff1CAAFA),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text('Your percentage', style: subheading),
                        SizedBox(width: 30.0),
                        Container(
                          height: 15.0,
                          width: 15.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff00C968),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text('Class Average', style: subheading),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 26.0 + 7.0),
                    child: Text(
                      'Subjects',
                      style: heading1.copyWith(fontSize: 24.0),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 26.0),
                    child: Wrap(
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
          width: size.width / 2 < 165 ? size.width / 2 : 165,
          child: FlatButton(
            onPressed: () {},
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
