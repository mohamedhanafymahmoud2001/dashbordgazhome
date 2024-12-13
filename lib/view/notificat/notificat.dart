import 'dart:math';
import 'package:dashboardgazhome/componant/appBarApp.dart';
import 'package:dashboardgazhome/componant/colors.dart';
import 'package:dashboardgazhome/componant/dialogeApp.dart';
import 'package:dashboardgazhome/prov/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Notificat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Notificat();
  }
}

class _Notificat extends State<Notificat> {
  ColorsApp colorsApp = new ColorsApp();
  DialogApp dialogApp = new DialogApp();

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Column(children: [
        Container(
            margin: EdgeInsets.only(bottom: 20),
            child: AppBarApp(title: "Notifications :")),
        Expanded(
            child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colorsApp.colorWhaitApp.withOpacity(0.5)),
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, i) {
                return Container(
                  height: 100,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colorsApp.colorWhaitApp),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: colorsApp.colorgreenApp,
                        child: Text(
                          "M",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Mohamed Hanafy",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "+96655988673",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        alignment: Alignment.center,
                        child: Text(
                          
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis, 
                          maxLines: 1,
                          "hello i hope to fix the problem of hhhhhhhhhh",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                      )),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: colorsApp.colorgreyApp.withOpacity(0.3)),
                        child: Text("client"),
                      )
                    ],
                  ),
                );
              }),
        )),
      ]);
    });
  }
}
