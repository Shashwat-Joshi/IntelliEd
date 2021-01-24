import 'package:IntelliEd/model/commanModel.dart';
import 'package:IntelliEd/style/theme.dart';
import 'package:flutter/material.dart';

class TimeTableDayNameWidget extends StatefulWidget {
  final int currentWeekDay;
  final Function onTapWidget;
  TimeTableDayNameWidget({
    @required this.currentWeekDay,
    this.onTapWidget,
  });

  @override
  _TimeTableDayNameWidgetState createState() => _TimeTableDayNameWidgetState();
}

class _TimeTableDayNameWidgetState extends State<TimeTableDayNameWidget> {
  int selectedWeekDay = weekDay;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < weekDayName.length; i++)
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                selectedWeekDay = i;
              });
              widget.onTapWidget(i);
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: i == selectedWeekDay
                          ? Color(0xff00C968)
                          : Colors.transparent,
                    ),
                    height: 40.0,
                    width: 60.0,
                    child: Center(
                      child: Text(
                        weekDayName[i],
                        style: viewAllStyle.copyWith(
                          color: i == selectedWeekDay
                              ? Colors.white
                              : Color(0xFFACACAC),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  widget.currentWeekDay == i
                      ? Container(
                          height: 4,
                          width: 4,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff00C968),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
