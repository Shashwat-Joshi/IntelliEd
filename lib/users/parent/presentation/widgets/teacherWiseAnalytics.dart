import 'package:IntelliEd/users/parent/model/parent.dart';
import 'package:IntelliEd/widgets/analyticsCardWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentWiseAnalyticsWidgetForParent extends StatelessWidget {
  final Size size;

  StudentWiseAnalyticsWidgetForParent({@required this.size});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: 20.0),
        for (int i = 0; i < studentWiseAnalyticsFeaturesForParent.length; i++)
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context, '/parent/childPerformance/classData/$i');
            },
            child: Container(
              padding: EdgeInsets.only(
                left: 26.0,
                right: 26.0,
              ),
              child: analyticsCardWidget(
                studentWiseAnalyticsFeaturesForParent[i].heading,
                studentWiseAnalyticsFeaturesForParent[i].subHeading,
                studentWiseAnalyticsFeaturesForParent[i].imagePath,
                studentWiseAnalyticsFeaturesForParent[i].color,
                studentWiseAnalyticsFeaturesForParent[i].textColor,
                size,
              ),
            ),
          ),
      ],
    );
  }
}
