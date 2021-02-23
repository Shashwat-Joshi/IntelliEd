import 'package:IntelliEd/users/parent/model/parent.dart';
import 'package:IntelliEd/users/parent/presentation/widgets/homePageWidgets.dart';
import 'package:IntelliEd/users/parent/presentation/widgets/slivers/parentSliverAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../model/commanModel.dart';
import '../../../../loadingPage.dart';

class ParentHomePage extends StatefulWidget {
  @override
  _ParentHomePageState createState() => _ParentHomePageState();
}

class _ParentHomePageState extends State<ParentHomePage> {
  final ScrollController _scrollController = ScrollController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = true;
  Map result = {};

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
      print(boxExists);
      if (boxExists) {
        var box = Hive.box('userData');
        var result = box.get('result').toString();
        userData = json.decode(result);
        print(userData);
      } else {
        logOutUser(context);
      }
    }
    globalAnnouncementData.clear();
    var response;
    try {
      response = await http.get(
        '$apiUrl/parent/dashboardStudent',
        headers: <String, String>{
          'Authorization': userData['token'],
        },
      ).timeout(Duration(seconds: 10));

      studentDetails = json.decode(response.body.toString());
      // print(studentDetails["response"]["currentSection"]);
      fetchAnnouncementData();
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

  fetchAnnouncementData() async {
    try {
      var response = await http.post('$apiUrl/announcements/getParent',
          body: jsonEncode(<String, String>{
            "studentClass":
                studentDetails['response']['currentSchoolClass'].toString(),
            "section": studentDetails['response']['currentSection'].toString(),
          }),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${userData['token']}',
          });
      result = json.decode(response.body);
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
    for (int i = result['response'].length - 1; i >= 0; i--) {
      if (result['response'][i]['forParent']) {
        globalAnnouncementData.add(result['response'][i]['announcement']);
      }
    }
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
                    parentSliverAppBarWidget(
                      size,
                      parentTestAppBar.name,
                      parentTestAppBar.imagePath,
                      this.context,
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            child: parentAnnouncementWidget(context),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            child: analyticsWidget(context, size),
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
