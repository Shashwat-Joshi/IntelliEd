import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:IntelliEd/widgets/analyticsCardWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentWiseAnalyticsWidget extends StatelessWidget {
  final Size size;
  StudentWiseAnalyticsWidget({@required this.size});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        for (int i = 0; i < studentWiseAnalyticsFeatures.length; i++)
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/teacher/analytics/classData/$i');
            },
            child: Container(
              padding: EdgeInsets.only(
                left: 26.0,
                right: 26.0,
              ),
              child: analyticsCardWidget(
                studentWiseAnalyticsFeatures[i].heading,
                studentWiseAnalyticsFeatures[i].subHeading,
                studentWiseAnalyticsFeatures[i].imagePath,
                studentWiseAnalyticsFeatures[i].color,
                studentWiseAnalyticsFeatures[i].textColor,
                size,
              ),
            ),
          ),
      ],
    );
  }
}
