import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/presentation/pages/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnnouncementSentPage extends StatefulWidget {
  @override
  _AnnouncementSentPageState createState() => _AnnouncementSentPageState();
}

class _AnnouncementSentPageState extends State<AnnouncementSentPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, _, __) => TeacherHomePage(),
        ),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        return;
      },
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: size.width / 2,
                width: size.width / 2,
                child: Image(
                  image: AssetImage('assets/announcementSent.png'),
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                width: size.width * 0.8,
                child: Text(
                  'Announcement sent successfully',
                  style: heading1,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
