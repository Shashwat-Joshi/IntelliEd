import 'dart:convert';

import 'package:IntelliEd/model/commanModel.dart';
import 'package:IntelliEd/quizAlreadySubmittedPage.dart';
import 'package:IntelliEd/routes/allRoutes.dart';
import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'behaviourQuizPage.dart';

class AboutStudentsSkillPage extends StatefulWidget {
  @override
  _AboutStudentsSkillPageState createState() => _AboutStudentsSkillPageState();
}

class _AboutStudentsSkillPageState extends State<AboutStudentsSkillPage> {
  ScrollController _scrollController = ScrollController();
  List<Map> studentNamesAndAdmissionNum = [];
  List quizData;
  bool isLoading = true;
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    studentData.clear();
    studentNamesAndAdmissionNum.clear();
    getStudentsData();
  }

  Future getStudentsData() async {
    studentData.clear();
    try {
      var response = await http.post(
        '$apiUrl/information/getStudents',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${userData['token']}'
        },
      );
      studentData = json.decode(response.body);
      print(studentData);
      for (int i = 0; i < studentData["response"].length; i++) {
        studentNamesAndAdmissionNum.add({
          "name": studentData["response"][i]["personalDetails"]["fullname"],
          "admissionNumber": studentData["response"][i]["admissionNumber"],
        });
      }
      print(studentNamesAndAdmissionNum);
      getQuizData();
    } catch (e) {
      showErrorAndPopScreen();
    }
  }

  Future getQuizData() async {
    try {
      var response = await http.post(
        '$apiUrl/quizTaken/getAll',
        body: jsonEncode(<String, Object>{
          "studentClass": userData["teacher"]["assignedClass"],
          "section": userData["teacher"]["assignedSection"],
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${userData['token']}'
        },
      );
      Map result = json.decode(response.body);
      quizData = result['response'];
      print(quizData);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      showErrorAndPopScreen();
    }
  }

  showErrorAndPopScreen() {
    _scaffoldState.currentState.showSnackBar(
      SnackBar(
        content: Text(
          'Something went wrong !!',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double widthForContainer = size.width - 72.0;

    return WillPopScope(
      onWillPop: () {
        Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(seconds: 0),
            pageBuilder: (context, _, __) => TeacherHomePage(),
          ),
          (route) => false,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xFFB0E3FF),
          title: Text(
            userData["teacher"]["assignedClass"].toString() +
                userData["teacher"]["assignedSection"].toString(),
            style: TextStyle(
              color: Color(0xff1CAAFA),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                height: size.height,
                width: size.width,
                child: CupertinoScrollbar(
                  controller: _scrollController,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 20.0),
                        Container(
                          height: 40.0,
                          width: size.width - 56.0,
                          margin: EdgeInsets.symmetric(horizontal: 26.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Students and their Skill',
                                style: heading2,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Column(
                          children: [
                            for (int i = 0;
                                i < studentNamesAndAdmissionNum.length;
                                i++)
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 26.0),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: 12.0),
                                        Container(
                                          height: 35.0,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: widthForContainer * 0.07,
                                                child: (i + 1) > 9
                                                    ? Text(
                                                        "${i + 1}",
                                                        style:
                                                            heading1.copyWith(
                                                          fontSize: 15.0,
                                                          color:
                                                              Color(0xff1CAAFA),
                                                        ),
                                                      )
                                                    : Text(
                                                        "0${i + 1}",
                                                        style:
                                                            heading1.copyWith(
                                                          fontSize: 15.0,
                                                          color:
                                                              Color(0xff1CAAFA),
                                                        ),
                                                      ),
                                              ),
                                              SizedBox(width: 10.0),
                                              Container(
                                                width: widthForContainer * 0.73,
                                                child: Text(
                                                  studentNamesAndAdmissionNum[i]
                                                      ["name"],
                                                  style: heading1.copyWith(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10.0),
                                              Container(
                                                width: widthForContainer * 0.20,
                                                child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: IconButton(
                                                      splashColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      icon: Icon(
                                                        Icons.navigate_next,
                                                        color:
                                                            Color(0xff00C968),
                                                      ),
                                                      onPressed: () {
                                                        navigateToNextPage(i);
                                                      },
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                        Divider(thickness: 1.0),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  navigateToNextPage(int i) {
    quizData[i]["behaviourQuiz"]
        ? Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizAlreadySubmitted(
                heading: 'Behaviour Quiz',
              ),
            ),
          )
        : Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => BehaviourQuizPage(
                studentData: studentNamesAndAdmissionNum[i],
              ),
            ),
          );
  }
}
