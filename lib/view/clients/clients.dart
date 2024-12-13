import 'package:dashboardgazhome/componant/appBarApp.dart';
import 'package:dashboardgazhome/componant/colors.dart';
import 'package:dashboardgazhome/componant/dialogeApp.dart';
import 'package:dashboardgazhome/prov/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Clients extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Clients();
  }
}

class _Clients extends State<Clients> {
  ColorsApp colorsApp = new ColorsApp();
  DialogApp dialogApp = new DialogApp();

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Column(
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 20),
              child: AppBarApp(title: "Clients :")),
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
                                  CircleAvatar(
                                    maxRadius: 45,
                                    minRadius: 10,
                                    backgroundColor: colorsApp.colorgreenApp,
                                    child: Text(
                                      "M",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: colorsApp.colorFontblack),
                                    ),
                                  ),
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
                                  ListTile(
                                    leading: Container(
                                      alignment: Alignment.center,
                                      width: 50,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          color: colorsApp.colorgreenApp,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        "M",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    title: Text("Mohamed Hanafy"),
                                    subtitle: Text("+96655893526"),
                                    trailing: CircleAvatar(
                                      backgroundColor: colorsApp.colorWhaitApp,
                                      child: Text('13'),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(top: 10),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15),
                                    decoration: BoxDecoration(
                                        color: colorsApp.colorWhaitApp,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            textAlign: TextAlign.end,
                                            "المملكة العربيه السعودية -جدة-حي الملك عبدالله-شارع فيصل -رقم المبنى 15",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(Icons.pin_drop_outlined),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      child: ListView.builder(
                                          itemCount: 11,
                                          itemBuilder: (context, i) {
                                            return Container(
                                              width: double.infinity,
                                              margin: EdgeInsets.only(top: 10),
                                              // height: 150,
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
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 16,
                                                          backgroundColor:
                                                              colorsApp
                                                                  .colorgreyApp
                                                                  .withOpacity(
                                                                      0.4),
                                                          child: Text("6"),
                                                        ),
                                                        Container(
                                                          height: 100,
                                                          child: Image.asset(
                                                              "assets/images/prodect1.png"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                          child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            "انابيب بي-ال-بي ",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Container(
                                                                child: Text(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  "ريال  سعودي",
                                                                  style:
                                                                      TextStyle(
                                                                    color: colorsApp
                                                                        .colororange,
                                                                    fontSize:
                                                                        13,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                child: Text(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  "323",
                                                                  style: TextStyle(
                                                                      color: colorsApp
                                                                          .colorblackapp,
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                          child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            "23/11/2024",
                                                            style: TextStyle(
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: IconButton(
                                        onPressed: () {
                                          dialogApp.deleteProdect(context,
                                              () {}, "هل تريد حذف هذا العميل");
                                        },
                                        icon: Icon(Icons.delete_outline)),
                                  )
                                ],
                              ),
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
