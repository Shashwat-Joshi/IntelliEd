import 'package:IntelliEd/users/student/presentation/widgets/homePageWidgets.dart';
import 'package:IntelliEd/users/student/presentation/widgets/slivers/homePageSliverAppBar.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:flutter/material.dart';

class StudentHomePage extends StatefulWidget {
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  final ScrollController _scrollController = ScrollController();
  //FIXME: Change the height
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
      body: Scrollbar(
        radius: Radius.circular(20.0),
        thickness: 4.0,
        controller: _scrollController,
        child: CustomScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(parent: ClampingScrollPhysics()),
          slivers: [
            sliverAppBarWidget(
              size,
              testAppBar.name,
              testAppBar.techSummary,
              testAppBar.imagePath,
              this.context,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: homePageHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: homeScreenWidgets(size, context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> homeScreenWidgets(Size size, BuildContext context) {
    return [
      announcementWidget(context),
      AnalyticsWidget(
        size: size,
        onTapArrow: (int turns) {
          setState(() {
            if (turns == 3) {
              homePageHeight = 1850.0;
            } else {
              homePageHeight = 1330.0;
            }
          });
        },
      ),
      assignmentWidget(size, context),
      calendarWidget(context),
      todaysClasses(context),
    ];
  }
}
