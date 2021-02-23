import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/generateQuizData.dart';
import 'package:IntelliEd/widgets/successPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';

class TakeQuizForBehaviourPage extends StatefulWidget {
  @override
  _TakeQuizForBehaviourPageState createState() =>
      _TakeQuizForBehaviourPageState();
}

class _TakeQuizForBehaviourPageState extends State<TakeQuizForBehaviourPage> {
  int totalQues = 4;
  int currentQues = -1;

  var data = [];
  List softSkills = ['collaborative', 'respect', 'initiative', 'workHabits'];
  List resultIndex = [-1, -1, -1, -1];

  double heightOfOptionWidget = 63.0;
  int animationTime = 200;

  Map<String, Map> result = {};

  PageController _pageController = PageController(
    viewportFraction: 1.0,
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 10), () {
      setState(() {
        currentQues = 1;
      });
    });
    data = generateQuizData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Theme(
      data: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
      ),
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          color: Color(0xff1CAAFA),
          child: Stack(
            children: [
              Container(
                height: size.height,
                margin: EdgeInsets.symmetric(horizontal: 26.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 130.0),
                      Text(
                        currentQues == -1
                            ? 'Question 1/$totalQues'
                            : 'Question $currentQues/$totalQues',
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
                            AnimatedContainer(
                              duration: Duration(milliseconds: animationTime),
                              height: 7.0,
                              width: currentQues == -1
                                  ? 0
                                  : (size.width - 52.0) / 4 * currentQues,
                              color: Color(0xff00C968),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Stack(
                        overflow: Overflow.visible,
                        children: [
                          Card(
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 75.0,
                                left: 26.0,
                                right: 26.0,
                                bottom: 26.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Choose the statement that best describes the student',
                                    style: heading2.copyWith(
                                      color: Color(0xff294D77),
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Container(
                                    height:
                                        (heightOfOptionWidget + 24) * 4 + 14,
                                    child: PageView(
                                      physics: NeverScrollableScrollPhysics(),
                                      controller: _pageController,
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        for (int page = 0;
                                            page < data.length;
                                            page++)
                                          Container(
                                            width: size.width - 52.0,
                                            margin: EdgeInsets.all(7.0),
                                            child: Column(
                                              children: [
                                                for (int option = 0;
                                                    option < 4;
                                                    option++)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () {
                                                      setState(() {
                                                        resultIndex[page] =
                                                            option;
                                                      });
                                                    },
                                                    child: Container(
                                                      height:
                                                          heightOfOptionWidget,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        vertical: 12.0,
                                                      ),
                                                      width: size.width,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 10.0,
                                                        vertical: 10.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color: resultIndex[
                                                                      page] ==
                                                                  option
                                                              ? Color(
                                                                  0xff00C968)
                                                              : Color(0xff294D77)
                                                                  .withOpacity(
                                                                      0.6),
                                                          width: 1,
                                                        ),
                                                        color: resultIndex[
                                                                    page] ==
                                                                option
                                                            ? Color(0xff00C968)
                                                            : Colors.white,
                                                      ),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          data[page][option]
                                                              ['option'],
                                                          style: viewAllStyle
                                                              .copyWith(
                                                            color: resultIndex[
                                                                        page] ==
                                                                    option
                                                                ? Colors.white
                                                                : Color(0xff294D77)
                                                                    .withOpacity(
                                                                        0.6),
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: -35.0,
                            left: 20.0,
                            child: Container(
                              height: 120.0,
                              width: 120.0,
                              child: Image(
                                image:
                                    AssetImage('assets/teacher/takeQuiz.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 95.0)
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
        bottomSheet: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          height: 80.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: (size.width - 60) / 2 - 10.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: (currentQues > 1)
                      ? Color(0xff00C968)
                      : Color(0xff00C968).withOpacity(0.2),
                  elevation: (currentQues > 1) ? 1.0 : 0.0,
                  highlightElevation: 0.0,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Text(
                    'Prev',
                    style: viewAllStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    if (currentQues > 1) {
                      setState(() {
                        --currentQues;
                      });
                      _pageController.animateToPage(
                        currentQues - 1,
                        duration: Duration(milliseconds: animationTime),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                ),
              ),
              SizedBox(width: 20.0),
              Container(
                height: 50.0,
                width: (size.width - 60) / 2 - 10.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color:
                      resultIndex[currentQues == -1 ? 0 : currentQues - 1] == -1
                          ? Color(0xff00C968).withOpacity(0.2)
                          : Color(0xff00C968),
                  elevation: (currentQues != totalQues &&
                          resultIndex[
                                  currentQues == -1 ? 0 : currentQues - 1] !=
                              -1)
                      ? 1.0
                      : 0.0,
                  highlightElevation: 0.0,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Text(
                    (currentQues != totalQues) ? 'Next' : 'Finish',
                    style: viewAllStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    if (currentQues != totalQues &&
                        resultIndex[currentQues == -1 ? 0 : currentQues - 1] !=
                            -1) {
                      _pageController.animateToPage(
                        currentQues,
                        duration: Duration(milliseconds: animationTime),
                        curve: Curves.easeIn,
                      );
                      setState(() {
                        currentQues++;
                      });
                    } else if (currentQues == totalQues) {
                      // Finish Quiz
                      for (int i = 0; i < data.length; i++) {
                        String key = softSkills[i];
                        result[key] = data[i][resultIndex[i]];
                      }
                      print(result);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => SuccessPage(
                            successMsg: 'Quiz submitted successfully',
                            triggerFunction: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: Duration(seconds: 0),
                                  pageBuilder: (context, _, __) =>
                                      TeacherHomePage(),
                                ),
                                (route) => false,
                              );
                            },
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
