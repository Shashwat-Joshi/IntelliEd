import 'package:IntelliEd/users/student/presentation/widgets/homePageWidgets.dart';
import 'package:IntelliEd/users/student/presentation/widgets/slivers/homePageSliverAppBar.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentHomePage extends StatefulWidget {
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  final ScrollController _scrollController = ScrollController();
  double homePageHeight = 1330.0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
          physics: BouncingScrollPhysics(parent: ClampingScrollPhysics()),
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
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: assignmentWidget(size, context),
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
    );
  }
}
