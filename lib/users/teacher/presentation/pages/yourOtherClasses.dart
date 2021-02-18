import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/teacher/model/teacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourOtherClasses extends StatefulWidget {
  @override
  _YourOtherClassesState createState() => _YourOtherClassesState();
}

class _YourOtherClassesState extends State<YourOtherClasses> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB0E3FF),
        title: Text(
          'Your Classes',
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
        width: size.width,
        height: size.height,
        child: CupertinoScrollbar(
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 26.0),
                  //Todo: Changes Done for future reference
                  child: Text(
                      "The page is divided into two groups. Here you can keep a record of marks of all the students you are teaching."),
                ),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(13.0),
                        child: Text(
                          'Your class',
                          style: heading2,
                        ),
                      ),
                      SizedBox(height: 13.0),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          currentSelectedClassForYourClassData =
                              classData['main'];
                          Navigator.pushNamed(
                              context, '/teacher/otherClasses/marks');
                        },
                        child: classNameWidget(
                          size,
                          bgcolor: Color(0xffAFFFD9),
                          textColor: Color(0xff00C968),
                          className: classData['main'],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(13.0),
                        child: Text(
                          'Your other classes',
                          style: heading2,
                        ),
                      ),
                      SizedBox(height: 13.0),
                      Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          for (int i = 0; i < classData['other'].length; i++)
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                //TODO: Use this to show different data acc. to selected class
                                currentSelectedClassForYourClassData =
                                    classData['other'][i];
                                Navigator.pushNamed(
                                    context, '/teacher/otherClasses/marks');
                              },
                              child: classNameWidget(
                                size,
                                bgcolor: Color(0xffB0E3FF),
                                textColor: Color(0xff1CAAFA),
                                className: classData['other'][i],
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget classNameWidget(
    Size size, {
    @required Color bgcolor,
    @required Color textColor,
    @required String className,
  }) {
    return Container(
      margin: EdgeInsets.only(
        left: 13.0,
        right: 13.0,
        bottom: 16.0,
      ),
      // height: (size.width - 78.0) / 2 > 200.0 ? 140.0 : (size.width - 78.0) / 2,
      height: 55.0,
      width: (size.width - 78) / 2 > 200.0 ? 140.0 : (size.width - 78) / 2,
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(
          30.0,
        ),
      ),
      child: Center(
        child: Text(
          className,
          style: heading1.copyWith(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
