import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:IntelliEd/users/teacher/presentation/widgets/announcementSentPage.dart';
import 'package:flutter/material.dart';

class CreateAnnouncementPage extends StatefulWidget {
  @override
  _CreateAnnouncementPageState createState() => _CreateAnnouncementPageState();
}

class _CreateAnnouncementPageState extends State<CreateAnnouncementPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String selectedClass;
  bool students, parents;

  @override
  void initState() {
    super.initState();
    selectedClass = classData['main'];
    students = parents = true;
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
            'Create Announcement',
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
        body: Container(
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
                      announcementData = val;
                    },
                    validator: (val) {
                      if (val.isEmpty) return 'Field can\'t be empty';
                    },
                    initialValue: announcementData,
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
                Row(
                  children: [
                    SizedBox(width: 2.0),
                    Text(
                      'Send To',
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
                SizedBox(height: 30.0),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Container(
                      width: size.width / 2 - 52.0,
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: Color(0xff1CAAFA),
                            value: students,
                            onChanged: (val) {
                              setState(() {
                                students = val;
                              });
                            },
                          ),
                          Text(
                            'Students',
                            style: subheading.copyWith(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width / 2,
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: Color(0xff1CAAFA),
                            value: parents,
                            onChanged: (val) {
                              setState(() {
                                parents = val;
                              });
                            },
                          ),
                          Text(
                            'Parents',
                            style: subheading.copyWith(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 26.0),
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
            Icons.send_rounded,
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

  validate() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      if (!parents && !students) {
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            duration: Duration(seconds: 5),
            content: Text(
              'Both students and parents field cannot be unchecked',
            ),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {},
            ),
          ),
        );
      } else {
        // Announcement valid
        announcementData = "";
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnnouncementSentPage(),
          ),
        );
      }
    }
  }
}
