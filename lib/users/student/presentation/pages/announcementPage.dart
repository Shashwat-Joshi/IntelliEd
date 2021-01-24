import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/users/student/presentation/widgets/slivers/academicSliverAppBar.dart';
import 'package:flutter/material.dart';

class AnnouncementPage extends StatefulWidget {
  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scrollbar(
        radius: Radius.circular(20.0),
        thickness: 4.0,
        controller: _scrollController,
        child: CustomScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          slivers: [
            academicsliverAppBar(
              size,
              'Announcements',
              bigLoremText.substring(0, 70),
              'assets/announcement.png',
              Color(0xFFB0E3FF),
              analyticsFeatures[0].textColor,
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
