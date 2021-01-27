import 'package:IntelliEd/style/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PerExamChartGraph extends StatefulWidget {
  final int totalMarks;
  final List<int> marksList;

  PerExamChartGraph({
    @required this.totalMarks,
    @required this.marksList,
  });
  @override
  State<StatefulWidget> createState() => PerExamChartGraphState();
}

class PerExamChartGraphState extends State<PerExamChartGraph> {
  final Color leftBarColor = const Color(0xff1CAAFA);
  final Color rightBarColor = const Color(0xff00C968);
  final double width = 7;

  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex;

  @override
  void initState() {
    super.initState();
    List<BarChartGroupData> items = [];

    for (int i = 0; i < widget.marksList.length; i++) {
      items.add(
        makeGroupData(
          i,
          widget.marksList[i].toDouble(),
        ),
      );
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
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    width: 38,
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
                      maxY: widget.totalMarks + 1.0,
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
                            for (int i = 0; i < widget.marksList.length; i++) {
                              if (value.toInt() == i) {
                                if (i == 0) {
                                  return "Your\nMarks";
                                } else {
                                  return String.fromCharCode(64 + i);
                                }
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
                            if (value % 10 == 0) {
                              return value.toInt().toString();
                            }
                            return '';
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
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          y: y1,
          colors: [leftBarColor],
          width: width,
        ),
      ],
    );
  }
}
