import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:IntelliEd/users/teacher/presentation/widgets/notFoundWidget.dart';
import 'package:IntelliEd/users/teacher/presentation/widgets/studentWiseSubjectCardBottomSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClassDataPage extends StatefulWidget {
  @override
  _ClassDataPageState createState() => _ClassDataPageState();
}

class _ClassDataPageState extends State<ClassDataPage> {
  ScrollController _scrollController = ScrollController();
  String selectedClass;
  List _data = [], _searchedList = [];
  bool _searchFound = true;
  List<Color> colorPallete = [];

  @override
  void initState() {
    super.initState();
    selectedClass = classData['main'];
    buildDataList();
  }

  buildDataList() {
    int j = 0;
    for (int i = 0; i < classDataStudent['result'].length; i++) {
      _data.add({
        'data': classDataStudent['result'][i],
        // id is the roll no.
        'id': i + 1,
      });
      if (j <= 4) {
        colorPallete.add(colors[j++]);
        if (j == 4) {
          j = 0;
        }
      }
    }
    makeNewList('');
  }

  makeNewList(String value) {
    if (value.length != 0) {
      int found = 0;
      String studentData;
      _searchedList.clear();
      for (int i = 0; i < _data.length; i++) {
        studentData = _data[i]['data']['name'].toString().toLowerCase();
        if (studentData.contains(value.toLowerCase())) {
          found = 1;
          setState(() {
            _searchedList.add(_data[i]);
            _searchFound = true;
          });
        }
      }
      if (found == 0) {
        // Result not found
        setState(() {
          _searchedList.clear();
          _searchFound = false;
        });
      }
    } else {
      setState(() {
        _searchFound = true;
      });
      _searchedList.clear();
      for (int i = 0; i < _data.length; i++) {
        setState(() {
          _searchedList.add(_data[i]);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScopeNode _currentFocus = FocusScope.of(context);
        if (!_currentFocus.hasPrimaryFocus) {
          _currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFB0E3FF),
          title: Text(
            'Class Data',
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
        body: CupertinoScrollbar(
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 30.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 26.0),
                  width: size.width,
                  child: TextFormField(
                    decoration: inputTextStyle(),
                    onChanged: (val) {
                      makeNewList(val);
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                _searchFound
                    ? Container()
                    : Container(
                        margin: EdgeInsets.only(
                          top: size.height / 5.5,
                          left: 26.0,
                          right: 26.0,
                          bottom: size.height / 5.5,
                        ),
                        child: notFoundWidget(size),
                      ),
                for (int i = 0; i < _searchedList.length; i++)
                  GestureDetector(
                    onTap: () {
                      FocusScopeNode _currentFocus = FocusScope.of(context);
                      if (!_currentFocus.hasPrimaryFocus) {
                        _currentFocus.unfocus();
                      }
                      currentSelectedStudent =
                          _data[_searchedList[i]['id'] - 1]['data']['name'];
                      showStudentWiseSubjectCards(size, _searchedList[i]['id'],
                          currentSelectedStudent, context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Stack(
                        overflow: Overflow.clip,
                        children: [
                          Container(
                            margin: (i == _searchedList.length - 1)
                                ? EdgeInsets.only(
                                    top: 10.0,
                                    left: 26.0,
                                    right: 26.0,
                                    bottom: 30.0,
                                  )
                                : EdgeInsets.symmetric(
                                    vertical: 10.0,
                                    horizontal: 26.0,
                                  ),
                            padding: EdgeInsets.only(left: 26.0, right: 0.0),
                            height: 120.0,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xfff2f2f2).withOpacity(0.2),
                                  spreadRadius: 20,
                                  blurRadius: 15,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: size.width / 2,
                                      child: Text(
                                        _searchedList[i]['data']['name']
                                                    .length >
                                                19
                                            ? _searchedList[i]['data']['name']
                                                    .substring(0, 19) +
                                                "..."
                                            : _searchedList[i]['data']['name'],
                                        style: heading1.copyWith(
                                          fontSize: 18.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      _searchedList[i]['id'] < 10
                                          ? "Roll No. 0${_searchedList[i]['id']}"
                                          : "Roll No. ${_searchedList[i]['id']}",
                                      style: heading1.copyWith(
                                        fontSize: 15.0,
                                        color: Color(0xff00C968),
                                      ),
                                    ),
                                    SizedBox(width: 20.0),
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  children: [
                                    Text(
                                      'Academic Performance: ',
                                      style: subheading.copyWith(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    SizedBox(width: 5.0),
                                    Text(
                                      "${_searchedList[i]['data']['academicMarks']}/100",
                                      style: subheading.copyWith(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Co-curricular Performance: ',
                                      style: subheading.copyWith(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    SizedBox(width: 5.0),
                                    Text(
                                      "${_searchedList[i]['data']['cocurricularMarks']}/${_searchedList[i]['data']['cocurricularTotal']}",
                                      style: subheading.copyWith(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Attendance: ',
                                      style: subheading.copyWith(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    SizedBox(width: 5.0),
                                    Text(
                                      "${_searchedList[i]['data']['attendance']}%",
                                      style: subheading.copyWith(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 26.0,
                            top: 10.0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0),
                                ),
                                color: colorPallete[i],
                              ),
                              height: 120.0,
                              width: 6.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showOtherClassesBottomSheet(Size size) {
    String localSelectedClass = selectedClass;
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
                                    localSelectedClass = classData['main'];
                                  });
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  color:
                                      (classData['main'] == localSelectedClass)
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
                                                  localSelectedClass)
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
                                      localSelectedClass =
                                          classData['other'][i];
                                    });
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: (classData['other'][i] ==
                                            localSelectedClass)
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
                                                    localSelectedClass)
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
                      setState(() {
                        selectedClass = localSelectedClass;
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

  inputTextStyle() {
    return InputDecoration(
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            Icons.search_rounded,
            color: Color(0xff1CAAFA),
          ),
          onPressed: () {},
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.all(20.0),
      filled: true,
      fillColor: Color(0xFFE1F4FF),
      hintText: 'Search by name',
      hintStyle: heading1.copyWith(
        color: Color(0xFF1CAAFA),
        fontSize: 13.0,
      ),
    );
  }
}
