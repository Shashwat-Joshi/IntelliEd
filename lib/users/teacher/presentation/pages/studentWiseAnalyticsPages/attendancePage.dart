import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:IntelliEd/widgets/graphs/attendanceGraphChart.dart';
import 'package:IntelliEd/widgets/graphs/previousAttendanceGraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentWiseAttendancePage extends StatefulWidget {
  @override
  _StudentWiseAttendancePageState createState() =>
      _StudentWiseAttendancePageState();
}

class _StudentWiseAttendancePageState extends State<StudentWiseAttendancePage> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB0E3FF),
        title: Text(
          '$currentSelectedStudent',
          style: TextStyle(
            color: Color(0xff1CAAFA),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      ),
      body: CupertinoScrollbar(
        radius: Radius.circular(20.0),
        thickness: 4.0,
        controller: _scrollController,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 26.0 + 7.0),
                child: Text(
                  'Average Attendance',
                  style: heading2,
                ),
              ),
              Container(
                margin: EdgeInsets.all(26.0),
                height: 380.0,
                width: size.width,
                child: AttendanceGraphChart(
                  student: perStudentAttendanceData['studentAverage'],
                  classAverage: perStudentAttendanceData['classAverage'],
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
                  months: getPreviousAttendanceData().keys.toList(),
                  monthWiseAttendance:
                      getPreviousAttendanceData().values.toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Container(
//                   margin: EdgeInsets.all(26.0),
//                   height: 380.0,
//                   width: size.width,
//                   child: AttendanceGraphChart(
//                     student: perStudentAttendanceData['studentAverage'],
//                     classAverage: perStudentAttendanceData['classAverage'],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 26.0),
//                   height: 15.0,
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                         child: Row(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(right: 10.0),
//                               height: 15.0,
//                               width: 15.0,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Color(0xff1CAAFA),
//                               ),
//                             ),
//                             Text('Your percentage', style: subheading),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: Row(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(right: 10.0),
//                               height: 15.0,
//                               width: 15.0,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Color(0xff00C968),
//                               ),
//                             ),
//                             Text('Class Average', style: subheading),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 30.0),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 26.0 + 7.0),
//                   child: Text(
//                     'Your previous attendance',
//                     style: heading2,
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(26.0),
//                   height: 320.0,
//                   width: size.width,
//                   child: PreviousAttendanceGraph(
//                     months: getPreviousAttendanceData().keys.toList(),
//                     monthWiseAttendance:
//                         getPreviousAttendanceData().values.toList(),
//                   ),
//                 ),
