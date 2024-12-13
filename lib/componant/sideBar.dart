import 'package:dashboardgazhome/componant/colors.dart';
import 'package:dashboardgazhome/prov/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [         
              colorsApp.colorbgs2,
              colorsApp.colorbgs1,
            ], // الألوان المستخدمة في التدرج
            begin: Alignment.topRight, // بداية التدرج
            end: Alignment.bottomLeft, // نهاية التدرج ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "GazHome",
                      style: TextStyle(
                          fontSize: 22,
                          color: colorsApp.colorWhaitApp.withOpacity(0.8),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 50, bottom: 10),
              child: Text(
                textAlign: TextAlign.left,
                "Menu",
                style: TextStyle(
                    fontSize: 18,
                    color: colorsApp.colorWhaitApp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            MaterialButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                val.changeScreen("home");
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 4,
                      decoration: BoxDecoration(
                          color: val.screen == "home"
                              ? colorsApp.colorgreen
                              : colorsApp.colorWhaitApp.withOpacity(0.0),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.home_outlined,
                        color: colorsApp.colorWhaitApp,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        textAlign: TextAlign.left,
                        "Home Screen",
                        style: TextStyle(
                            fontSize: 16,
                            color: colorsApp.colorWhaitApp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MaterialButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                val.changeScreen("catogery");
                val.Catogery();
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 4,
                      decoration: BoxDecoration(
                          color: val.screen == "catogery" ||
                                  val.screen == "prodects"
                              ? colorsApp.colorgreen
                              : colorsApp.colorWhaitApp.withOpacity(0.0),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.inventory_2_outlined,
                        color: colorsApp.colorWhaitApp,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        textAlign: TextAlign.left,
                        "Products",
                        style: TextStyle(
                            fontSize: 16,
                            color: colorsApp.colorWhaitApp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MaterialButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                val.changeScreen("driver");
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 4,
                      decoration: BoxDecoration(
                          color: val.screen == "driver"
                              ? colorsApp.colorgreen
                              : colorsApp.colorWhaitApp.withOpacity(0.0),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.local_shipping_outlined,
                        color: colorsApp.colorWhaitApp,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        textAlign: TextAlign.left,
                        "Drivers",
                        style: TextStyle(
                            fontSize: 16,
                            color: colorsApp.colorWhaitApp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MaterialButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                val.changeScreen("customer");
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 4,
                      decoration: BoxDecoration(
                          color: val.screen == "customer"
                              ? colorsApp.colorgreen
                              : colorsApp.colorWhaitApp.withOpacity(0.0),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.group_outlined,
                        color: colorsApp.colorWhaitApp,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        textAlign: TextAlign.left,
                        "Customers",
                        style: TextStyle(
                            fontSize: 16,
                            color: colorsApp.colorWhaitApp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
