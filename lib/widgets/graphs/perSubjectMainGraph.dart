import 'package:IntelliEd/style/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample1 extends StatefulWidget {
  final List studentMarks, classAverageMarks;
  final List<String> examNames;
  LineChartSample1({
    @required this.studentMarks,
    @required this.classAverageMarks,
    @required this.examNames,
  });
  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        padding: EdgeInsets.only(right: 20.0, left: 5.0, bottom: 5.0, top: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xffE8F7FF),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Your Score vs Average',
                  style: subheading.copyWith(
                      color: Color(0xff1CAAFA), fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 37,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                    child: LineChart(
                      sampleData1(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.white.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      minY: 0.0,
      maxY: 100.0,
      minX: 0.0,
      maxX: widget.examNames.length.toDouble() - 1,
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => subheading.copyWith(
            color: Color(0xff7589a2),
            fontWeight: FontWeight.w900,
            fontSize: 14,
          ),
          margin: 10,
          getTitles: (value) {
            for (int i = 0; i < widget.examNames.length; i++) {
              if (value.toInt() == i) {
                return widget.examNames[i];
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
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0';
              case 20:
                return '20';
              case 40:
                return '40';
              case 60:
                return '60';
              case 80:
                return '80';
              case 100:
                return '100';
            }
            return '';
          },
          margin: 50,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData classAverageLine = LineChartBarData(
      spots: [
        for (int i = 0; i < widget.classAverageMarks.length; i++)
          FlSpot(i.toDouble(), widget.classAverageMarks[i].toDouble()),
      ],
      isCurved: false,
      colors: [
        const Color(0xffaa4cfc),
      ],
      barWidth: 5,
      isStrokeCapRound: false,
      dotData: FlDotData(
        show: true,
      ),
      belowBarData: BarAreaData(
        show: true,
        colors: [
          Color(0xffaa4cfc).withOpacity(0.3),
        ],
      ),
    );
    final LineChartBarData studentMarksLine = LineChartBarData(
      spots: [
        for (int i = 0; i < widget.studentMarks.length; i++)
          FlSpot(i.toDouble(), widget.studentMarks[i].toDouble()),
      ],
      isCurved: false,
      colors: [
        const Color(0xff1CAAFA),
      ],
      barWidth: 5,
      isStrokeCapRound: false,
      dotData: FlDotData(
        show: true,
      ),
      belowBarData: BarAreaData(
        show: true,
        colors: [
          const Color(0xff1CAAFA).withOpacity(0.3),
        ],
      ),
    );

    return [
      classAverageLine,
      studentMarksLine,
    ];
  }
}
