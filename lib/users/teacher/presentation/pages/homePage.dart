import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:IntelliEd/users/teacher/presentation/widgets/homePageWidgets.dart';
import 'package:IntelliEd/users/teacher/presentation/widgets/slivers/homePageSliverAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../model/commanModel.dart';
import '../../../../loadingPage.dart';

class TeacherHomePage extends StatefulWidget {
  @override
  _TeacherHomePageState createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  bool isLoading = true;
  Map announcementResult = {};

  @override
  void initState() {
    super.initState();
    getAnnouncements();
  }

  getAnnouncements() async {
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
    var response;

    try {
      response = await http.post(
        '$apiUrl/announcements/getTeacher',
        body: jsonEncode(<String, String>{
          'studentClass': userData['teacher']['assignedClass'].toString(),
          'section': userData['teacher']['assignedSection'].toString(),
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${userData['token']}'
        },
      ).timeout(Duration(seconds: 10));
      announcementResult = json.decode(response.body.toString());
      addAnnouncementsToGlobalData();
    } catch (e) {
      setState(() {
        isLoading = false;
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Connection to the servers failed'),
          action: SnackBarAction(
            label: 'Retry',
            onPressed: () {
              setState(() {
                isLoading = true;
                getAnnouncements();
              });
            },
          ),
        ));
      });
    }
  }

  addAnnouncementsToGlobalData() {
    for (int i = announcementResult['response'].length - 1; i >= 0; i--) {
      globalAnnouncementData
          .add(announcementResult['response'][i]['announcement']);
    }
    print(globalAnnouncementData);
    setState(() {
      isLoading = false;
    });
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
          ? loadingPage(size: size, text: 'Fetching Data')
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
                    teacherSliverAppBarWidget(
                      size,
                      teacherTestAppBar.name,
                      teacherTestAppBar.imagePath,
                      this.context,
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            child: teacherAnnouncementWidget(context),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            child: AttendanceAndAnalyticsWidget(
                              size: size,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            child: calendarWidget(context),
                          ),
                          SizedBox(height: 30.0),
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
