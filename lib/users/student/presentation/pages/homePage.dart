import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/presentation/widgets/analyticsCardWidget.dart';
import 'package:IntelliEd/users/student/presentation/widgets/sliverAppBar.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/widgets/rowOfViewAll.dart';
import 'package:flutter/material.dart';

class StudentHomePage extends StatefulWidget {
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  final ScrollController _scrollController = ScrollController();

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
        thickness: 4.0,
        controller: _scrollController,
        child: CustomScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          slivers: [
            sliverAppBarWidget(
              size,
              testAppBar.name,
              testAppBar.techSummary,
              testAppBar.imagePath,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: 790,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: homeScreenWidgets(size),
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

  List<Widget> homeScreenWidgets(Size size) {
    return [
      announcementWidget(),
      analyticsWidget(size),
      calendarWidget(),
    ];
  }

  Widget announcementWidget() => Container(
        child: Column(
          children: [
            SizedBox(height: 27.0),
            rowofViewAll('Announcements'),
            SizedBox(height: 14.0),
            Text(
              announcementText['0'],
              style: viewAllStyle.apply(
                color: Color(0xFFACACAC),
              ),
            ),
            Divider(
              thickness: 1.5,
            ),
            Text(
              announcementText['0'],
              style: viewAllStyle.apply(
                color: Color(0xFFACACAC),
              ),
            ),
            Divider(thickness: 1.5),
          ],
        ),
      );

  Widget analyticsWidget(Size size) => Container(
        height: 400.0,
        padding: EdgeInsets.all(0.0),
        child: Column(
          children: [
            SizedBox(height: 27.0),
            rowofViewAll('Analytics'),
            SizedBox(height: 14.0),
            for (int i = 0; i < 2; i++)
              analyticsCardWidget(
                  analyticsFeatures[i].heading,
                  analyticsFeatures[i].subHeading,
                  analyticsFeatures[i].color,
                  analyticsFeatures[i].textColor,
                  size),
          ],
        ),
      );

  Widget calendarWidget() => Container(
        child: Column(
          children: [
            SizedBox(height: 27.0),
            rowofViewAll('Calander'),
            SizedBox(height: 14.0),
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
      );
}
