import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:IntelliEd/users/teacher/presentation/widgets/slivers/commonSliverForTeacher.dart';
import 'package:flutter/material.dart';

class TeacherAnnouncementPage extends StatefulWidget {
  @override
  _TeacherAnnouncementPageState createState() =>
      _TeacherAnnouncementPageState();
}

class _TeacherAnnouncementPageState extends State<TeacherAnnouncementPage> {
  ScrollController _scrollController = ScrollController();
  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        slivers: [
          commanSliverAppBarForTeacher(
            size,
            'Announcements',
            'Here you can find all the announcements made by your teachers and school\'s management',
            'assets/announcement.png',
            Color(0xFFB0E3FF),
            Color(0xff1CAAFA),
            this.context,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 30.0),
                      Container(
                        margin: EdgeInsets.only(left: 26.0, right: 13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Announcements',
                              style: heading2,
                            ),
                            Container(
                              height: 45.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: FloatingActionButton(
                                splashColor: Colors.transparent,
                                highlightElevation: 0.0,
                                elevation: 0.0,
                                backgroundColor: Color(0xff1CAAFA),
                                shape: CircleBorder(),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/teacher/createAnnouncements');
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: size.width,
                            margin: EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 26.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Risk Notifications',
                                  style: heading2,
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  padding: EdgeInsets.all(26.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: Color(0xffB5E5FF),
                                  ),
                                  width: size.width,
                                  child: riskNotifications.length == 0
                                      ? Center(child: Text('No notifications'))
                                      : SingleChildScrollView(
                                          physics: BouncingScrollPhysics(),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              for (int i = 0;
                                                  i < riskNotifications.length;
                                                  i++)
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        riskNotifications[i],
                                                        style:
                                                            viewAllStyle.apply(
                                                          color:
                                                              Color(0xFF636363),
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 1.5,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width,
                            margin: EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 26.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your Class',
                                  style: heading2,
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  padding: EdgeInsets.all(26.0),
                                  height: 350.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: Color(0xffB5E5FF),
                                  ),
                                  width: size.width,
                                  child: SingleChildScrollView(
                                    controller: ScrollController(),
                                    physics: BouncingScrollPhysics(),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (int i = 0;
                                            i < globalAnnouncementData.length;
                                            i++)
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  globalAnnouncementData[i],
                                                  style: viewAllStyle.apply(
                                                    color: Color(0xFF636363),
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 1.5,
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width,
                            margin: EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 26.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'From Higher Authoritities',
                                  style: heading2,
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  padding: EdgeInsets.all(26.0),
                                  height: 350.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: Color(0xffB5E5FF),
                                  ),
                                  width: size.width,
                                  child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        for (int i = 0;
                                            i <
                                                higherAuthoritiesAnnouncement
                                                    .length;
                                            i++)
                                          Container(
                                            child: Column(
                                              children: [
                                                Text(
                                                  higherAuthoritiesAnnouncement[
                                                      i],
                                                  style: viewAllStyle.apply(
                                                    color: Color(0xFF636363),
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 1.5,
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
    );
  }
}
