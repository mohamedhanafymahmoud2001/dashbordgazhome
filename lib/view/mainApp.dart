import 'package:dashboardgazhome/componant/colors.dart';
import 'package:dashboardgazhome/componant/dialogeApp.dart';
import 'package:dashboardgazhome/componant/sideBar.dart';
import 'package:dashboardgazhome/prov/prov.dart';
import 'package:dashboardgazhome/view/clients/clients.dart';
import 'package:dashboardgazhome/view/drivers/drivers.dart';
import 'package:dashboardgazhome/view/home/home.dart';
import 'package:dashboardgazhome/view/notificat/notificat.dart';
import 'package:dashboardgazhome/view/prodects/catogries.dart';
import 'package:dashboardgazhome/view/prodects/prodects.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainApp();
  }
}

class _MainApp extends State<MainApp> {
  ColorsApp colorsApp = new ColorsApp();
  DialogApp dialogApp = new DialogApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Scaffold(
        body: Row(children: [
          Expanded(flex: 1, child: SideBar()),
          Expanded(
            flex: 4,
            child: Container(
                height: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      colorsApp.colorbg2,
                      colorsApp.colorbg1,
                      colorsApp.colorbg1,
                    ], // الألوان المستخدمة في التدرج
                    begin: Alignment.topRight, // بداية التدرج
                    end: Alignment.bottomLeft, // نهاية التدرج ),
                  ),
                ),
                child: val.screen == "home"
                    ? Home()
                    : val.screen == "catogery"
                        ? Catogreis()
                        : val.screen == "driver"
                            ? Drivers()
                            : val.screen == "customer"
                                ? Clients()
                                : val.screen == "prodects"
                                    ? Prodects()
                                    : Notificat() //
                //Notificat() // Clients(), // Drivers() // Prodects() // Catogreis() ,//Home(),
                ),
          )
        ]),
        floatingActionButton: val.screen == "catogery"
            ? FloatingActionButton(
                onPressed: () {
                  dialogApp.addCatogery(context, () {}, "اضافة قسم");
                },
                child: Icon(Icons.add),
              )
            : SizedBox(),
      );
    });
  }
}
