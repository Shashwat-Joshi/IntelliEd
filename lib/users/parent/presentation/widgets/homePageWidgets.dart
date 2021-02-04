import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/parent/model/parent.dart';
import 'package:IntelliEd/widgets/rowOfViewAll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                Container(
                  decoration: BoxDecoration(
                    color: analyticsWidgetData[i].bgColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  width: (size.width - 60) / 2,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
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
            ],
          ),
        ],
      ),
    );

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
