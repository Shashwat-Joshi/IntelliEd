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
              bigLoremText.substring(0, 70),
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
                        for (int i = 0; i < 15; i++)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 26.0),
                            child: Column(
                              children: [
                                Text(
                                  announcementText['0'],
                                  style: viewAllStyle.apply(
                                    color: Color(0xFFACACAC),
                                  ),
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
