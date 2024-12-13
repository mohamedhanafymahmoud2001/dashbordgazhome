import 'package:dashboardgazhome/componant/appBarApp.dart';
import 'package:dashboardgazhome/componant/colors.dart';
import 'package:dashboardgazhome/prov/prov.dart';
import 'package:dashboardgazhome/view/home/indecatorhome.dart';
import 'package:dashboardgazhome/view/home/prodecthome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///here
          AppBarApp(title: "Good Morning Mr. Ahmed Saleh"),
          Row(
            children: [
              Text("have a good day",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 25,
                  width: 25,
                  child: Image.asset("assets/images/nice.gif"))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 220,
                  decoration: BoxDecoration(
                    color: colorsApp.colorWhaitApp.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: colorsApp.colorWhaitApp,
                        child: Icon(
                          Icons.inventory_2_outlined,
                          size: 18,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    '232',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    'Total Orders',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    '72',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    'Delivered Order',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Container(
                                height: 150,
                                child: CircularProgressWithGradientHome(),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 220,
                  decoration: BoxDecoration(
                    color: colorsApp.colorWhaitApp.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: colorsApp.colorWhaitApp,
                        child: Icon(
                          Icons.person_2_outlined,
                          size: 18,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "164",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "Number Of Drivers",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "30 Driver is availabe",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius:
                                    0.0), // جعل حجم المقبض صغير جداً
                            overlayShape: RoundSliderOverlayShape(
                                overlayRadius:
                                    0.0), // إزالة الشكل الزائد عند السحب
                          ),
                          child: Slider(
                            activeColor: Colors.orange,
                            inactiveColor: Colors.yellow,
                            max: 100,
                            min: 0,
                            value: 70,
                            onChanged: (value) {
                              // الحدث عند تغيير القيمة
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          ////////////////////////////
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: colorsApp.colorWhaitApp.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Gaz Clynders :",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    child: ListView.builder(itemBuilder: (context, i) {
                      return ProdectHome();
                    }),
                  ))
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}
