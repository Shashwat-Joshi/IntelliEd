import 'dart:convert';

import 'package:IntelliEd/model/commanModel.dart';
import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:IntelliEd/users/teacher/presentation/widgets/announcementSentPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:http/http.dart' as http;

class AddDataToCalendarPage extends StatefulWidget {
  final String selectedClass;

  AddDataToCalendarPage({
    @required this.selectedClass,
  });
  @override
  _AddDataToCalendarPageState createState() => _AddDataToCalendarPageState();
}

class _AddDataToCalendarPageState extends State<AddDataToCalendarPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String selectedClass, calenderData, selectedSubject, currentYear;
  bool students, parents;

  bool isLoading = false;

  int isSelectedWeek;
  DateTime selectedDate;
  String currentMonth;
  @override
  void initState() {
    super.initState();
    isSelectedWeek = getCurrentWeek();
    selectedClass = widget.selectedClass;
    selectedSubject = subjects[0];
    currentMonth = monthNames[DateTime.now().month - 1];
    currentYear = DateTime.now().year.toString();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xFFB0E3FF),
          title: Text(
            'Update Calendar',
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
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                height: size.height - 56.0,
                margin: EdgeInsets.symmetric(horizontal: 26.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 26.0),
                      Form(
                        key: _key,
                        child: TextFormField(
                          onChanged: (val) {
                            calenderData = val;
                          },
                          validator: (val) {
                            if (val.isEmpty) return 'Field can\'t be empty';
                          },
                          initialValue: calenderData,
                          minLines: 10,
                          maxLines: 10,
                          maxLength: 250,
                          scrollPhysics: BouncingScrollPhysics(),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20.0),
                            hintText: 'Type your message here...',
                            alignLabelWithHint: true,
                            filled: true,
                            fillColor: Color(0xffF1F1F1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 26.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width / 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Week',
                                    style: heading1.copyWith(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 15.0),
                                  Row(
                                    children: [
                                      for (int i = 1; i <= 4; i++)
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isSelectedWeek = i;
                                            });
                                          },
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 300),
                                            margin: (i == 2)
                                                ? EdgeInsets.symmetric(
                                                    horizontal: 7.0)
                                                : (i == 3)
                                                    ? EdgeInsets.only(
                                                        right: 7.0)
                                                    : EdgeInsets.all(0.0),
                                            height: 40.0,
                                            width: 40.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: (i == isSelectedWeek)
                                                  ? Color(0xff00C968)
                                                  : Color(0xffD2D2D2),
                                            ),
                                            child: Center(
                                              child: Text(
                                                i.toString(),
                                                style: viewAllStyle.copyWith(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Month',
                                    style: heading1.copyWith(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 15.0),
                                  GestureDetector(
                                    onTap: () {
                                      // TODO: This is not the right way change this later
                                      showMonthPicker(
                                        context: context,
                                        firstDate: DateTime(
                                          DateTime.now().year - 1,
                                          DateTime.april,
                                        ),
                                        lastDate: DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                        ),
                                        initialDate: DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                        ),
                                      ).then((date) {
                                        if (date != null) {
                                          setState(() {
                                            selectedDate = date;
                                          });
                                        }

                                        currentMonth =
                                            monthNames[selectedDate.month - 1];
                                        print(currentMonth);
                                      });
                                    },
                                    child: Container(
                                      height: 40.0,
                                      padding: EdgeInsets.only(
                                        top: 7.0,
                                        bottom: 6.0,
                                        left: 20.0,
                                        right: 15.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xff00C968),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                currentMonth.substring(0, 3),
                                                style: heading1.copyWith(
                                                  fontSize: 18.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 10.0),
                                              Icon(
                                                Icons.calendar_today_outlined,
                                                size: 17.0,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          SizedBox(width: 2.0),
                          Text(
                            'Class',
                            style: heading1.copyWith(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              showOtherClassesBottomSheet(size);
                            },
                            child: Container(
                              width: 125.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Class $selectedClass",
                                    style: heading1.copyWith(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff1CAAFA),
                                    ),
                                  ),
                                  SizedBox(width: 15.0),
                                  Icon(
                                    Icons.cast_for_education_rounded,
                                    size: 22.0,
                                    color: Color(0xff1CAAFA),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 2.0),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          SizedBox(width: 2.0),
                          Text(
                            'Subject',
                            style: heading1.copyWith(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              showOtherSubjectsBottomSheet(size);
                            },
                            child: Container(
                              width: 125.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    selectedSubject[0].toUpperCase() +
                                        selectedSubject.substring(1),
                                    style: heading1.copyWith(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff1CAAFA),
                                    ),
                                  ),
                                  SizedBox(width: 15.0),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 2.0),
                        ],
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
        floatingActionButton: FloatingActionButton(
          splashColor: Colors.transparent,
          highlightElevation: 0.0,
          elevation: 0.0,
          backgroundColor: Color(0xff1CAAFA),
          child: Icon(
            Icons.save,
          ),
          onPressed: () {
            validate();
          },
        ),
      ),
    );
  }

  showOtherClassesBottomSheet(Size size) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        isScrollControlled: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setBottomSheetState) {
            return Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 26.0,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 30.0),
                        Text(
                          'Your other classes',
                          style: heading2,
                        ),
                        SizedBox(height: 20.0),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setBottomSheetState(() {
                                  setState(() {
                                    selectedClass = classData['main'];
                                  });
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: (classData['main'] == selectedClass)
                                      ? Color(0xff00C968).withOpacity(0.3)
                                      : Color(0xFFB0E3FF),
                                ),
                                margin: EdgeInsets.all(7.0),
                                width: (size.width / 2) - 52.0,
                                height: 50.0,
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        classData['main'],
                                        style: heading1.copyWith(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                          color: (classData['main'] ==
                                                  selectedClass)
                                              ? Color(0xff00C968)
                                              : Color(0xff1CAAFA),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            for (int i = 0; i < classData['other'].length; i++)
                              GestureDetector(
                                onTap: () {
                                  setBottomSheetState(() {
                                    setState(() {
                                      selectedClass = classData['other'][i];
                                    });
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color:
                                        (classData['other'][i] == selectedClass)
                                            ? Color(0xff00C968).withOpacity(0.3)
                                            : Color(0xFFB0E3FF),
                                  ),
                                  margin: EdgeInsets.all(7.0),
                                  width: (size.width / 2) - 52.0,
                                  height: 50.0,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          classData['other'][i],
                                          style: heading1.copyWith(
                                            fontSize: 18.0,
                                            color: (classData['other'][i] ==
                                                    selectedClass)
                                                ? Color(0xff00C968)
                                                : Color(0xff1CAAFA),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 26.0,
                  top: 23.0,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.check,
                      color: Color(0xff00C968),
                    ),
                  ),
                ),
              ],
            );
          });
        });
  }

  showOtherSubjectsBottomSheet(Size size) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        isScrollControlled: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setBottomSheetState) {
            return Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 26.0,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 30.0),
                        Text(
                          'Your other subjects',
                          style: heading2,
                        ),
                        SizedBox(height: 20.0),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            for (int i = 0; i < subjects.length; i++)
                              GestureDetector(
                                onTap: () {
                                  setBottomSheetState(() {
                                    setState(() {
                                      selectedSubject = subjects[i];
                                    });
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: (subjects[i] == selectedSubject)
                                        ? Color(0xff00C968).withOpacity(0.3)
                                        : Color(0xFFB0E3FF),
                                  ),
                                  margin: EdgeInsets.all(7.0),
                                  width: (size.width / 2) - 52.0,
                                  height: 50.0,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          subjects[i][0].toUpperCase() +
                                              subjects[i].substring(1),
                                          style: heading1.copyWith(
                                            fontSize: 18.0,
                                            color:
                                                (subjects[i] == selectedSubject)
                                                    ? Color(0xff00C968)
                                                    : Color(0xff1CAAFA),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 26.0,
                  top: 23.0,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.check,
                      color: Color(0xff00C968),
                    ),
                  ),
                ),
              ],
            );
          });
        });
  }

  validate() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      // Announcement valid
      postAnnouncement();
    }
  }

  Future postAnnouncement() async {
    Map result = {};
    setState(() {
      isLoading = true;
    });
    try {
      var response = await http.post('$apiUrl/calender/add',
          body: jsonEncode(
            <String, Object>{
              "studentClass": int.parse(
                  selectedClass.substring(0, selectedClass.length - 1)),
              "section": selectedClass[selectedClass.length - 1],
              "month": currentMonth.toLowerCase(),
              "year": int.parse(currentYear),
              "week$isSelectedWeek": [
                {
                  "subName": selectedSubject,
                  "text": calenderData,
                }
              ],
            },
          ),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${userData['token']}',
          }).timeout(Duration(seconds: 10));
      calenderData = "";
      result = json.decode(response.body);
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Failed to update calendar"),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      ));
    }
    if (result["success"]) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, _, __) => SentPage(
            text: 'Academic calendar updated successfully',
          ),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Failed to update calendar"),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      ));
    }
  }
}
