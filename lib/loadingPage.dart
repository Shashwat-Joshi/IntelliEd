import 'package:IntelliEd/style/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loadingPage({@required String text, @required Size size}) {
  return Stack(
    children: [
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCube(
              color: Color(0xff1CAAFA),
              size: 30.0,
            ),
            SizedBox(height: 50.0),
            Text(
              text,
              style: heading2,
            ),
          ],
        ),
      ),
      Positioned(
        left: 0.0,
        top: 0.0,
        child: ClipPath(
          clipper: CustomClipperDesign1(),
          child: Container(
            height: size.height * 0.35,
            width: size.width,
            color: Color(0xff1CAAFA).withOpacity(0.9),
          ),
        ),
      ),
      Positioned(
        left: 0.0,
        bottom: 0.0,
        child: RotatedBox(
          quarterTurns: 2,
          child: ClipPath(
            clipper: CustomClipperDesign1(),
            child: Container(
              height: size.height * 0.35,
              width: size.width,
              color: Color(0xff1CAAFA).withOpacity(0.9),
            ),
          ),
        ),
      ),
    ],
  );
}

class CustomClipperDesign1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(
        width * 0.1, height * 0.65, width / 3, height * 0.65);
    path.quadraticBezierTo(
        width * 0.5, height * 0.65, width / 6 * 4, height * 0.3);
    path.quadraticBezierTo(width * 0.75, height * 0.1, width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
