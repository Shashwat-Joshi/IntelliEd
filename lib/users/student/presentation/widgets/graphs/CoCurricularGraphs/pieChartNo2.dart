import 'package:IntelliEd/users/student/model/student.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'indicators/indicatorForDonut.dart';

class PieChartNo2 extends StatefulWidget {
  final Map<String, int> data;

  const PieChartNo2({@required this.data});
  @override
  _PieChartNo2State createState() => _PieChartNo2State();
}

class _PieChartNo2State extends State<PieChartNo2> {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 0.0,
        color: Color(0xffE8F7FF),
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData:
                          PieTouchData(touchCallback: (pieTouchResponse) {
                        setState(() {
                          if (pieTouchResponse.touchInput is FlLongPressEnd ||
                              pieTouchResponse.touchInput is FlPanEnd) {
                            touchedIndex = -1;
                          } else {
                            touchedIndex = pieTouchResponse.touchedSectionIndex;
                          }
                        });
                      }),
                      startDegreeOffset: 180,
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 12,
                      centerSpaceRadius: 0,
                      sections: showingSections()),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (int i = 0; i < widget.data.length; i++)
                  Container(
                    child: Column(
                      children: [
                        DonutIndicator(
                          color: colorPalette[i],
                          text: widget.data.keys.toList()[i].toString(),
                          isSquare: false,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      4,
      (index) {
        final isTouched = index == touchedIndex;
        final double opacity = isTouched ? 1 : 0.6;
        for (int i = 0; i < widget.data.length; i++) {
          if (i == index) {
            return PieChartSectionData(
              color: colorPalette[i].withOpacity(opacity),
              value: widget.data.values.toList()[i].toDouble(),
              title: '',
              radius: 80,
              titleStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xff044d7c),
              ),
              titlePositionPercentageOffset: 0.55,
            );
          }
        }
        return null;
      },
    );
  }
}
