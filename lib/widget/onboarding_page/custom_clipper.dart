import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Üst kenar
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);

    // Sağ kenar
    path.lineTo(size.width, size.width * 0.75);

    // soldan alta kenar
    path.lineTo(size.width * 0.8, size.width*0.95);
    //alttan sağa kenar
   // path.lineTo(size.width*0.95, size.width * 0.8);
    // Sol kenar
    path.lineTo(0, size.height * 0.3);

    //path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}