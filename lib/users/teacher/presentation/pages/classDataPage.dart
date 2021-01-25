import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:flutter/material.dart';

class ClassDataPage extends StatefulWidget {
  @override
  _ClassDataPageState createState() => _ClassDataPageState();
}

class _ClassDataPageState extends State<ClassDataPage> {
  ScrollController _scrollController = ScrollController();
  String selectedClass;
  List _data = [], _searchedList = [];
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
      _data.add(classDataStudent['result'][i]);
      if (j <= 4) {
        print(j);
        colorPallete.add(colors[j++]);
        if (j == 4) {
          j = 0;
        }
      }
    }
    for (int i = 0; i < classDataStudent['result'].length; i++) {
      _data.add(classDataStudent['result'][i]);
      if (j <= 4) {
        print(j);
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
      String studentData;
      _searchedList.clear();
      for (int i = 0; i < _data.length; i++) {
        studentData = _data[i]['name'].toString().toLowerCase();
        if (studentData.contains(value.toLowerCase())) {
          setState(() {
            _searchedList.add(_data[i]);
          });
        }
      }
    } else {
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

    return Scaffold(
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
        actions: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              showOtherClassesBottomSheet(size);
            },
            child: Container(
              padding: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                color: Color(0xff1CAAFA).withOpacity(0.4),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Class $selectedClass",
                    style: heading1.copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Icon(
                    Icons.school_rounded,
                    size: 22.0,
                    color: Colors.white,
                  ),
                  SizedBox(width: 15.0),
                ],
              ),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            // SizedBox(height: 30.0),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 26.0),
            //   width: size.width,
            //   child: TextFormField(
            //     decoration: inputTextStyle(),
            //     onChanged: (val) {
            //       makeNewList(val);
            //     },
            //   ),
            // ),
            Container(
              width: size.width,
              height: size.height - 88.0,
              child: Scrollbar(
                controller: _scrollController,
                child: SingleChildScrollView(
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
                      for (int i = 0; i < _searchedList.length; i++)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Stack(
                            overflow: Overflow.clip,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 26.0,
                                ),
                                padding:
                                    EdgeInsets.only(left: 26.0, right: 5.0),
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
                                      color: Color(0xfff2f2f2).withOpacity(0.5),
                                      spreadRadius: 8,
                                      blurRadius: 12,
                                      offset: Offset(
                                          0, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 13.0),
                                    Row(
                                      children: [
                                        Text(
                                          _searchedList[i]['name'],
                                          style: heading1.copyWith(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "Roll No. ${i + 1}",
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
                                          "${_searchedList[i]['academicMarks']}/100",
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
                                          "${_searchedList[i]['cocurricularMarks']}/${_searchedList[i]['cocurricularTotal']}",
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
                                          "${_searchedList[i]['attendance']}%}",
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
                                      topLeft: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                    ),
                                    color: colorPallete[i],
                                  ),
                                  height: 120.0,
                                  width: 7.0,
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
          ],
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
      hintText: 'Search',
      hintStyle: heading1.copyWith(
        color: Color(0xFF1CAAFA),
        fontSize: 13.0,
      ),
    );
  }
}
