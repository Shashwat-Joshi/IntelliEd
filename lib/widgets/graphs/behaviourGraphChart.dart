import 'package:IntelliEd/style/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BehaviourGraph extends StatefulWidget {
  final List months;
  final List score;

  BehaviourGraph({
    @required this.months,
    @required this.score,
  });
  @override
  State<StatefulWidget> createState() => BehaviourGraphState();
}

class BehaviourGraphState extends State<BehaviourGraph> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        padding: EdgeInsets.all(12.0),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Your Behavioral Score',
                      style: subheading.copyWith(
                          color: Color(0xff1CAAFA), fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 38),
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
      maxX: widget.months.length.toDouble() - 1,
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
            for (int i = 0; i < widget.months.length; i++) {
              if (value.toInt() == i) {
                return widget.months[i];
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
          margin: 25,
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
        for (int i = 0; i < widget.score.length; i++)
          FlSpot(
            i.toDouble(),
            widget.score[i].toDouble(),
          ),
      ],
      isCurved: false,
      colors: [
        const Color(0xFF1CAAFA),
      ],
      barWidth: 5,
      isStrokeCapRound: false,
      dotData: FlDotData(
        show: true,
      ),
      belowBarData: BarAreaData(
        show: true,
        colors: [
          Color(0xFF1CAAFA).withOpacity(0.2),
        ],
      ),
    );

    return [
      classAverageLine,
    ];
  }
}
