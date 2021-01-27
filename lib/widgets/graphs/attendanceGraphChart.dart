import 'package:IntelliEd/style/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AttendanceGraphChart extends StatefulWidget {
  final double classAverage, student;
  AttendanceGraphChart({
    @required this.student,
    @required this.classAverage,
  });
  @override
  State<StatefulWidget> createState() => AttendanceGraphChartState();
}

class AttendanceGraphChartState extends State<AttendanceGraphChart> {
  final Color leftBarColor = const Color(0xff1CAAFA);
  final Color rightBarColor = const Color(0xff00C968);
  final double width = 30;

  List<BarChartGroupData> rawBarGroups = [];
  List<BarChartGroupData> showingBarGroups = [];
  int touchedGroupIndex;

  @override
  void initState() {
    super.initState();
    List<BarChartGroupData> items = [];

    items.add(
      makeGroupData(0, widget.student),
    );

    items.add(
      makeGroupData(1, widget.classAverage),
    );
    rawBarGroups = items;
    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: const Color(0xffE8F7FF),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Your attendance vs Average',
                    style: subheading.copyWith(
                        color: Color(0xff1CAAFA), fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 38,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.center,
                      groupsSpace: 120,
                      maxY: 101,
                      barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                              tooltipBgColor: Colors.white,
                              getTooltipItem: (
                                BarChartGroupData group,
                                int groupIndex,
                                BarChartRodData rod,
                                int rodIndex,
                              ) {
                                return BarTooltipItem(
                                  rod.y.toString(),
                                  TextStyle(
                                    color: Color(0xFF1CAAFA),
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }),
                          touchCallback: (response) {
                            if (response.spot == null) {
                              setState(() {
                                touchedGroupIndex = -1;
                                showingBarGroups = List.of(rawBarGroups);
                              });
                              return;
                            }

                            touchedGroupIndex =
                                response.spot.touchedBarGroupIndex;
                          }),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                          showTitles: true,
                          getTextStyles: (value) => subheading.copyWith(
                            color: Color(0xff7589a2),
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                          ),
                          margin: 20,
                          getTitles: (double value) {
                            if (value == 0) {
                              return 'Your Attendance';
                            } else if (value == 1) {
                              return 'Class Average';
                            }
                            return '';
                          },
                        ),
                        leftTitles: SideTitles(
                          showTitles: true,
                          getTextStyles: (value) => subheading.copyWith(
                            color: Color(0xff7589a2),
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                          ),
                          margin: 32,
                          reservedSize: 14,
                          getTitles: (value) {
                            if (value == 0) {
                              return '0';
                            } else if (value == 20) {
                              return '20';
                            } else if (value == 40) {
                              return '40';
                            } else if (value == 60) {
                              return '60';
                            } else if (value == 80) {
                              return '80';
                            } else if (value == 100) {
                              return '100';
                            } else {
                              return '';
                            }
                          },
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: showingBarGroups,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1) {
    return BarChartGroupData(
      barsSpace: 0,
      x: x,
      barRods: [
        BarChartRodData(
          y: y1,
          colors: x == 0 ? [leftBarColor] : [rightBarColor],
          width: width,
        ),
      ],
    );
  }
}
