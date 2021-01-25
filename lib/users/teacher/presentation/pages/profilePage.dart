import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:IntelliEd/widgets/profileIcon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TeacherProfilePage extends StatefulWidget {
  @override
  _TeacherProfilePageState createState() => _TeacherProfilePageState();
}

class _TeacherProfilePageState extends State<TeacherProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Image.asset('assets/student/images/logo.png'),
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFF00C968),
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 7.0),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {},
            icon: Icon(
              Icons.edit_rounded,
              color: Color(0xFF00C968),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 70.0),
            height: 280,
            decoration: BoxDecoration(
              color: Color(0xFFE8F7FF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 1.0,
                ),
                Hero(
                  tag: "profilepic",
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: profileIcon(106.0, 106.0),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Shashwat Joshi',
                      style: heading1,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '12-C',
                      style: viewAllStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 7.0,
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            height: size.height - 280.0,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.0),
                  Text('Details', style: heading2),
                  SizedBox(height: 25.0),
                  Column(
                    children: profilePageDetailsWidget(size),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> profilePageDetailsWidget(Size size) {
    return [
      ageWidget(),
      SizedBox(height: 30.0),
      genderWidget(),
      SizedBox(height: 30.0),
      bloodGroupWidget(),
      SizedBox(height: 30.0),
      emailWidget(size),
      SizedBox(height: 30.0),
      contactWidget(size),
      SizedBox(height: 30.0),
      emergencyWidget(size),
      SizedBox(height: 30.0),
      Divider(thickness: 1.5),
      SizedBox(height: 30.0),
    ];
  }

  Widget ageWidget() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.person,
            color: Color(0xFF6C63FF),
          ),
          SizedBox(width: 25.0),
          Container(
            width: 100.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.0),
                Text(
                  'Age',
                  style: heading1.copyWith(
                    color: Color(0xFF6C63FF),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 50.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                teacherDetails.age,
                style: heading1.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget genderWidget() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 7.0),
          FaIcon(
            teacherDetails.gender.toLowerCase() == 'm'
                ? FontAwesomeIcons.male
                : FontAwesomeIcons.female,
            color: Colors.grey,
          ),
          SizedBox(width: 35.0),
          Container(
            width: 100.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.0),
                Text(
                  'Gender',
                  style: heading1.copyWith(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 50.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                teacherDetails.gender,
                style: heading1.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bloodGroupWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 22.0,
          width: 22.0,
          child: Image(
            color: Color(0xFFFF5252),
            image: AssetImage(
              'assets/student/images/blood-drop.png',
            ),
          ),
        ),
        SizedBox(width: 25.0),
        Container(
          width: 100.0,
          child: Text(
            'Blood Group',
            style: heading1.copyWith(
              color: Color(0xFFFF5252),
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(width: 50.0),
        Text(
          teacherDetails.bloodGroup,
          style: heading1.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget emailWidget(Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.mail_outline,
          color: Color(0xFF28C077),
        ),
        SizedBox(width: 25.0),
        Container(
          width: 100.0,
          child: Text(
            'Email',
            style: heading1.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF28C077),
            ),
          ),
        ),
        SizedBox(width: 50.0),
        Container(
          width: size.width - 250.0,
          child: Text(
            teacherDetails.email,
            style: heading1.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget contactWidget(Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.phone_iphone,
          color: Color(0xFF1CAAFA),
        ),
        SizedBox(width: 25.0),
        Container(
          width: 100.0,
          child: Text(
            'Phone',
            style: heading1.copyWith(
              color: Color(0xFF1CAAFA),
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(width: 50.0),
        Container(
          width: size.width - 250.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < teacherDetails.phoneNumbers.length; i++)
                Container(
                  margin:
                      i != 0 ? EdgeInsets.only(top: 10.0) : EdgeInsets.all(0.0),
                  child: Text(
                    teacherDetails.phoneNumbers[i],
                    style: heading1.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget emergencyWidget(Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.call_rounded,
          color: Color(0xFFFF6060),
        ),
        SizedBox(width: 25.0),
        Container(
          width: 100.0,
          child: Text(
            'Emergency',
            style: heading1.copyWith(
              color: Color(0xFFFF6060),
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(width: 50.0),
        Container(
          width: size.width - 250.0,
          child: Text(
            teacherDetails.emergencyContact,
            style: heading1.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
