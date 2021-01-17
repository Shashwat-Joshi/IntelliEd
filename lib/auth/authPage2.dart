import 'package:IntelliEd/model/commanModel.dart';
import 'package:IntelliEd/style/theme.dart';
import 'package:flutter/material.dart';

class AuthPage2 extends StatefulWidget {
  @override
  _AuthPage2State createState() => _AuthPage2State();
}

class _AuthPage2State extends State<AuthPage2> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  String _schoolID, _userID, _password;
  bool isVisible = false;
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 80.0),
                      Image(image: AssetImage(logoPath)),
                      SizedBox(height: 15.0),
                      Container(
                        width: size.width / 1.35,
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit.',
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
                  SizedBox(height: 35.0),
                  TextFormField(
                    style: heading1.copyWith(
                      color: Color(0xFF1CAAFA),
                      fontSize: 16.0,
                    ),
                    decoration: customInputDecoration(
                      label: 'School ID',
                      bgColor: Color(0xFFE1F4FF),
                      textColor: Color(0xFF1CAAFA),
                    ),
                    onSaved: (schoolId) {
                      _schoolID = schoolId;
                    },
                    validator: (val) {
                      if (val.isEmpty) return 'Field mandatory';
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: heading1.copyWith(
                      fontSize: 16.0,
                    ),
                    decoration: customInputDecoration(
                      label: 'User ID',
                      bgColor: Color(0xFFF3F3F3),
                      textColor: Color(0xFF8C8C8C),
                    ),
                    onSaved: (userId) {
                      _userID = userId;
                    },
                    validator: (val) {
                      if (val.isEmpty) return 'Field mandatory';
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: heading1.copyWith(
                      fontSize: 16.0,
                    ),
                    obscureText: !isVisible,
                    decoration: customInputDecoration(
                      label: 'Password',
                      bgColor: Color(0xFFF3F3F3),
                      textColor: Color(0xFF8C8C8C),
                    ),
                    onSaved: (pass) {
                      _password = pass;
                    },
                    validator: (val) {
                      if (val.isEmpty) return 'Field mandatory';
                    },
                  ),
                  SizedBox(height: 40.0),
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
                        userSelectingWidget(),
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
                  SizedBox(height: 20.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don’t have an account, ',
                          style: subheading.copyWith(
                            color: Color(0xFFA2A2A2),
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        TextSpan(
                          text: 'CONTACT SUPPORT',
                          style: heading2.copyWith(
                            color: Color(0xFF1CAAFA),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                ],
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
      contentPadding: EdgeInsets.all(20.0),
      filled: true,
      fillColor: bgColor,
      hintText: label,
      hintStyle: heading1.copyWith(
        color: textColor,
        fontSize: 16.0,
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

  Widget userSelectingWidget() {
    return Container(
      width: 330.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Color(0xFF00C968).withOpacity(0.3),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Stack(
        overflow: Overflow.clip,
        children: [
          AnimatedPositioned(
            curve: Curves.decelerate,
            duration: Duration(milliseconds: 300),
            left: selected == 0
                ? 0.0
                : selected == 1
                    ? 110.0
                    : 220.0,
            bottom: 0.0,
            right: selected == 0
                ? 220.0
                : selected == 1
                    ? 110.0
                    : 0.0,
            top: 0.0,
            child: Container(
              width: 110.0,
              decoration: BoxDecoration(
                color: Color(0xFF00C968).withOpacity(0.8),
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 0;
                  });
                },
                child: Container(
                  width: 110.0,
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 1;
                  });
                },
                child: Container(
                  width: 110.0,
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 2;
                  });
                },
                child: Container(
                  width: 110.0,
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
    if (_key.currentState.validate()) {
      _key.currentState.save();
      Navigator.pushNamed(context, '/student');
    }
  }
}
