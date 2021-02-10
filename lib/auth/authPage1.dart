import 'dart:convert';
import 'package:IntelliEd/model/commanModel.dart';
import 'package:IntelliEd/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../loadingPage.dart';

class AuthPage1 extends StatefulWidget {
  @override
  _AuthPage1State createState() => _AuthPage1State();
}

class _AuthPage1State extends State<AuthPage1> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    checkSignInStatus();
  }

  checkSignInStatus() {
    Future.delayed(Duration(seconds: 2), () async {
      await Hive.initFlutter();
      await Hive.openBox('userData');

      bool boxExists = await Hive.boxExists('userData');
      if (boxExists) {
        var box = Hive.box('userData');
        var result = box.get('result').toString();
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
        } else {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading
          ? loadingPage(text: 'Validating User', size: size)
          : Stack(
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 55.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xfff2f2f2),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  height: size.height,
                  width: size.width,
                  child: Center(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
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
                          SizedBox(height: 35.0),
                          Container(
                            height: 210.0,
                            width: 210.0,
                            child: Image(
                              fit: BoxFit.contain,
                              image: AssetImage('assets/loginPage.png'),
                            ),
                          ),
                          SizedBox(height: 70.0),
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
                                Navigator.pushNamed(context, '/login');
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
                          SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Divider(thickness: 1.5),
                        SizedBox(height: 0.0),
                        Text(
                          '© Copyright | Team intelli-ed | 2020',
                          style: subheading.copyWith(
                            color: Color(0xFFA2A2A2),
                            fontSize: 13.0,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
