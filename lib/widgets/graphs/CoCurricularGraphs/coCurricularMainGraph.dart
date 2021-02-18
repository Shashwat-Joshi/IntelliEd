import 'package:IntelliEd/style/theme.dart';
import 'package:flutter/material.dart';

class MainCoCurricularMainGraph extends StatefulWidget {
  final Map<String, double> data;
  final Color bgColor;
  final Size size;

  MainCoCurricularMainGraph({
    @required this.data,
    @required this.bgColor,
    @required this.size,
  });

  @override
  _MainCoCurricularMainGraphState createState() =>
      _MainCoCurricularMainGraphState();
}

class _MainCoCurricularMainGraphState extends State<MainCoCurricularMainGraph> {
  double barWidth = 6.0;
  int isSelectedIndex = 0;
  String selectedSkill, skillPercentage;
  @override
  void initState() {
    super.initState();
    selectedSkill = widget.data.keys.toList()[0].toString();
    skillPercentage = widget.data.values.toList()[0].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: widget.bgColor,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          margin: EdgeInsets.only(top: 26.0),
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 30.0,
              top: 40.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < widget.data.length; i++)
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        this.isSelectedIndex = i;
                        selectedSkill = widget.data.keys.toList()[i].toString();
                        skillPercentage =
                            widget.data.values.toList()[i].toString();
                        print(selectedSkill);
                      });
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 100.0,
                            child: Text(
                              widget.data.keys.toList()[i],
                              style: subheading.copyWith(
                                color: Color(0xff7589a2),
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: isSelectedIndex == i
                                  ? Color(0xff00C968)
                                  : Color(0xff1CAAFA),
                            ),
                            height: barWidth,
                            width: ((widget.size.width -
                                        52.0 -
                                        50.0 -
                                        100.0 -
                                        8.0) /
                                    10) *
                                (widget.data.values.toList()[i].toDouble() /
                                    10),
                          ),
                        ],
                      ),
                    ),
                  ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 20.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xff00C968).withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$selectedSkill',
                        style: subheading.copyWith(
                          color: Color(0xff00C968),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Text(
                        skillPercentage.toString(),
                        style: subheading.copyWith(
                          color: Color(0xff7589a2),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 4.0,
          top: 8.0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 30.0),
            child: Container(
              height: 40.0,
              width: 40.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '100',
                    style: subheading.copyWith(
                      color: Color(0xff7589a2),
                      fontWeight: FontWeight.w900,
                      fontSize: 10,
                    ),
                  ),
                  Container(
                    height: 7.0,
                    width: 0.7,
                    color: Color(0xff7589a2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
