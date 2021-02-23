import 'package:IntelliEd/model/analyticsLocalDB.dart';
import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
import 'package:IntelliEd/widgets/clipperWidgetsAndScrollBehavior.dart';
import 'package:IntelliEd/widgets/graphs/CoCurricularGraphs/coCurricularMainGraph.dart';
import 'package:IntelliEd/widgets/graphs/CoCurricularGraphs/donutGraph1.dart';
import 'package:IntelliEd/widgets/graphs/CoCurricularGraphs/indicators/indicatorForDonut.dart';
import 'package:IntelliEd/widgets/graphs/CoCurricularGraphs/pieChartNo2.dart';
import 'package:IntelliEd/users/student/presentation/widgets/slivers/commanStudentSliverAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoCurricularPage extends StatefulWidget {
  @override
  _CoCurricularPageState createState() => _CoCurricularPageState();
}

class _CoCurricularPageState extends State<CoCurricularPage> {
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
      backgroundColor: Color(0xfffcfcfc),
      body: CupertinoScrollbar(
        radius: Radius.circular(20.0),
        thickness: 4.0,
        controller: _scrollController,
        child: ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: CustomScrollView(
            controller: _scrollController,
            physics: AlwaysScrollableScrollPhysics(),
            slivers: [
              commanSliverAppBarForStudent(
                size,
                analyticsFeatures[1].heading,
                analyticsFeatures[1].subHeading,
                analyticsFeatures[1].imagePath,
                Color(0xFFB0E3FF),
                analyticsFeatures[0].textColor,
                this.context,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 26.0),
                      height: 400,
                      child: MainCoCurricularMainGraph(
                        data: coCurricularMainPageData,
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
                          SizedBox(height: 16.0),
                          Container(
                            child: Column(
                              children: [
                                DonutGraph1(
                                  data: coCurricularDonut1Data,
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
                          SizedBox(height: 16.0),
                          Container(
                            child: PieChartNo2(
                              data: coCurricularPieNo2Data,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget analysisWidget() => Padding(
        padding: const EdgeInsets.only(top: 100.0, bottom: 20.0),
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
                behaviorSummary,
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
