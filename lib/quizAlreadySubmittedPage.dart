import 'package:IntelliEd/style/theme.dart';
import 'package:flutter/material.dart';

class QuizAlreadySubmitted extends StatefulWidget {
  final String heading;
  QuizAlreadySubmitted({
    @required this.heading,
  });

  @override
  _QuizAlreadySubmittedState createState() => _QuizAlreadySubmittedState();
}

class _QuizAlreadySubmittedState extends State<QuizAlreadySubmitted> {
  final num buttonWidth = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.2),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 26.0),
                    width: size.width,
                    height: 280.0,
                    child: Image(
                      image: AssetImage('assets/quizSubmitted.png'),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 30.0, right: size.width * 0.20),
                          child: Text(
                            widget.heading,
                            // '',
                            style: heading2.copyWith(
                              fontSize: 24.0,
                              letterSpacing: 1.05,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          margin: EdgeInsets.only(
                              left: 30.0, right: size.width * 0.30),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "STATUS: ",
                                style: viewAllStyle.copyWith(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.02,
                                ),
                              ),
                              TextSpan(
                                text: "Your submission has been received",
                                style: viewAllStyle.copyWith(
                                  color: Color(0xff717171),
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.02,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.0),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: buttonWidth > 200.0 ? buttonWidth / -2 : -160.0,
            right: buttonWidth > 200.0 ? buttonWidth / -2 : -160.0,
            child: Container(
              height: buttonWidth > 200.0 ? (buttonWidth + 10.0) : 320.0,
              width: buttonWidth > 200.0 ? (buttonWidth + 10.0) : 320.0,
              child: Center(
                child: Container(
                  width: size.width * buttonWidth,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff1CAAFA).withOpacity(0.2),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: buttonWidth > 200.0 ? buttonWidth / -2 : -150.0,
            right: buttonWidth > 200.0 ? buttonWidth / -2 : -150.0,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: buttonWidth > 200.0 ? buttonWidth : 300.0,
                width: buttonWidth > 200.0 ? buttonWidth : 300.0,
                decoration: BoxDecoration(
                  color: Color(0xff1CAAFA),
                  shape: BoxShape.circle,
                ),
                child: Align(
                  alignment: Alignment(-0.5, -0.47),
                  child: Text(
                    'Ok',
                    style: viewAllStyle.copyWith(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
