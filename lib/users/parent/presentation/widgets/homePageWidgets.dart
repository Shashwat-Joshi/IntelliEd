import 'package:IntelliEd/users/parent/presentation/widgets/teacherWiseAnalytics.dart';
import 'package:flutter/material.dart';
import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/parent/model/parent.dart';
import 'package:IntelliEd/widgets/rowOfViewAll.dart';
import 'package:flutter/cupertino.dart';

Widget parentAnnouncementWidget(BuildContext context) => Container(
      child: Column(
        children: [
          SizedBox(height: 27.0),
          rowofViewAll('Announcements', context, '/parent/announcements'),
          SizedBox(height: 14.0),
          Text(
            announcementText['0'],
            style: viewAllStyle.apply(
              color: Color(0xFFACACAC),
            ),
          ),
          Divider(
            thickness: 1.5,
          ),
          Text(
            announcementText['0'],
            style: viewAllStyle.apply(
              color: Color(0xFFACACAC),
            ),
          ),
          Divider(thickness: 1.5),
        ],
      ),
    );

Widget analyticsWidget(BuildContext context, Size size) => Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 27.0),
          rowofViewAll('Analytics', context, '/parent/announcements'),
          SizedBox(height: 14.0),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: 20.0,
            runSpacing: 20.0,
            children: [
              for (int i = 0; i < analyticsWidgetData.length; i++)
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    if (i == 0) {
                      showStudentWiseSubjectCards(size, context);
                    } else {
                      Navigator.pushNamed(context, '/parent/analytics/$i');
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: analyticsWidgetData[i].bgColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    width: (size.width - 60) / 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            analyticsWidgetData[i].heading,
                            style: heading1.copyWith(
                              fontSize: 16.0,
                              color: analyticsWidgetData[i].textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 7.0),
                          Text(
                            analyticsWidgetData[i].subheading,
                            style:
                                viewAllStyle.copyWith(color: Color(0xFF717171)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );

showStudentWiseSubjectCards(Size size, BuildContext context) {
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
            top: 30.0,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                StudentWiseAnalyticsWidgetForParent(size: size),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10.0,
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

Widget calendarWidget(BuildContext context) => Container(
      child: Column(
        children: [
          SizedBox(height: 27.0),
          rowofViewAll('Calendar', context, '/parent/calendar'),
          SizedBox(height: 14.0),
          Text(
            announcementText['0'],
            style: viewAllStyle.apply(
              color: Color(0xFFACACAC),
            ),
          ),
          Divider(
            thickness: 1.5,
          ),
        ],
      ),
    );
