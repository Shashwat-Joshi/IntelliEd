import 'package:IntelliEd/model/commanModel.dart';
import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:flutter/material.dart';

class DonutIndicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const DonutIndicator({
    Key key,
    this.color,
    this.text,
    this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Container(
          child: Text(
            text,
            style: subheading.copyWith(
              color: Color(0xff7589a2),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

Widget donutIndicatorWidgets() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (int i = 0; i < coCurricularDonut1Data.length - 2; i++)
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  DonutIndicator(
                    color: colorPalette[i],
                    text: coCurricularDonut1Data.keys.toList()[i].toString(),
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
      SizedBox(width: 20.0),
      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (int i = coCurricularDonut1Data.length - 2;
              i < coCurricularDonut1Data.length;
              i++)
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  DonutIndicator(
                    color: colorPalette[i],
                    text: coCurricularDonut1Data.keys.toList()[i].toString(),
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
    ],
  );
}

Widget pieIndicatorWidgets() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (int i = 0; i < coCurricularPieNo2Data.length - 2; i++)
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  DonutIndicator(
                    color: colorPalette[i],
                    text: coCurricularPieNo2Data.keys.toList()[i].toString(),
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
      SizedBox(width: 20.0),
      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (int i = coCurricularPieNo2Data.length - 2;
              i < coCurricularPieNo2Data.length;
              i++)
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  DonutIndicator(
                    color: colorPalette[i],
                    text: coCurricularPieNo2Data.keys.toList()[i].toString(),
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
    ],
  );
}
