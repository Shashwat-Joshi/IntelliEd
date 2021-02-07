import 'package:IntelliEd/style/theme.dart';
import 'package:IntelliEd/users/student/presentation/pages/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class SuccessPage extends StatefulWidget {
  final String successMsg;
  final Function triggerFunction;
  SuccessPage({@required this.successMsg, @required this.triggerFunction});
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2500), () {
      return widget.triggerFunction();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        return;
      },
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: size.width / 2,
                width: size.width / 2,
                child: FlareActor(
                  'assets/success.flr',
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  sizeFromArtboard: true,
                  animation: 'Untitled',
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                width: size.width * 0.8,
                child: Text(
                  widget.successMsg,
                  style: heading1,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
