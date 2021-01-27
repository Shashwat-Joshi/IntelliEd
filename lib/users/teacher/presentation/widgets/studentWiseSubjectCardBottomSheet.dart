import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/presentation/widgets/studentWiseAnalyticsCard.dart';
import 'package:flutter/material.dart';

showStudentWiseSubjectCards(
    Size size, int id, String name, BuildContext context) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    context: context,
    builder: (context) => Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 26.0,
            right: 26.0,
            top: 45.0,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: (size.width - 52.0) / 1.3,
                          child: Text(
                            name,
                            style: heading2.copyWith(
                              color: Color(0xff636363),
                            ),
                            softWrap: true,
                          ),
                        ),
                        Text(
                          id < 10 ? '0$id' : id.toString(),
                          style: heading2.copyWith(
                            color: Color(0xff00C968),
                          ),
                          softWrap: true,
                        ),
                      ],
                    ),
                    Divider(thickness: 2),
                    SizedBox(height: 20.0),
                  ],
                ),
                StudentWiseAnalyticsWidget(size: size),
              ],
            ),
          ),
        ),
        Positioned(
          top: 20.0,
          left: size.width / 2 - 20,
          right: size.width / 2 - 20,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey,
            ),
            height: 5.0,
            width: 40.0,
          ),
        ),
      ],
    ),
  );
}
