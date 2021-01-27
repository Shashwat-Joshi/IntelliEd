import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:IntelliEd/users/teacher/presentation/widgets/analyticsCardWidget.dart';
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
        for (int i = 0; i < 4; i++)
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/teacher/analytics/classData/$i');
            },
            child: analyticsCardWidget(
              studentWiseAnalyticsFeatures[i].heading,
              studentWiseAnalyticsFeatures[i].subHeading,
              studentWiseAnalyticsFeatures[i].imagePath,
              studentWiseAnalyticsFeatures[i].color,
              studentWiseAnalyticsFeatures[i].textColor,
              size,
            ),
          ),
      ],
    );
  }
}
