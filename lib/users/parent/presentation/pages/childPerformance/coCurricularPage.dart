import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/parent/model/parent.dart';
import 'package:IntelliEd/widgets/graphs/CoCurricularGraphs/coCurricularMainGraph.dart';
import 'package:IntelliEd/widgets/graphs/CoCurricularGraphs/donutGraph1.dart';
import 'package:IntelliEd/widgets/graphs/CoCurricularGraphs/indicators/indicatorForDonut.dart';
import 'package:IntelliEd/widgets/graphs/CoCurricularGraphs/pieChartNo2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentCoCurricularPageForParent extends StatefulWidget {
  @override
  _StudentCoCurricularPageForParentState createState() =>
      _StudentCoCurricularPageForParentState();
}

class _StudentCoCurricularPageForParentState
    extends State<StudentCoCurricularPageForParent> {
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
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
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
              SizedBox(height: 26.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 26.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Skillsets',
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
      ),
    );
  }
}
