import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/parent/model/parent.dart';
import 'package:IntelliEd/users/parent/presentation/widgets/slivers/commanSliverForParent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParentAnnouncementPage extends StatefulWidget {
  @override
  _ParentAnnouncementPageState createState() => _ParentAnnouncementPageState();
}

class _ParentAnnouncementPageState extends State<ParentAnnouncementPage> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CupertinoScrollbar(
        radius: Radius.circular(20.0),
        thickness: 4.0,
        controller: _scrollController,
        child: CustomScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          slivers: [
            commanSliverAppBarForParent(
              size,
              'Announcements',
              'Here you can find all the announcements made by your teachers and school\'s management',
              'assets/announcement.png',
              Color(0xFFB0E3FF),
              Color(0xFF1CAAFA),
              this.context,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 30.0),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < globalAnnouncementData.length; i++)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 26.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  globalAnnouncementData[i],
                                  textAlign: TextAlign.start,
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
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
