import 'dart:convert';
import 'package:IntelliEd/model/commanModel.dart';
import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/widgets/successPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../homePage.dart';

class TakeQuizForMentalWellnessPage extends StatefulWidget {
  @override
  _TakeQuizForMentalWellnessPageState createState() =>
      _TakeQuizForMentalWellnessPageState();
}

class _TakeQuizForMentalWellnessPageState
    extends State<TakeQuizForMentalWellnessPage> {
  int totalQues = questionsForMentalHealthQuiz.length;
  int currentQues = -1;

  List resultIndex = List(questionsForMentalHealthQuiz.length);

  double heightOfOptionWidget = 63.0;
  int animationTime = 200;

  PageController _pageController = PageController(
    viewportFraction: 1.0,
  );

  bool isLoading = false;

  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    resultIndex.fillRange(0, questionsForMentalHealthQuiz.length, -1);
    Future.delayed(Duration(milliseconds: 10), () {
      setState(() {
        currentQues = 1;
      });
    });
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
        key: _scaffoldState,
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
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
                                    duration:
                                        Duration(milliseconds: animationTime),
                                    height: 7.0,
                                    width: currentQues == -1
                                        ? 0
                                        : (size.width - 52.0) /
                                            questionsForMentalHealthQuiz
                                                .length *
                                            currentQues,
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
                                    height:
                                        (heightOfOptionWidget + 24) * 6 + 32,
                                    child: PageView(
                                      physics: NeverScrollableScrollPhysics(),
                                      controller: _pageController,
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        for (int page = 0;
                                            page <
                                                questionsForMentalHealthQuiz
                                                    .length;
                                            page++)
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 90.0,
                                              left: 26.0,
                                              right: 26.0,
                                              // bottom: 26.0,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  questionsForMentalHealthQuiz[
                                                      page],
                                                  style: heading2.copyWith(
                                                    color: Color(0xff294D77),
                                                    fontSize: 19.0,
                                                  ),
                                                ),
                                                SizedBox(height: 20.0),
                                                Container(
                                                  width: size.width - 52.0,
                                                  margin: EdgeInsets.all(7.0),
                                                  child: Wrap(
                                                    spacing: 16.0,
                                                    children: [
                                                      for (int option = 0;
                                                          option < 6;
                                                          option++)
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () {
                                                            setState(() {
                                                              resultIndex[
                                                                      page] =
                                                                  option;
                                                            });
                                                          },
                                                          child: Container(
                                                            height:
                                                                heightOfOptionWidget,
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                              vertical: 9.0,
                                                            ),
                                                            width: (size.width -
                                                                    52.0 -
                                                                    52.0 -
                                                                    40) /
                                                                2,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              border:
                                                                  Border.all(
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
                                                                  ? Color(
                                                                      0xff00C968)
                                                                  : Colors
                                                                      .white,
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                optionsForQuiz[
                                                                    option],
                                                                style:
                                                                    viewAllStyle
                                                                        .copyWith(
                                                                  color: resultIndex[
                                                                              page] ==
                                                                          option
                                                                      ? Colors
                                                                          .white
                                                                      : Color(0xff294D77)
                                                                          .withOpacity(
                                                                              0.6),
                                                                  fontSize:
                                                                      14.0,
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
                                      image: AssetImage(
                                          'assets/teacher/takeQuiz.png'),
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
        bottomSheet: isLoading
            ? Container()
            : Container(
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
                        color: resultIndex[
                                    currentQues == -1 ? 0 : currentQues - 1] ==
                                -1
                            ? Color(0xff00C968).withOpacity(0.2)
                            : Color(0xff00C968),
                        elevation: (currentQues != totalQues &&
                                resultIndex[currentQues == -1
                                        ? 0
                                        : currentQues - 1] !=
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
                              resultIndex[currentQues == -1
                                      ? 0
                                      : currentQues - 1] !=
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
                            setState(() {
                              isLoading = true;
                            });
                            int finalScore = 0;
                            for (int i = 0;
                                i < questionsForMentalHealthQuiz.length;
                                i++) {
                              finalScore +=
                                  questionsForMentalHealthQuiz.length -
                                      resultIndex[i];
                            }
                            print(finalScore);
                            submitQuiz();
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

  Future submitQuiz() async {
    try {
      var response = await http.post(
        '$apiUrl/quizTaken/update',
        body: jsonEncode(<String, Object>{
          "admissionNumber": userData["student"]["admissionNumber"],
          "mentalQuiz": true,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${userData['token']}'
        },
      );
      Map result = json.decode(response.body);
      print(result);
      if (result["success"]) {
        navigateToMainPage();
      } else {
        setState(() {
          isLoading = false;
        });
        _scaffoldState.currentState.showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              'Failed to update result. Please try again !',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      _scaffoldState.currentState.showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Failed to update result. Please try again !',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }

  navigateToMainPage() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, _, __) => SuccessPage(
          successMsg: 'Quiz was submitted successfully',
          triggerFunction: () {
            Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(seconds: 0),
                pageBuilder: (context, _, __) => StudentHomePage(),
              ),
              (route) => false,
            );
          },
        ),
      ),
    );
  }
}
