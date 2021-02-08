import 'package:IntelliEd/model/commanModel.dart';
import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/parent/model/parent.dart';
import 'package:IntelliEd/users/parent/presentation/widgets/slivers/commanSliverForParent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class ParentCalendarPage extends StatefulWidget {
  @override
  _ParentCalendarPageState createState() => _ParentCalendarPageState();
}

class _ParentCalendarPageState extends State<ParentCalendarPage> {
  ScrollController _scrollController = ScrollController();
  int isSelectedWeek;
  DateTime selectedDate;
  String currentMonth;

  @override
  void initState() {
    super.initState();
    currentMonth = monthNames[DateTime.now().month - 1];
    isSelectedWeek = getCurrentWeek();
  }

  getCurrentWeek() {
    int date = DateTime.now().day;
    if (date <= 7)
      return 1;
    else if (date > 7 && date <= 14)
      return 2;
    else if (date > 14 && date <= 21)
      return 3;
    else
      return 4;
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
            commanSliverAppBarForParent(
              size,
              'Calendar',
              'This calender displays the syllabus covered on a weekly basis',
              'assets/student/images/calendar.png',
              Color(0xFFB0E3FF),
              Color(0xFF1CAAFA),
              this.context,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: EdgeInsets.all(26.0),
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
                                i < calendarData['result'].length;
                                i++)
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 26.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      calendarData['result']
                                              .keys
                                              .toList()[i][0]
                                              .toString()
                                              .toUpperCase() +
                                          calendarData['result']
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
                                    Text(calendarData['result']
                                        .values
                                        .toList()[i]),
                                    SizedBox(height: 30.0),
                                  ],
                                ),
                              ),
                          ],
                        )
                      : Container(
                          height: size.height - 405.0,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
