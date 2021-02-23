import 'dart:convert';
import 'package:IntelliEd/model/commanModel.dart';
import 'package:IntelliEd/routes/allRoutes.dart';
import 'package:IntelliEd/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../loadingPage.dart';

class AuthPage2 extends StatefulWidget {
  @override
  _AuthPage2State createState() => _AuthPage2State();
}

class _AuthPage2State extends State<AuthPage2> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  String _schoolID = "", _userID = "", _password = "";
  bool isVisible = false;
  int selected = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    checkSignInStatus();
  }

  checkSignInStatus() async {
    await Hive.initFlutter();
    await Hive.openBox('userData');
    bool boxExists = await Hive.boxExists('userData');
    if (boxExists) {
      var box = Hive.box('userData');
      var result = box.get('result').toString();
      box = await Hive.openBox('userData');

      if (result.contains('token')) {
        Map userData = json.decode(result);
        String user = userData.keys.toList()[1];
        if (user == 'student') {
          Navigator.pushReplacementNamed(context, '/student');
        } else if (user == 'teacher') {
          Navigator.pushReplacementNamed(context, '/teacher');
        } else if (user == 'parent') {
          Navigator.pushReplacementNamed(context, '/parent');
        }
      }
    }
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
        body: isLoading
            ? loadingPage(text: 'Signing In', size: size)
            : Container(
                height: size.height,
                width: size.width,
                child: Center(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Form(
                      key: _key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30.0),
                            child: Column(
                              children: [
                                SizedBox(height: 80.0),
                                Image(image: AssetImage(logoPath)),
                                SizedBox(height: 15.0),
                                Container(
                                  width: size.width / 1.35,
                                  child: Text(
                                    tagLine,
                                    style: subheading.copyWith(
                                      color: Color(0xFFA2A2A2),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30.0),
                            child: Column(
                              children: [
                                SizedBox(height: 35.0),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color(0xfff2f2f2).withOpacity(0.5),
                                        spreadRadius: 8,
                                        blurRadius: 12,
                                        offset: Offset(
                                            0, 5), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Material(
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: TextFormField(
                                      style: heading1.copyWith(
                                        color: Color(0xFF1CAAFA),
                                        fontSize: 14.0,
                                      ),
                                      initialValue: _schoolID,
                                      decoration: customInputDecoration(
                                        label: 'School ID',
                                        bgColor: Color(0xFFE1F4FF),
                                        textColor: Color(0xFF1CAAFA),
                                      ),
                                      onSaved: (schoolId) {
                                        _schoolID = schoolId;
                                      },
                                      validator: (val) {
                                        if (val.isEmpty)
                                          return 'Field mandatory';
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color(0xfff2f2f2).withOpacity(0.5),
                                        spreadRadius: 8,
                                        blurRadius: 12,
                                        offset: Offset(
                                            0, 5), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Material(
                                    shadowColor: Color(0xfff2f2f2),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: TextFormField(
                                      style: heading1.copyWith(
                                        fontSize: 14.0,
                                      ),
                                      initialValue: _userID,
                                      decoration: customInputDecoration(
                                        label: 'User ID',
                                        bgColor: Colors.white,
                                        textColor: Color(0xFF8C8C8C),
                                      ),
                                      onSaved: (userId) {
                                        _userID = userId;
                                      },
                                      validator: (val) {
                                        if (val.isEmpty)
                                          return 'Field mandatory';
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color(0xfff2f2f2).withOpacity(0.5),
                                        spreadRadius: 8,
                                        blurRadius: 12,
                                        offset: Offset(
                                            0, 5), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(30.0),
                                    shadowColor: Color(0xfff2f2f2),
                                    elevation: 0.0,
                                    child: TextFormField(
                                      style: heading1.copyWith(
                                        fontSize: 14.0,
                                      ),
                                      obscureText: !isVisible,
                                      initialValue: _password,
                                      decoration: customInputDecoration(
                                        label: 'Password',
                                        bgColor: Colors.white,
                                        textColor: Color(0xFF8C8C8C),
                                      ),
                                      onSaved: (pass) {
                                        _password = pass;
                                      },
                                      validator: (val) {
                                        if (val.isEmpty)
                                          return 'Field mandatory';
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40.0),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 330.0,
                                  height: 80.0,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 2.0),
                                        width: size.width,
                                        child: Text(
                                          'User Type',
                                          style: subheading.copyWith(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500,
                                            decoration: TextDecoration.none,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      Material(
                                        child: userSelectingWidget(size),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 60.0),
                                Container(
                                  width: 153.0,
                                  height: 43.0,
                                  child: FlatButton(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    color: Color(0xFF1CAAFA),
                                    onPressed: () {
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }

                                      validator();
                                    },
                                    child: Text(
                                      'Sign In',
                                      style: subheading.copyWith(
                                        color: Colors.white,
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Don’t have an account ?',
                                      style: subheading.copyWith(
                                        color: Color(0xFFA2A2A2),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        openMailApp();
                                      },
                                      child: Text(
                                        'CONTACT SUPPORT',
                                        style: heading2.copyWith(
                                          color: Color(0xFF1CAAFA),
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 40.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  InputDecoration customInputDecoration({
    @required String label,
    @required Color bgColor,
    @required Color textColor,
  }) {
    return InputDecoration(
      errorText: null,
      contentPadding: EdgeInsets.all(20.0),
      filled: true,
      fillColor: bgColor,
      hintText: label,
      hintStyle: heading1.copyWith(
        color: textColor,
        fontSize: 13.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide.none,
      ),
      suffixIcon: label == 'Password'
          ? IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                color: textColor,
              ),
              padding: EdgeInsets.only(right: 10.0),
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
            )
          : null,
    );
  }

  Widget userSelectingWidget(Size size) {
    double width = (size.width - 81.42) < 330.0 ? size.width - 81.42 : 330.0;
    return Container(
      width: width,
      height: 40.0,
      decoration: BoxDecoration(
        color: Color(0xFF00C968).withOpacity(0.3),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Stack(
        overflow: Overflow.clip,
        children: [
          AnimatedPositioned(
            curve: Curves.linear,
            duration: Duration(milliseconds: 300),
            left: selected == 0
                ? 0.0
                : selected == 1
                    ? width / 3
                    : 2 * (width / 3),
            bottom: 0.0,
            right: selected == 0
                ? 2 * (width / 3)
                : selected == 1
                    ? width / 3
                    : 0.0,
            top: 0.0,
            child: Container(
              width: width / 3,
              decoration: BoxDecoration(
                color: Color(0xFF00C968).withOpacity(0.8),
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
          Row(
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    selected = 0;
                  });
                },
                child: Container(
                  width: width / 3,
                  child: Center(
                    child: Text(
                      'Student',
                      style: subheading.copyWith(
                        color: selected == 0 ? Colors.white : Color(0xFF00C968),
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    selected = 1;
                  });
                },
                child: Container(
                  width: width / 3,
                  child: Center(
                    child: Text(
                      'Teacher',
                      style: subheading.copyWith(
                        color: selected == 1 ? Colors.white : Color(0xFF00C968),
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    selected = 2;
                  });
                },
                child: Container(
                  width: width / 3,
                  child: Center(
                    child: Text(
                      'Parent',
                      style: subheading.copyWith(
                        color: selected == 2 ? Colors.white : Color(0xFF00C968),
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  validator() {
    _key.currentState.save();

    _schoolID = _schoolID.trim();
    _userID = _userID.trim();
    _password = _password.trim();

    if (_key.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      switch (selected) {
        case 0:
          studentSignIn();
          break;
        case 1:
          teacherSignIn();
          break;
        case 2:
          parentSignIn();
          break;
        default:
      }
    }
  }

  Future studentSignIn() async {
    try {
      var response = await http.post(
        "$apiUrl/student/signin",
        body: jsonEncode(<String, String>{
          "admissionNumber": _userID,
          "password": _password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(
        Duration(seconds: 10),
      );
      var result = response.body.toString();

      var box = await Hive.openBox('userData');
      await box.put('result', result);
      if (result.contains('token')) {
        Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (context, _, __) => StudentHomePage(),
          ),
          (route) => false,
        );
      } else {
        throw Error();
      }
    } catch (e) {
      // Throw error
      setState(() {
        isLoading = false;
      });
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Sign In failed'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        ),
      );
    }
  }

  Future teacherSignIn() async {
    try {
      var response = await http.post(
        "$apiUrl/teacher/signin",
        body: jsonEncode(<String, String>{
          "email": _userID,
          "password": _password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(
        Duration(seconds: 10),
      );
      var result = response.body.toString();

      var box = await Hive.openBox('userData');
      await box.put('result', result);
      if (result.contains('token')) {
        Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (context, _, __) => TeacherHomePage(),
          ),
          (route) => false,
        );
      } else {
        throw Error();
      }
    } catch (e) {
      // Throw error
      setState(() {
        isLoading = false;
      });
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Sign In failed'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        ),
      );
    }
  }

  Future parentSignIn() async {
    try {
      var response = await http.post(
        "$apiUrl/parent/signin",
        body: jsonEncode(<String, String>{
          "studentAdmissionNumber": _userID,
          "password": _password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(
        Duration(seconds: 10),
      );
      var result = response.body.toString();

      var box = await Hive.openBox('userData');
      await box.put('result', result);
      if (result.contains('token')) {
        Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (context, _, __) => ParentHomePage(),
          ),
          (route) => false,
        );
      } else {
        throw Error();
      }
    } catch (e) {
      // Throw error
      setState(() {
        isLoading = false;
      });
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Sign In failed'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        ),
      );
    }
  }

  Future openMailApp() async {
    String url = "mailto:adhyansh1999@gmail.com";
    bool _canLaunch = await canLaunch(url);
    await launch(
      url,
    );
    if (_canLaunch) {
      await launch(
        url,
      );
    } else {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            'Oops something is broken from our end',
          ),
        ),
      );
    }
  }
}
