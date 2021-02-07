import 'package:IntelliEd/model/commanModel.dart';
import 'package:IntelliEd/style/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AcademicsBarGraph extends StatefulWidget {
  final StudentAverageMarks studentAverageMarks;
  final List<String> finalSubjects;
  AcademicsBarGraph({
    @required this.studentAverageMarks,
    @required this.finalSubjects,
  });
  @override
  State<StatefulWidget> createState() => AcademicsBarGraphState();
}

class AcademicsBarGraphState extends State<AcademicsBarGraph> {
  final Color leftBarColor = const Color(0xff1CAAFA);
  final Color rightBarColor = const Color(0xff00C968);
  final double width = 7;

  List<BarChartGroupData> rawBarGroups = [];
  List<BarChartGroupData> showingBarGroups = [];
  int touchedGroupIndex;

  @override
  void initState() {
    super.initState();
    List<BarChartGroupData> items = [];

    for (int i = 0; i < widget.studentAverageMarks.studentMarks.length; i++) {
      String key = widget.finalSubjects.elementAt(i);
      items.add(makeGroupData(
          i,
          widget.studentAverageMarks.studentMarks[key][0],
          widget.studentAverageMarks.studentMarks[key][1]));
    }
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
          padding: const EdgeInsets.all(16),
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
                    'Your Score vs Average',
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
                            for (int i = 0;
                                i < widget.finalSubjects.length;
                                i++) {
                              if (value.toInt() == i) {
                                return (widget.finalSubjects[i]
                                            .toString()
                                            .length <=
                                        3)
                                    ? widget.finalSubjects[i].toString()
                                    : widget.finalSubjects[i]
                                        .toString()
                                        .substring(0, 3);
                              }
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

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 5,
      x: x,
      barRods: [
        BarChartRodData(
          y: y1,
          colors: [leftBarColor],
          width: width,
        ),
        BarChartRodData(
          y: y2,
          colors: [rightBarColor],
          width: width,
        ),
      ],
    );
  }
}
