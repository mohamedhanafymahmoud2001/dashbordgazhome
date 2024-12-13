import 'package:dashboardgazhome/componant/colors.dart';
import 'package:dashboardgazhome/prov/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarApp extends StatelessWidget {
  AppBarApp({super.key,
    required this.title,});
  final String title;
  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return  Consumer<Control>(builder: (context, val, child) {
      return  Row(
      children: [
        Container(
          child: Text("$title",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
        Expanded(child: SizedBox()),
        CircleAvatar(
          radius: 22,
          backgroundColor: colorsApp.colorWhaitApp,
          child: TextButton(
            onPressed: () {},
            child: Text(
              "AR",
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        CircleAvatar(
          radius: 22,
          backgroundColor: colorsApp.colorWhaitApp,
          child: IconButton(
              onPressed: () {
                                val.changeScreen("notifcation");}, icon: Icon(Icons.notifications_outlined)),
        ),
        TextButton(
          onPressed: () {},
          child: CircleAvatar(
            radius: 22,
            backgroundColor: colorsApp.colorWhaitApp,
            backgroundImage: AssetImage("assets/images/profile.jpg"),
          ),
        ),
      ],
    );});
  }
}
