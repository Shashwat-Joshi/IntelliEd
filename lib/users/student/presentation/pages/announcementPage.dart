import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/users/student/presentation/widgets/logoAndProfileBarWidget.dart';
import 'package:flutter/material.dart';

class AnnouncementPage extends StatefulWidget {
  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          logoAndProfileBarWidget(context, size),
          SizedBox(height: 30.0),
          Container(
            margin: EdgeInsets.only(left: 26.0, bottom: 26.0),
            child: Text(
              'Announcements',
              style: heading2,
            ),
          ),
          Container(
            height: size.height - 182.0,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
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
    );
  }
}
