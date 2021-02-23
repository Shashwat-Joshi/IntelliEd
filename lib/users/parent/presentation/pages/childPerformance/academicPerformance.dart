import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/parent/model/parent.dart';
import 'package:IntelliEd/users/parent/presentation/pages/childPerformance/subjectWisePage.dart';
import 'package:IntelliEd/widgets/graphs/AcademicsbarChart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentAcademicPerformanceForParent extends StatefulWidget {
  @override
  _StudentAcademicPerformanceForParentState createState() =>
      _StudentAcademicPerformanceForParentState();
}

class _StudentAcademicPerformanceForParentState
    extends State<StudentAcademicPerformanceForParent> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (studentWisefinalSubjects.isEmpty) {
      createModelMarksForAcademicPerformancePage();
      modelStudentAverageMarks.studentMarks.keys.forEach((key) {
        studentWisefinalSubjects.add(key.toString());
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB0E3FF),
        title: Text(
          '$studentName',
          style: TextStyle(
            color: Color(0xff1CAAFA),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      ),
      body: CupertinoScrollbar(
        radius: Radius.circular(20.0),
        thickness: 4.0,
        controller: _scrollController,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(26.0),
                height: 300.0,
                width: size.width,
                child: AcademicsBarGraph(
                  studentMarks: getStudentAverageMarks(),
                  classAverageMarks: getClassAverageMarks(),
                  examNames: studentWisefinalSubjects,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 26.0),
                height: 15.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10.0),
                            height: 15.0,
                            width: 15.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff1CAAFA),
                            ),
                          ),
                          Text('Your percentage', style: subheading),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10.0),
                            height: 15.0,
                            width: 15.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff00C968),
                            ),
                          ),
                          Text('Class Average', style: subheading),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 26.0 + 7.0),
                child: Text(
                  'Subjects',
                  style: heading2,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 26.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: createSubjectCardsWidget(size),
                ),
              ),
              SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> createSubjectCardsWidget(Size size) {
    List<Widget> finalList = [];
    for (int i = 0; i < studentWisefinalSubjects.length; i++) {
      finalList.add(
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Color(0xFFB0E3FF),
          ),
          margin: EdgeInsets.all(7.0),
          height: 50.0,
          width: size.width / 2 - 40,
          child: FlatButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => StudentWiseSubjectWiseAcademicPage(
                    index: i,
                  ),
                ),
              );
            },
            child: Center(
              child: Text(
                studentWisefinalSubjects[i],
                style: heading1.copyWith(
                  fontSize: 18.0,
                  color: Color(0xff1CAAFA),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return finalList;
  }
}
