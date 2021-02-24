import 'dart:convert';
import 'package:IntelliEd/model/commanModel.dart';
import 'package:IntelliEd/users/student/presentation/widgets/homePageWidgets.dart';
import 'package:IntelliEd/users/student/presentation/widgets/slivers/homePageSliverAppBar.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import '../../../../loadingPage.dart';

class StudentHomePage extends StatefulWidget {
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  final ScrollController _scrollController = ScrollController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double homePageHeight = 1330.0;
  bool isLoading = true;
  Map announcementResult = {};

  @override
  void initState() {
    super.initState();
    getAnnouncements();
  }

  Future getAnnouncements() async {
    if (userData.isEmpty) {
      await Hive.initFlutter();
      await Hive.openBox('userData');
      bool boxExists = await Hive.boxExists('userData');

      if (boxExists) {
        var box = Hive.box('userData');
        var result = box.get('result').toString();
        userData = json.decode(result);
      } else {
        logOutUser(context);
      }
    }
    globalAnnouncementData.clear();
    quizData.clear();
    print(userData);
    var response;
    try {
      response = await http.post(
        '$apiUrl/announcements/get',
        body: jsonEncode(<String, String>{
          'studentClass': userData['student']['currentSchoolClass'].toString(),
          'section': userData['student']['currentSection'].toString(),
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${userData['token']}'
        },
      ).timeout(Duration(seconds: 10));
      announcementResult = json.decode(response.body.toString());
      addAnnouncementsToGlobalData();
    } catch (e) {
      setState(
        () {
          isLoading = false;
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              backgroundColor: Colors.redAccent,
              content: Text(
                'Connection to the servers failed',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              action: SnackBarAction(
                label: 'Retry',
                onPressed: () {
                  setState(() {
                    isLoading = true;
                    getAnnouncements();
                  });
                },
              ),
            ),
          );
        },
      );
    }
  }

  addAnnouncementsToGlobalData() {
    for (int i = announcementResult['response'].length - 1; i >= 0; i--) {
      if (announcementResult['response'][i]['forStudent']) {
        globalAnnouncementData
            .add(announcementResult['response'][i]['announcement']);
      }
    }

    getQuizData();
  }

  Future getQuizData() async {
    try {
      var response = await http.post(
        '$apiUrl/quizTaken/getForStudent',
        body: jsonEncode(
          <String, Object>{
            "admissionNumber": userData["student"]["admissionNumber"],
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${userData['token']}'
        },
      );
      quizData = json.decode(response.body);
      print(quizData);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: isLoading
          ? loadingPage(text: 'Fetching Data', size: size)
          : CupertinoScrollbar(
              radius: Radius.circular(20.0),
              thickness: 4.0,
              controller: _scrollController,
              child: RefreshIndicator(
                backgroundColor: Color(0xff43A978),
                color: Colors.white,
                displacement: 40.0,
                onRefresh: () {
                  setState(() {
                    isLoading = true;
                    getAnnouncements();
                  });
                  return Future.value(true);
                },
                child: CustomScrollView(
                  controller: _scrollController,
                  physics:
                      BouncingScrollPhysics(parent: ClampingScrollPhysics()),
                  slivers: [
                    sliverAppBarWidget(
                      size,
                      studentTestAppBar.name,
                      studentTestAppBar.techSummary,
                      studentTestAppBar.imagePath,
                      this.context,
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            child: announcementWidget(context),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            child: AnalyticsWidget(
                              size: size,
                              scaffoldKey: _scaffoldKey,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            child: calendarWidget(context),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            child: todaysClasses(context),
                          ),
                          SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
