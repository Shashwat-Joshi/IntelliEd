import 'package:IntelliEd/model/commanModel.dart';
import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/users/student/presentation/widgets/slivers/academicSliverAppBar.dart';
import 'package:IntelliEd/users/student/presentation/widgets/timeTableDayNameWidget.dart';
import 'package:flutter/material.dart';

class StudentTimeTablePage extends StatefulWidget {
  @override
  _StudentTimeTablePageState createState() => _StudentTimeTablePageState();
}

class _StudentTimeTablePageState extends State<StudentTimeTablePage> {
  ScrollController _scrollController = ScrollController();
  ScrollController _weekDayScrollController;
  int selectedWeekDay;
  @override
  void initState() {
    super.initState();
    selectedWeekDay = weekDay;
    double scrollValue = calcScrollValue();
    _weekDayScrollController = ScrollController(
      initialScrollOffset: scrollValue,
    );
  }

  double calcScrollValue() {
    if (weekDay <= 3)
      return 0;
    else
      return 30.0 * 7;
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
              'Timetable',
              bigLoremText.substring(0, 80),
              'assets/student/images/timetable.png',
              Color(0xFFB0E3FF),
              analyticsFeatures[0].textColor,
              this.context,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xfff2f2f2),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.0),
                        Container(
                          child: size.width > 540.0
                              ? timeTableWidget()
                              : SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  controller: _weekDayScrollController,
                                  child: timeTableWidget(),
                                ),
                        ),
                        SizedBox(height: 10.0),
                        Divider(thickness: 1.0),
                        SizedBox(height: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            currentDate,
                            style: heading2.copyWith(
                              color: Color(0xFFACACAC),
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xfff2f2f2),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xfff2f2f2),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 5.0,
                      bottom: 20.0,
                    ),
                    child: Column(
                      children: [
                        for (int i = 0;
                            i < timeTableSample['result'].length;
                            i++)
                          Container(
                            height: 80.0,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: i == 0
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    )
                                  : i == timeTableSample['result'].length - 1
                                      ? BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                        )
                                      : BorderRadius.circular(0.0),
                            ),
                            margin: EdgeInsets.only(bottom: 1.5),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFB0E3FF),
                                        Color(0xFFB0E3FF).withOpacity(0.9),
                                      ],
                                    ),
                                    borderRadius: i == 0
                                        ? BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                          )
                                        : i ==
                                                timeTableSample['result']
                                                        .length -
                                                    1
                                            ? BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(20.0),
                                              )
                                            : BorderRadius.circular(0.0),
                                  ),
                                  width: 80.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        timeTableSample['result'][i]['initial'],
                                        style: subheading.copyWith(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        timeTableSample['result'][i]['final'],
                                        style: subheading.copyWith(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 15.0),
                                Container(
                                  width: 3.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: (timeTableSample['result'][i]
                                                ['isAcademic'] ==
                                            1)
                                        ? Color(0xff1CAAFA).withOpacity(0.8)
                                        : (timeTableSample['result'][i]
                                                    ['isAcademic'] ==
                                                0)
                                            ? Color(0xffaa4cfc).withOpacity(0.7)
                                            : Color(0xffE3AE01)
                                                .withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                SizedBox(width: 25.0),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      timeTableSample['result'][i]['subName'],
                                      style: heading2.copyWith(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    timeTableSample['result'][i]['subTeacher']
                                                .toString()
                                                .length !=
                                            0
                                        ? Text(
                                            timeTableSample['result'][i]
                                                ['subTeacher'],
                                            style: subheading.copyWith(
                                              fontSize: 12.0,
                                            ),
                                          )
                                        : Container(),
                                  ],
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

  Widget timeTableWidget() {
    return TimeTableDayNameWidget(
      currentWeekDay: weekDay,
      onTapWidget: (index) {
        setState(() {
          selectedWeekDay = index;
        });
      },
    );
  }
}
