import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'behaviourQuizPage.dart';

class AboutStudentsSkillPage extends StatefulWidget {
  @override
  _AboutStudentsSkillPageState createState() => _AboutStudentsSkillPageState();
}

class _AboutStudentsSkillPageState extends State<AboutStudentsSkillPage> {
  String selectedExam = examNames.keys.toList()[0];
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double widthForContainer = size.width - 72.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB0E3FF),
        title: Text(
          classData['main'],
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
      body: Container(
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
                        'About Students Skill Page',
                        style: heading2,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Form(
                  child: Column(
                    children: [
                      for (int i = 0; i < perClassMarks['result'].length; i++)
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
                                                  style: heading1.copyWith(
                                                    fontSize: 15.0,
                                                    color: Color(0xff1CAAFA),
                                                  ),
                                                )
                                              : Text(
                                                  "0${i + 1}",
                                                  style: heading1.copyWith(
                                                    fontSize: 15.0,
                                                    color: Color(0xff1CAAFA),
                                                  ),
                                                ),
                                        ),
                                        SizedBox(width: 10.0),
                                        Container(
                                          width: widthForContainer * 0.73,
                                          child: Text(
                                            perClassMarks['result'][i]['name'],
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
                                              alignment: Alignment.centerRight,
                                              child: IconButton(
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                icon: Icon(
                                                  Icons.navigate_next,
                                                  color: Color(0xff00C968),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    CupertinoPageRoute(
                                                      builder: (context) =>
                                                          BehaviourQuizPage(
                                                        rollNum: i + 1,
                                                      ),
                                                    ),
                                                  );
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration customMarksFieldDecoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.all(10.0),
      errorStyle: TextStyle(height: 0.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          width: 1.0,
        ),
      ),
    );
  }
}
