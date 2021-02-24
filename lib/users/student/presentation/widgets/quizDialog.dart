import 'package:IntelliEd/quizAlreadySubmittedPage.dart';
import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/users/student/presentation/pages/analytics/mentalWellnessQuizPage.dart';
import 'package:IntelliEd/users/student/presentation/pages/analytics/professionalInterestQuiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showQuizDialog(BuildContext context, Size size) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text(
                'Quiz',
                style: heading2,
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Color(0xffFF5252),
                ),
                child: GestureDetector(
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
        content: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 15.0),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  print(quizData["response"]["mentalQuiz"]);
                  quizData["response"]["mentalQuiz"]
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizAlreadySubmitted(
                              heading: 'Mental Wellness Quiz',
                            ),
                          ),
                        )
                      : Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => MentalWellnessQuizPage(),
                          ),
                        );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 60.0,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xff1CAAFA),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Mental Wellness',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_right_alt_rounded,
                        color: Colors.white,
                        size: 26.0,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  quizData["response"]["professionalInterestQuiz"]
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizAlreadySubmitted(
                              heading: 'Professional Interest Quiz',
                            ),
                          ),
                        )
                      : Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) =>
                                ProfessionalInterestQuizPage(),
                          ),
                        );
                },
                child: Container(
                  height: 60.0,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xff00C968),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Professional Interest',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_right_alt_rounded,
                        color: Colors.white,
                        size: 26.0,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
