import 'package:dashboardgazhome/componant/colors.dart';
import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  ButtonApp({
    super.key,
    required this.title,
    required this.color,
    required this.fontcolor,
    required this.func,
    required this.width,
  });
  final String title;
  final Color color;
  final Color fontcolor;
  final VoidCallback func;
  final double width;
  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: func,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: colorApp.colorborder, width: 1)
        ),
        child: Text(
          "$title",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 12, color: fontcolor),
        ),
      ),
    );
  }
}

class ButtonApp2 extends StatelessWidget {
  ButtonApp2({
    super.key,
    required this.title,
    required this.color,
    required this.fontcolor,
    required this.func,
    required this.width,
  });
  final String title;
  final Color color;
  final Color fontcolor;
  final VoidCallback func;
  final double width;
  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: func,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
           border: Border.all(color: colorsApp.colorborder, width: 1)
        ),
        child: Text(
          "$title",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 12, color: fontcolor),
        ),
      ),
    );
  }
}
