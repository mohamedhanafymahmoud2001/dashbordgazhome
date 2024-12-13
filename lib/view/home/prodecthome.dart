import 'package:dashboardgazhome/componant/colors.dart';
import 'package:dashboardgazhome/componant/dialogeApp.dart';
import 'package:dashboardgazhome/view/home/indecatorhome.dart';
import 'package:flutter/material.dart';

class ProdectHome extends StatelessWidget {
  DialogApp dialogApp = new DialogApp();
  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      height: 150,
      decoration: BoxDecoration(
          color: colorsApp.colorWhaitApp,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: Image.asset("assets/images/prodect1.png"),
          ),
          Container(
            margin: EdgeInsets.only(left: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "أنابيب بي-آل-بي",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("ريال سعودي",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: colorsApp.colororange)),
                    Text(
                      " 323 ",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          MaterialButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              dialogApp.increezeProdect(
                  context, () {}, "اضافة مخزون جديد");
            },
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: colorsApp.colorgreenApp, width: 2),
                  left: BorderSide(color: colorsApp.colorgreenApp, width: 2),
                  right: BorderSide(
                      color: colorsApp.colorgreenApp,
                      width: 2), // لن نضيف حد للجزء السفلي
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: colorsApp.colorgreenApp,
                      child: Icon(
                        Icons.add,
                        size: 15,
                      ),
                    ),
                  ),
                  Text(
                    "اضافة مخزون جدبد",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: SizedBox()),
          Column(
            children: [
              CircularProgressWithGradientHomeProdect(),
              Container(
                child: Text(
                  "30 / 600",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
