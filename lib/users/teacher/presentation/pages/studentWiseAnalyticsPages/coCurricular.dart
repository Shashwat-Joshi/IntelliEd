import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/examData.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:IntelliEd/widgets/clipperWidgetsAndScrollBehavior.dart';
import 'package:IntelliEd/widgets/graphs/CoCurricularGraphs/coCurricularMainGraph.dart';
import 'package:IntelliEd/widgets/graphs/CoCurricularGraphs/donutGraph1.dart';
import 'package:IntelliEd/widgets/graphs/CoCurricularGraphs/indicators/indicatorForDonut.dart';
import 'package:IntelliEd/widgets/graphs/CoCurricularGraphs/pieChartNo2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentWiseCoCurricularPage extends StatefulWidget {
  @override
  _StudentWiseCoCurricularPageState createState() =>
      _StudentWiseCoCurricularPageState();
}

class _StudentWiseCoCurricularPageState
    extends State<StudentWiseCoCurricularPage> {
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
      appBar: AppBar(
        backgroundColor: Color(0xFFB0E3FF),
        title: Text(
          "${classDataStudent[currentSelectedStudentId - 1]['name']}",
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
        child: ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 26.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 26.0),
                  width: size.width,
                  child: Text(
                    'Co-Curricular',
                    style: heading2,
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 26.0),
                  height: 400,
                  child: MainCoCurricularMainGraph(
                    data: perStudentCoCurricularMainPageData,
                    bgColor: Color(0xffE8F7FF),
                    size: size,
                  ),
                ),
                SizedBox(height: 25.0),
                Divider(
                  thickness: 1,
                ),
                SizedBox(height: 15.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 26.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Inter Personal Skills',
                        style: heading2,
                      ),
                      SizedBox(height: 26.0),
                      Container(
                        child: Column(
                          children: [
                            DonutGraph1(
                              data: perStudentCoCurricularDonut1Data,
                            ),
                            SizedBox(height: 16.0),
                            donutIndicatorWidgets(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.0),
                Divider(
                  thickness: 1,
                ),
                SizedBox(height: 15.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 26.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Soft Skills',
                        style: heading2,
                      ),
                      SizedBox(height: 26.0),
                      Container(
                        child: PieChartNo2(
                          data: perStudentcoCurricularPieNo2Data,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      pieIndicatorWidgets(),
                    ],
                  ),
                ),
                SizedBox(height: 5.0),
                Divider(
                  thickness: 1,
                ),
                Stack(
                  children: [
                    ClipPath(
                      clipper: CustomCliperDesign1(),
                      child: Container(
                        width: size.width,
                        color: Color(0xFF1CAAFA).withOpacity(0.7),
                        child: analysisWidget(),
                      ),
                    ),
                    ClipPath(
                      clipper: CustomCliperDesign2(),
                      child: Container(
                        width: size.width,
                        color: Colors.blue.withOpacity(0.7),
                        child: analysisWidget(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget analysisWidget() => Padding(
        padding: const EdgeInsets.only(top: 110.0, bottom: 20.0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Analysis',
                style: heading2.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Timely check is important when it comes to improvement. Co curricular activities are important in a way or the other to bring some positive changes in your personality and eliminate the negative one. So keep a timely check on the data and keep improving.",
                style: viewAllStyle.copyWith(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      );
}
