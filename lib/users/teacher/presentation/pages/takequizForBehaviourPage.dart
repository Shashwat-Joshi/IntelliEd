import 'package:IntelliEd/style/theme.dart';
import 'package:flutter/material.dart';

class TakeQuizForBehaviourPage extends StatefulWidget {
  final int rollNum;
  TakeQuizForBehaviourPage({@required this.rollNum});
  @override
  _TakeQuizForBehaviourPageState createState() =>
      _TakeQuizForBehaviourPageState();
}

class _TakeQuizForBehaviourPageState extends State<TakeQuizForBehaviourPage> {
  int currentQues = 1;
  int totalQues = 4;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Color(0xff1CAAFA),
        child: Stack(
          children: [
            Positioned(
              top: 110.0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 26.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0),
                    Text(
                      'Question $currentQues/$totalQues',
                      style: heading2.copyWith(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 7.0,
                      width: size.width - 52.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 7.0,
                            width: (size.width - 52.0) /
                                (totalQues - currentQues + 1),
                            color: Color(0xff00C968),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: -100.0,
              top: -90.0,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    color: Color(0xff00C968),
                    shape: BoxShape.circle,
                  ),
                  child: Align(
                    alignment: Alignment(0.45, 0.55),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
