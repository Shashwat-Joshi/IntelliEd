import 'package:IntelliEd/model/commanModel.dart';
import 'package:IntelliEd/style/theme.dart';
import 'package:flutter/material.dart';

class AuthPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 45.0),
                color: Color(0xFF1CAAFA),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text(
                  'Sign In',
                  style: subheading.copyWith(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              )
            ],
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
                SizedBox(height: 10.0),
                Text(
                  '© Copyright | Team intelli-ed | 2020',
                  style: subheading.copyWith(
                    color: Color(0xFFA2A2A2),
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
