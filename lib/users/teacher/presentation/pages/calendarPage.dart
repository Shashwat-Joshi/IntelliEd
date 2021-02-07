import 'package:IntelliEd/model/commanModel.dart';
import 'package:IntelliEd/style/theme.dart';
// import 'package:IntelliEd/users/student/model/student.dart';
// import 'package:IntelliEd/users/student/presentation/widgets/slivers/commanStudentSliverAppBar.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:IntelliEd/users/teacher/presentation/widgets/slivers/commonSliverForTeacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import 'addDataToCalendar.dart';

class TeacherCalendarPage extends StatefulWidget {
  @override
  _TeacherCalendarPageState createState() => _TeacherCalendarPageState();
}

class _TeacherCalendarPageState extends State<TeacherCalendarPage> {
  ScrollController _scrollController = ScrollController();
  int isSelectedWeek;
  DateTime selectedDate;
  String currentMonth;

  String selectedClass = classData['main'];

  @override
  void initState() {
    super.initState();
    currentMonth = monthNames[DateTime.now().month - 1];
    isSelectedWeek = getCurrentWeek();
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
            commanSliverAppBarForTeacher(
              size,
              'Calendar',
              'This calender displays the syllabus covered on a weekly basis',
              'assets/student/images/calendar.png',
              Color(0xFFB0E3FF),
              Color(0xff1CAAFA),
              this.context,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      showOtherClassesBottomSheet(size);
                    },
                    child: Container(
                      margin: EdgeInsets.all(18.0),
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: Color(0xffE8F7FF),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Class',
                            style: heading1.copyWith(
                              fontSize: 18.0,
                              color: Color(0xff1CAAFA),
                            ),
                          ),
                          Container(
                            child: Text(
                              selectedClass,
                              style: heading1.copyWith(
                                fontSize: 18.0,
                                color: Color(0xff1CAAFA),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 26.0,
                      right: 26.0,
                      bottom: 26.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width / 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Week',
                                style: heading1.copyWith(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1CAAFA),
                                ),
                              ),
                              SizedBox(height: 15.0),
                              Row(
                                children: [
                                  for (int i = 1; i <= 4; i++)
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isSelectedWeek = i;
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        margin: (i == 2)
                                            ? EdgeInsets.symmetric(
                                                horizontal: 7.0)
                                            : (i == 3)
                                                ? EdgeInsets.only(right: 7.0)
                                                : EdgeInsets.all(0.0),
                                        height: 40.0,
                                        width: 40.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: (i == isSelectedWeek)
                                              ? Color(0xff00C968)
                                              : Color(0xffD2D2D2),
                                        ),
                                        child: Center(
                                          child: Text(
                                            i.toString(),
                                            style: viewAllStyle.copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Month',
                                style: heading1.copyWith(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1CAAFA),
                                ),
                              ),
                              SizedBox(height: 15.0),
                              GestureDetector(
                                onTap: () {
                                  // TODO: This is not the right way change this later
                                  showMonthPicker(
                                    context: context,
                                    firstDate: DateTime(
                                      DateTime.now().year - 1,
                                      DateTime.april,
                                    ),
                                    lastDate: DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                    ),
                                    initialDate: DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                    ),
                                  ).then((date) {
                                    if (date != null) {
                                      setState(() {
                                        selectedDate = date;
                                      });
                                    }

                                    currentMonth =
                                        monthNames[selectedDate.month - 1];
                                    print(currentMonth);
                                  });
                                },
                                child: Container(
                                  height: 40.0,
                                  padding: EdgeInsets.only(
                                    top: 7.0,
                                    bottom: 6.0,
                                    left: 20.0,
                                    right: 15.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xff00C968),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            currentMonth,
                                            style: heading1.copyWith(
                                              fontSize: 18.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 10.0),
                                          Icon(
                                            Icons.calendar_today_outlined,
                                            size: 17.0,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  isSelectedWeek == 2 && currentMonth == "Feb"
                      ? Column(
                          children: [
                            for (int i = 0;
                                i < calendarDataForTeacher['result'].length;
                                i++)
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 26.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      calendarDataForTeacher['result']
                                              .keys
                                              .toList()[i][0]
                                              .toString()
                                              .toUpperCase() +
                                          calendarDataForTeacher['result']
                                              .keys
                                              .toList()[i]
                                              .toString()
                                              .substring(1),
                                      style: heading1.copyWith(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1CAAFA),
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(calendarDataForTeacher['result']
                                        .values
                                        .toList()[i]),
                                    SizedBox(height: 30.0),
                                  ],
                                ),
                              ),
                          ],
                        )
                      : Container(
                          height: size.height - 500.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: size.width * 0.4,
                                child: Image(
                                  image: AssetImage(
                                    'assets/calendarNotFound.png',
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                'No data found',
                                style: heading1,
                              )
                            ],
                          ),
                        ),
                  SizedBox(height: 50.0),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xff1CAAFA),
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => AddDataToCalendarPage(
                selectedClass: selectedClass,
              ),
            ),
          );
        },
      ),
    );
  }

  showOtherClassesBottomSheet(Size size) {
    String locallySelectedClass = selectedClass;
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        isScrollControlled: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setBottomSheetState) {
            return Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 26.0,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 30.0),
                        Text(
                          'Your other classes',
                          style: heading2,
                        ),
                        SizedBox(height: 20.0),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setBottomSheetState(() {
                                  locallySelectedClass = classData['main'];
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: (classData['main'] ==
                                          locallySelectedClass)
                                      ? Color(0xff00C968).withOpacity(0.3)
                                      : Color(0xFFB0E3FF),
                                ),
                                margin: EdgeInsets.all(7.0),
                                width: (size.width / 2) - 52.0,
                                height: 50.0,
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        classData['main'],
                                        style: heading1.copyWith(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                          color: (classData['main'] ==
                                                  locallySelectedClass)
                                              ? Color(0xff00C968)
                                              : Color(0xff1CAAFA),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            for (int i = 0; i < classData['other'].length; i++)
                              GestureDetector(
                                onTap: () {
                                  setBottomSheetState(() {
                                    locallySelectedClass =
                                        classData['other'][i];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: (classData['other'][i] ==
                                            locallySelectedClass)
                                        ? Color(0xff00C968).withOpacity(0.3)
                                        : Color(0xFFB0E3FF),
                                  ),
                                  margin: EdgeInsets.all(7.0),
                                  width: (size.width / 2) - 52.0,
                                  height: 50.0,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          classData['other'][i],
                                          style: heading1.copyWith(
                                            fontSize: 18.0,
                                            color: (classData['other'][i] ==
                                                    locallySelectedClass)
                                                ? Color(0xff00C968)
                                                : Color(0xff1CAAFA),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 26.0,
                  top: 23.0,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      setState(() {
                        selectedClass = locallySelectedClass;
                      });
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.check,
                      color: Color(0xff00C968),
                    ),
                  ),
                ),
              ],
            );
          });
        });
  }
}
