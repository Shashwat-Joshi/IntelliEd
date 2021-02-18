import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/model/student.dart';
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
      body: CupertinoScrollbar(
        radius: Radius.circular(20.0),
        thickness: 4.0,
        controller: _scrollController,
        child: CustomScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
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
                  SizedBox(height: 30.0),
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
                  SizedBox(height: 26.0),
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
                            data: coCurricularPieNo2Data,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        pieIndicatorWidgets(),
                      ],
                    ),
                  ),
                  SizedBox(height: 26.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 26.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Analysis',
                          style: heading2,
                        ),
                        SizedBox(height: 26.0),
                        Text(
                          "Timely check is important when it comes to improvement. Co curricular activities are important in a way or the other to bring some positive changes in your personality and eliminate the negative one. So keep a timely check on the data and keep improving.",
                          style: viewAllStyle.apply(
                            color: Color(0xFFACACAC),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 26.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
