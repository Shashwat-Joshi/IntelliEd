import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubmitAttendancePage extends StatefulWidget {
  @override
  _SubmitAttendancePageState createState() => _SubmitAttendancePageState();
}

class _SubmitAttendancePageState extends State<SubmitAttendancePage> {
  ScrollController _scrollController = ScrollController();
  bool selectAll = false;

  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  DateTime selectedDate = DateTime.now();

  List<int> result = [];

  @override
  void initState() {
    super.initState();
    studentNames.clear();
    // Later replace 50 with the studentNames list length
    for (int i = 0; i < 50; i++) {
      studentNames.add('Shashwat Joshi');
      result.add(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double widthForContainer = size.width - 72.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB0E3FF),
        title: Text(
          'Attendance',
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
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 26.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 26.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Date Selected',
                    style: heading2,
                  ),
                  Spacer(),
                  InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().year - 1),
                          lastDate: DateTime.now(),
                        );
                        setState(() {
                          day = selectedDate.day;
                          month = selectedDate.month;
                          year = selectedDate.year;
                        });
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "$day/${month < 10 ? '0$month' : '$month'}/$year",
                            style: heading1.copyWith(
                              fontSize: 16.0,
                              color: Color(0xff1CAAFA),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Icon(
                            Icons.calendar_today_rounded,
                            color: Color(0xff1CAAFA),
                            size: 20.0,
                          ),
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: size.height - 167.0,
              child: CupertinoScrollbar(
                controller: _scrollController,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectAll = !selectAll;
                            if (selectAll) {
                              result.fillRange(0, studentNames.length, 1);
                            } else {
                              result.fillRange(0, studentNames.length, 0);
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 24.0),
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: Color(0xffE8F7FF),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              selectAll
                                  ? Text(
                                      'Unselect all',
                                      style: heading1.copyWith(
                                        fontSize: 18.0,
                                        color: Color(0xff1CAAFA),
                                      ),
                                    )
                                  : Text(
                                      'Select all',
                                      style: heading1.copyWith(
                                        fontSize: 18.0,
                                        color: Color(0xff1CAAFA),
                                      ),
                                    ),
                              Container(
                                height: 20.0,
                                width: 20.0,
                                padding: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1.5,
                                    color: Color(0xffC4C4C4),
                                  ),
                                ),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: selectAll
                                        ? Color(0xff1CAAFA)
                                        : Colors.transparent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      for (int i = 0; i < studentNames.length; i++)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 26.0),
                          child: Column(
                            children: [
                              SizedBox(height: 12.0),
                              Container(
                                height: 21.0,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: widthForContainer * 0.07,
                                      child: (i + 1) > 9
                                          ? Text(
                                              "${i + 1}",
                                              style: heading1.copyWith(
                                                fontSize: 15.0,
                                                color: Color(0xff1CAAFA),
                                              ),
                                            )
                                          : Text(
                                              "0${i + 1}",
                                              style: heading1.copyWith(
                                                fontSize: 15.0,
                                                color: Color(0xff1CAAFA),
                                              ),
                                            ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Container(
                                      width: widthForContainer * 0.73,
                                      child: Text(
                                        studentNames[i],
                                        style: heading1.copyWith(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Container(
                                      width: widthForContainer * 0.20,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Checkbox(
                                          activeColor: Color(0xff00C968),
                                          value: result[i] == 0 ? false : true,
                                          onChanged: (val) {
                                            setState(() {
                                              result[i] =
                                                  (result[i] == 0) ? 1 : 0;
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(thickness: 1.0),
                            ],
                          ),
                        ),
                      SizedBox(height: 30.0),
                      Container(
                        child: Row(
                          children: [
                            SizedBox(width: 26.0),
                            Container(
                              height: 45.0,
                              width: size.width * 0.4 - 10.0 - 26.0,
                              child: FlatButton(
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    20.0,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancel',
                                  style: viewAllStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20.0),
                            Container(
                              width: size.width * 0.6 - 10.0 - 26.0,
                              height: 45.0,
                              child: FlatButton(
                                color: Color(0xff00C968),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    30.0,
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Submit',
                                  style: viewAllStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 26.0),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
