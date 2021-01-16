import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/users/student/presentation/widgets/academicSliverAppBar.dart';
import 'package:IntelliEd/users/student/presentation/widgets/subjectWiseSliverAppBar.dart';
import 'package:flutter/material.dart';

class SubjectWiseAcademicPage extends StatefulWidget {
  final int index;
  SubjectWiseAcademicPage({
    @required this.index,
  });
  @override
  _SubjectWiseAcademicPageState createState() =>
      _SubjectWiseAcademicPageState();
}

class _SubjectWiseAcademicPageState extends State<SubjectWiseAcademicPage> {
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
            subjectWiseAcademicsliverAppBar(
              size,
              finalSubjects[widget.index],
              analyticsFeatures[0].imagePath,
              Color(0xFFB0E3FF),
              analyticsFeatures[0].textColor,
              this.context,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  // Container(
                  //   margin: EdgeInsets.all(26.0),
                  //   height: 380.0,
                  //   width: size.width,
                  //   child: BarChartSample2(
                  //     studentAverageMarks: modelStudentAverageMarks,
                  //   ),
                  // ),
                  SizedBox(height: 1000.0),
                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: 26.0),
                  //   child: Wrap(
                  //     children: createSubjectCardsWidget(size),
                  //   ),
                  // ),
                  // SizedBox(height: 30.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
