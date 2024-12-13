import 'package:dashboardgazhome/componant/appBarApp.dart';
import 'package:dashboardgazhome/componant/colors.dart';
import 'package:dashboardgazhome/componant/dialogeApp.dart';
import 'package:dashboardgazhome/prov/prov.dart';
import 'package:dashboardgazhome/view/home/indecatorhome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Drivers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Drivers();
  }
}

class _Drivers extends State<Drivers> {
  ColorsApp colorsApp = new ColorsApp();
  DialogApp dialogApp = new DialogApp();
  List dataDriver = [
    {"name": "Mohamed Hanafy", "key": "الاسم"},
    {"name": "+96653465544", "key": "رقم الجوال"},
    {"name": "3246554", "key": "رخصة القيادة"},
    {"name": "6353533", "key": "رخصصة السيارة"},
    {"name": "8367833", "key": "رقملوحة السيارة"},
    {
      "name":
          "المملكة العربيه السعودية -جدة-حي الملك عبدالله-شارع فيصل -رقم المبنى 15",
      "key": "الموقع"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Column(
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 20),
              child: AppBarApp(title: "Drivers :")),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    child: GridView.builder(
                        itemCount: 10,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              MediaQuery.of(context).size.width < 900
                                  ? 2
                                  : MediaQuery.of(context).size.width < 1300
                                      ? 3
                                      : 4, // عدد الأعمدة في الشبكة
                          crossAxisSpacing: 20, // المسافة بين الأعمدة
                          mainAxisSpacing: 20, // المسافة بين الصفوف
                          childAspectRatio: 0.8, // نسبة العرض إلى الارتفاع
                        ),
                        itemBuilder: (context, i) {
                          return Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: colorsApp.colorWhaitApp.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(20)),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: CircleAvatar(
                                      radius: 17,
                                      backgroundColor: colorsApp.colorWhaitApp,
                                      child: IconButton(
                                          onPressed: () {
                                            dialogApp.deleteProdect(
                                                context,
                                                () {},
                                                "هل تريد حذف السائق من النظام");
                                          },
                                          icon: Icon(
                                            Icons.delete_outline,
                                            size: 17,
                                          )),
                                    ),
                                  ),
                                  Container(
                                      width: 80,
                                      height: 80,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.asset(
                                            "assets/images/profile2.jpg",
                                            fit: BoxFit.cover,
                                          ))),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Moahmed Hanafy",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "+96655783427",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: colorsApp.colorgreyApp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),

                ///profile
                Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color:
                                      colorsApp.colorWhaitApp.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 250,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                            color: colorsApp.colorWhaitApp,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                              "assets/images/profile2.jpg",
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  colorsApp.colorWhaitApp,
                                              child: IconButton(
                                                  onPressed: () {
                                                    dialogApp.deleteProdect(
                                                        context,
                                                        () {},
                                                        "هل تريد حذف السائق من النظام");
                                                  },
                                                  icon: Icon(
                                                      Icons.delete_outline)),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            CircleAvatar(
                                              backgroundColor:
                                                  colorsApp.colorWhaitApp,
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                      Icons.edit_outlined)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      child: ListView.builder(
                                          itemCount: dataDriver.length,
                                          itemBuilder: (context, i) {
                                            return Container(
                                              width: double.infinity,
                                              margin: EdgeInsets.only(top: 10),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 15),
                                              decoration: BoxDecoration(
                                                  color:
                                                      colorsApp.colorWhaitApp,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "${dataDriver[i]['name']}",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                  Text(
                                                    ": ${dataDriver[i]['key']}",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                color: colorsApp.colorWhaitApp.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: colorsApp.colorgreen,
                                  child: IconButton(
                                      onPressed: () {
                                        dialogApp.addDriver(
                                            context, () {}, "اضافة سائق جديد");
                                      },
                                      icon: Icon(Icons.add)),
                                ),
                                Expanded(
                                    child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "اضافة سائق جديد",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      );
    });
  }
}
