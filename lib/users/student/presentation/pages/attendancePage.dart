import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/widgets/graphs/attendanceGraphChart.dart';
import 'package:IntelliEd/widgets/graphs/previousAttendanceGraph.dart';
import 'package:IntelliEd/users/student/presentation/widgets/slivers/commanStudentSliverAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentAttendancePage extends StatefulWidget {
  final double studentAverage, classAverage;
  final List<String> months;
  final List<double> monthWiseAttendance;

  StudentAttendancePage({
    @required this.studentAverage,
    @required this.classAverage,
    @required this.months,
    @required this.monthWiseAttendance,
  });

  @override
  _StudentAttendancePageState createState() => _StudentAttendancePageState();
}

class _StudentAttendancePageState extends State<StudentAttendancePage> {
  ScrollController _scrollController = ScrollController();
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
              analyticsFeatures[3].heading,
              analyticsFeatures[3].subHeading,
              analyticsFeatures[3].imagePath,
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
                    child: AttendanceGraphChart(
                      student: widget.studentAverage,
                      classAverage: widget.classAverage,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 26.0),
                    height: 15.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
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
                  SizedBox(height: 30.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 26.0 + 7.0),
                    child: Text(
                      'Your previous attendance',
                      style: heading2,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(26.0),
                    height: 320.0,
                    width: size.width,
                    child: PreviousAttendanceGraph(
                      months: widget.months,
                      monthWiseAttendance: widget.monthWiseAttendance,
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
