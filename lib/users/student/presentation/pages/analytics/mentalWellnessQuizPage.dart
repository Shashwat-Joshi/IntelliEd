import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/users/student/presentation/pages/analytics/takeQuizForMentalWellness.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MentalWellnessQuizPage extends StatefulWidget {
  @override
  _MentalWellnessQuizPageState createState() => _MentalWellnessQuizPageState();
}

class _MentalWellnessQuizPageState extends State<MentalWellnessQuizPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double lengthOfButton = (size.height - 650.0) * 1.8;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 26.0),
                    width: size.width,
                    height: 280.0,
                    child: Image(
                      image: AssetImage('assets/teacher/quiz.png'),
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
                            "Mental Wellness Quiz",
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
                          child: Text(
                            //bigLoremText.substring(0, 100),
                            //Todo: Change the Text Here
                            "Here we have a bunch of questions for you to make you realise who you are.",
                            style: viewAllStyle.copyWith(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.02,
                            ),
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
            bottom: lengthOfButton > 200.0 ? lengthOfButton / -2 : -160.0,
            right: lengthOfButton > 200.0 ? lengthOfButton / -2 : -160.0,
            child: Container(
              height: lengthOfButton > 200.0 ? (lengthOfButton + 10.0) : 320.0,
              width: lengthOfButton > 200.0 ? (lengthOfButton + 10.0) : 320.0,
              decoration: BoxDecoration(
                color: Color(0xff1CAAFA).withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: lengthOfButton > 200.0 ? lengthOfButton / -2 : -150.0,
            right: lengthOfButton > 200.0 ? lengthOfButton / -2 : -150.0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TakeQuizForMentalWellnessPage(),
                  ),
                );
              },
              child: Container(
                height: lengthOfButton > 200.0 ? lengthOfButton : 300.0,
                width: lengthOfButton > 200.0 ? lengthOfButton : 300.0,
                decoration: BoxDecoration(
                  color: Color(0xff1CAAFA),
                  shape: BoxShape.circle,
                ),
                child: Align(
                  alignment: Alignment(-0.5, -0.47),
                  child: Text(
                    'Take quiz',
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
