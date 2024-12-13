import 'package:dashboardgazhome/componant/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularProgressWithGradientHome extends StatelessWidget {
  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: CircularPercentIndicator(
        radius: 75.0,
        lineWidth: 10.0,
        percent: 0.7,
        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "72",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              "Delivered Order",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        circularStrokeCap: CircularStrokeCap.round,
        backgroundColor: Colors.red,
        linearGradient: LinearGradient(
          colors: [colorsApp.colorbluedaken, colorsApp.colorFontblue],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
      ),
    );
  }
}

class CircularProgressWithGradientHomeProdect extends StatelessWidget {
  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 70,
      child: CircularPercentIndicator(
        radius: 30.0,
        lineWidth: 7.0,
        percent: 0.8,
        center: Text(
          "30",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        circularStrokeCap: CircularStrokeCap.round,
        backgroundColor: Colors.red,
        linearGradient: LinearGradient(
          colors: [colorsApp.colorgreenApp, colorsApp.colorbg2],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
      ),
    );
  }
}
