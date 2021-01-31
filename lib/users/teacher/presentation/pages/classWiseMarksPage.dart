import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClassWiseMarksPage extends StatefulWidget {
  @override
  _ClassWiseMarksPageState createState() => _ClassWiseMarksPageState();
}

class _ClassWiseMarksPageState extends State<ClassWiseMarksPage> {
  String selectedExam = examNames.keys.toList()[0];
  ScrollController _scrollController = ScrollController();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double widthForContainer = size.width - 72.0;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFB0E3FF),
          title: Text(
            currentSelectedClassForYourClassData,
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(Icons.save_rounded),
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  validateValues();
                },
              ),
            ),
          ],
        ),
        body: Container(
          height: size.height,
          width: size.width,
          child: CupertinoScrollbar(
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    width: size.width - 56.0,
                    margin: EdgeInsets.symmetric(horizontal: 26.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Marks',
                          style: heading2,
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            showTestsBottomSheet(size);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 26.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Color(0xff00C968),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  selectedExam,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Form(
                    key: _globalKey,
                    child: Column(
                      children: [
                        for (int i = 0; i < perClassMarks['result'].length; i++)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 26.0),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: 12.0),
                                    Container(
                                      height: 35.0,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: widthForContainer * 0.07,
                                            child: (i + 1) > 9
                                                ? Text(
                                                    "${i + 1}",
                                                    style: heading1.copyWith(
                                                      fontSize: 15.0,
                                                      color: Color(0xff1CAAFA),
                                                    ),
                                                  )
                                                : Text(
                                                    "0${i + 1}",
                                                    style: heading1.copyWith(
                                                      fontSize: 15.0,
                                                      color: Color(0xff1CAAFA),
                                                    ),
                                                  ),
                                          ),
                                          SizedBox(width: 10.0),
                                          Container(
                                            width: widthForContainer * 0.73,
                                            child: Text(
                                              perClassMarks['result'][i]
                                                  ['name'],
                                              style: heading1.copyWith(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10.0),
                                          Container(
                                            width: widthForContainer * 0.20,
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Theme(
                                                data: ThemeData(
                                                  primaryColor:
                                                      Color(0xff1CAAFA),
                                                ),
                                                child: TextFormField(
                                                  textAlign: TextAlign.center,
                                                  style: heading1.copyWith(
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration:
                                                      customMarksFieldDecoration(),
                                                  initialValue:
                                                      perClassMarks['result'][i]
                                                              ['marks']
                                                          .toString(),
                                                  validator: (val) {
                                                    if (double.parse(val) >
                                                        perClassMarks[
                                                            'maxMarks'])
                                                      return '';
                                                  },
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(thickness: 1.0),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showTestsBottomSheet(Size size) {
    String locallySelectedExam = selectedExam;
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
                          'Exams',
                          style: heading2,
                        ),
                        SizedBox(height: 20.0),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            for (int i = 0; i < examNames.length; i++)
                              GestureDetector(
                                onTap: () {
                                  setBottomSheetState(() {
                                    if (examNames.values.toList()[i] == 1) {
                                      locallySelectedExam =
                                          examNames.keys.toList()[i];
                                    }
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        color: (examNames.keys.toList()[i] ==
                                                locallySelectedExam)
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
                                              examNames.keys.toList()[i],
                                              style: heading1.copyWith(
                                                fontSize: 18.0,
                                                color: (examNames.keys
                                                            .toList()[i] ==
                                                        locallySelectedExam)
                                                    ? Color(0xff00C968)
                                                    : Color(0xff1CAAFA),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        color:
                                            (examNames.values.toList()[i] == 0)
                                                ? Colors.white.withOpacity(0.5)
                                                : Colors.transparent,
                                      ),
                                      margin: EdgeInsets.all(7.0),
                                      width: (size.width / 2) - 52.0,
                                      height: 50.0,
                                    ),
                                  ],
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
                      setState(() {
                        selectedExam = locallySelectedExam;
                      });
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

  InputDecoration customMarksFieldDecoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.all(10.0),
      errorStyle: TextStyle(height: 0.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          width: 1.0,
        ),
      ),
    );
  }

  validateValues() {
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
    }
  }
}
