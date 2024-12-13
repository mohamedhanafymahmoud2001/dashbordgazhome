import 'package:dashboardgazhome/componant/bottonapp.dart';
import 'package:dashboardgazhome/componant/colors.dart';
import 'package:dashboardgazhome/componant/inputeApp.dart';
import 'package:dashboardgazhome/prov/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dotted_border/dotted_border.dart';

class DialogApp {
  ColorsApp colorsApp = new ColorsApp();
  Future<void> increezeProdect(
      BuildContext context, VoidCallback func, String title) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<Control>(builder: (context, val, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,

            scrollable: true,
            // titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            // title: Text('Verify'),
            elevation: 10,
            content: Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      alignment: Alignment.center,
                      child: Text(
                        "$title",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        height: 1,
                        color: Colors.grey.shade300,
                        thickness: 2,
                        endIndent: 130,
                        indent: 130,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: 350,
                      child: InputApp(
                          hint: "حدد الكمية",
                          controler: val.api.amount,
                          icon: Icon(
                            Icons.add,
                            color: colorsApp.colorgreyApp,
                          ),
                          keyboard: TextInputType.number),
                    )
                  ],
                )),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonApp2(
                      title: "الغاء الامر",
                      color: colorsApp.colorWhaitApp,
                      fontcolor: colorsApp.colorblackapp,
                      func: () {
                        Navigator.of(context).pop();
                      },
                      width: 100),
                  ButtonApp2(
                      title: "موافق",
                      color: colorsApp.colorblackapp,
                      fontcolor: colorsApp.colorWhaitApp,
                      func: () {},
                      width: 100),
                ],
              ),
            ],
          );
        });
      },
    );
  }

  Future<void> deleteProdect(
      BuildContext context, VoidCallback func, String title) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<Control>(builder: (context, val, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            scrollable: true,
            elevation: 10,
            content: Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: Image.asset("assets/images/delete.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 20),
                      alignment: Alignment.center,
                      child: Text(
                        "$title",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ],
                )),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonApp2(
                      title: "الغاء الامر",
                      color: colorsApp.colorWhaitApp,
                      fontcolor: colorsApp.colorblackapp,
                      func: () {
                        Navigator.of(context).pop();
                      },
                      width: 100),
                  ButtonApp2(
                      title: "موافق",
                      color: colorsApp.colorblackapp,
                      fontcolor: colorsApp.colorWhaitApp,
                      func:func,
                      width: 100),
                ],
              ),
            ],
          );
        });
      },
    );
  }
  GlobalKey<FormState> formstateAddProdect = GlobalKey();
  Future<void> addProdect(
      BuildContext context, VoidCallback func, String title) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<Control>(builder: (context, val, child) {
          return Form(
            key:formstateAddProdect,
            child: AlertDialog(
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              scrollable: true,
              elevation: 10,
              title: Container(
                alignment: Alignment.center,
                child: Text(
                  "$title",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              content: Container(
                  padding: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Container(
                          child: Column(
                        children: [
                          DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(10),
                            dashPattern: [6, 3], // طول الخط والمسافة بين الخطوط
                            color: colorsApp.colorgreyApp,
                            strokeWidth: 2,
                            child: Container(
                              height: 200,
                              width: 300,
                              child: Column(
                                children: [
                                  val.imageFileProdect==null?Container(
                                    margin: EdgeInsets.only(top: 30),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset("assets/images/image1.png"),
                                        Container(
                                            margin: EdgeInsets.only(bottom: 20),
                                            child: Image.asset(
                                                "assets/images/image2.png")),
                                      ],
                                    ),
                                  ):Container(
                                          height: 150,
                                          child: Image.file(val.imageFileProdect!),
                                        ),
                                  Expanded(child: Container()),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 30),
                                    child: Text(
                                      "قم بتحميل صورة المنتج لعرضها في النظام",
                                      style:
                                          TextStyle(fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                      Container(
                        width: 350,
                        child: Column(
                          children: [
                            InputApp(
                                hint: "ادخل اسم المنتج",
                                controler: val.api.nameProdect,
                                icon: Icon(
                                  Icons.production_quantity_limits,
                                  color: colorsApp.colorgreyApp,
                                ),
                                keyboard: TextInputType.text),
                            InputAppNumber(
                                hint: "حدد سعر المنتج",
                                controller: val.api.priceProdect,
                                icon: Icon(
                                  Icons.price_change,
                                  color: colorsApp.colorgreyApp,
                                ),
                                keyboard: TextInputType.text),
                            InputAppNumber(
                                hint: "حدد كمية المخزون",
                                controller: val.api.amountProdect,
                                icon: Icon(
                                  Icons.gamepad,
                                  color: colorsApp.colorgreyApp,
                                ),
                                keyboard: TextInputType.text),
                            InputApp(
                                hint: "اوصف المنتج",
                                controler: val.api.descriptinProdect,
                                icon: Icon(
                                  Icons.description,
                                  color: colorsApp.colorgreyApp,
                                ),
                                keyboard: TextInputType.text),
                          ],
                        ),
                      ),
                    ],
                  )),
              actions: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                    Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colorsApp.colorgreyApp.withOpacity(0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                              child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "تحميل صورة",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          )),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: CircleAvatar(
                              backgroundColor: colorsApp.colorgreenApp,
                              child: IconButton(
                                  onPressed: () {
                                    val.uploadImageProdect();
                                  },
                                  icon: Icon(Icons.upload_outlined)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 3,
                    ),
                    ButtonApp2(
                        title: "الغاء الامر",
                        color: colorsApp.colorWhaitApp,
                        fontcolor: colorsApp.colorblackapp,
                        func: () {
                          Navigator.of(context).pop();
                        },
                        width: 100),
                    ButtonApp2(
                        title: "موافق",
                        color: colorsApp.colorblackapp,
                        fontcolor: colorsApp.colorWhaitApp,
                        func: () {
                          if (formstateAddProdect.currentState!.validate()) {
                            val.AddProdect(context);
                            print("valied");
                          }else{
                            print("not valied");
                          }
                        },
                        width: 100),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ],
            ),
          );
        });
      },
    );
  }

  GlobalKey<FormState> formstateAddCatogery = GlobalKey();
  Future<void> addCatogery(
      BuildContext context, VoidCallback func, String title) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<Control>(builder: (context, val, child) {
          return Form(
            key: formstateAddCatogery,
            child: AlertDialog(
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              scrollable: true,
              elevation: 10,
              title: Container(
                alignment: Alignment.center,
                child: Text(
                  "$title",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              content: Container(
                  padding: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Container(
                          child: Column(
                        children: [
                          DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(10),
                            dashPattern: [6, 3], // طول الخط والمسافة بين الخطوط
                            color: colorsApp.colorgreyApp,
                            strokeWidth: 2,
                            child: Container(
                              height: 200,
                              width: 300,
                              child: Column(
                                children: [
                                  val.imageFile == null
                                      ? Container(
                                          margin: EdgeInsets.only(top: 30),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Image.asset(
                                                  "assets/images/image1.png"),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 20),
                                                  child: Image.asset(
                                                      "assets/images/image2.png")),
                                            ],
                                          ),
                                        )
                                      : Container(
                                          height: 150,
                                          child: Image.file(val.imageFile!),
                                        ),
                                  Expanded(child: Container()),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 30),
                                    child: Text(
                                      "قم بتحميل صورة المنتج لعرضها في النظام",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                      Container(
                        width: 350,
                        child: Column(
                          children: [
                            InputApp(
                                hint: "ادخل القسم",
                                controler: val.api.catogery,
                                icon: Icon(
                                  Icons.production_quantity_limits,
                                  color: colorsApp.colorgreyApp,
                                ),
                                keyboard: TextInputType.text),
                          ],
                        ),
                      ),
                    ],
                  )),
              actions: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                    Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colorsApp.colorgreyApp.withOpacity(0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                              child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "تحميل صورة",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          )),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: CircleAvatar(
                              backgroundColor: colorsApp.colorgreenApp,
                              child: IconButton(
                                  onPressed: () {
                                    val.uploadImage();
                                  },
                                  icon: Icon(Icons.upload_outlined)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 3,
                    ),
                    ButtonApp2(
                        title: "الغاء الامر",
                        color: colorsApp.colorWhaitApp,
                        fontcolor: colorsApp.colorblackapp,
                        func: () {
                          Navigator.of(context).pop();
                        },
                        width: 100),
                    ButtonApp2(
                        title: "موافق",
                        color: colorsApp.colorblackapp,
                        fontcolor: colorsApp.colorWhaitApp,
                        func: () {
                          if (formstateAddCatogery.currentState!.validate()) {
                            val.AddCatogery(val.imageFile!,context);
                            print("upload file");
                            print("validat");
                          } else {
                            print("not validat");
                          }
                        },
                        width: 100),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ],
            ),
          );
        });
      },
    );
  }
  
  GlobalKey<FormState> formstateAddDriver = GlobalKey();
  Future<void> addDriver(
      BuildContext context, VoidCallback func, String title) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<Control>(builder: (context, val, child) {
          return Form(
            key:formstateAddDriver ,
            child: AlertDialog(
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              scrollable: true,
              elevation: 10,
              title: Container(
                alignment: Alignment.center,
                child: Text(
                  "$title",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              content: Container(
                  padding: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Container(
                          child: Column(
                        children: [
                          DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(10),
                            dashPattern: [6, 3], // طول الخط والمسافة بين الخطوط
                            color: colorsApp.colorgreyApp,
                            strokeWidth: 2,
                            child: Container(
                              height: 200,
                              width: 300,
                              child: Column(
                                children: [
                                  val.imageFileDriver == null
                                      ? Container(
                                          margin: EdgeInsets.only(top: 30),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Image.asset(
                                                  "assets/images/image1.png"),
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(bottom: 20),
                                                  child: Image.asset(
                                                      "assets/images/image2.png")),
                                            ],
                                          ),
                                        )
                                      : Container(
                                        height: 150,
                                          child: Image.file(val.imageFileDriver!),
                                        ),
                                  Expanded(child: Container()),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 30),
                                    child: Text(
                                      "قم بتحميل صورة المنتج لعرضها في النظام",
                                      style:
                                          TextStyle(fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                      Container(
                        width: 350,
                        child: Column(
                          children: [
                            InputApp(
                                hint: "ادخل اسم السائق",
                                controler: val.api.nameDriver,
                                icon: Icon(
                                  Icons.person_outline,
                                  color: colorsApp.colorgreyApp,
                                ),
                                keyboard: TextInputType.text),
                            InputAppNumber(
                                hint: "ادخل رقم الجوال",
                                controller: val.api.phoneDriver,
                                icon: Icon(
                                  Icons.phone_outlined,
                                  color: colorsApp.colorgreyApp,
                                ),
                                keyboard: TextInputType.text),
                            InputApp(
                                hint: "عنوان السائق",
                                controler: val.api.addressDriver,
                                icon: Icon(
                                  Icons.location_city,
                                  color: colorsApp.colorgreyApp,
                                ),
                                keyboard: TextInputType.text),
                            InputAppNumber(
                                hint: "ادخل رقم رخصة القيادة",
                                controller: val.api.licenseNumberDriver,
                                icon: Icon(
                                  Icons.badge_outlined,
                                  color: colorsApp.colorgreyApp,
                                ),
                                keyboard: TextInputType.text),
                            InputAppNumber(
                                hint: "ادخل رقم رخصة السيارة",
                                controller: val.api.vehicleLicenseNumberDriver,
                                icon: Icon(
                                  Icons.directions_car_outlined,
                                  color: colorsApp.colorgreyApp,
                                ),
                                keyboard: TextInputType.text),
                            InputAppNumber(
                                hint: "ادخل رقم لوحة السيارة",
                                controller: val.api.vehicleNumberDriver,
                                icon: Icon(
                                  Icons.car_repair_outlined,
                                  color: colorsApp.colorgreyApp,
                                ),
                                keyboard: TextInputType.text),
                          ],
                        ),
                      ),
                    ],
                  )),
              actions: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                    Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colorsApp.colorgreyApp.withOpacity(0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                              child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "تحميل صورة",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          )),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: CircleAvatar(
                              backgroundColor: colorsApp.colorgreenApp,
                              child: IconButton(
                                  onPressed: () {
                                    val.uploadImageDriver();
                                  },
                                  icon: Icon(Icons.upload_outlined)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 3,
                    ),
                    ButtonApp2(
                        title: "الغاء الامر",
                        color: colorsApp.colorWhaitApp,
                        fontcolor: colorsApp.colorblackapp,
                        func: () {
                          Navigator.of(context).pop();
                        },
                        width: 100),
                    ButtonApp2(
                        title: "موافق",
                        color: colorsApp.colorblackapp,
                        fontcolor: colorsApp.colorWhaitApp,
                        func: () {
                          if (formstateAddDriver.currentState!.validate()) {
                            val.AddDriver(context);
                          }else{
                            print("Not valid");
                          }
                        },
                        width: 100),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ],
            ),
          );
        });
      },
    );
  }

  ///
  Future<void> checkdialog(
      BuildContext context, VoidCallback func, String title, bool type) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<Control>(builder: (context, val, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,

            scrollable: true,
            // titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            // title: Text('Verify'),
            elevation: 10,
            content: Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: Image.asset(type == true
                          ? "assets/images/seccess.png"
                          : "assets/images/error.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: Text(
                        val.languagebox.get("language") == "en"
                            ? "Confirm"
                            : "$title",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        height: 1,
                        color: Colors.grey.shade300,
                        thickness: 2,
                        endIndent: 70,
                        indent: 70,
                      ),
                    ),
                  ],
                )),
            actions: <Widget>[
              Center(
                  child: ButtonApp(
                      title: "دخول",
                      color: colorsApp.colorblackapp,
                      fontcolor: colorsApp.colorWhaitApp,
                      func: func,
                      width: 150)),
            ],
          );
        });
      },
    );
  }

  Future<void> check(BuildContext context ,var data) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<Control>(builder: (context, val, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            scrollable: true,
            elevation: 10,
            content: data==null?Center(child: CircularProgressIndicator(),):Container(//
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child:data['message']=='Category Deleted Successfully'||data['message']=='Category Created Successfully'?  Image.asset("assets/images/seccess.png"):Image.asset("assets/images/error.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 20),
                      alignment: Alignment.center,
                      child: Text(
                        "${data['message']}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ],
                )),
            actions: <Widget>[
              ButtonApp2(
                  title: "موافق",
                  color: colorsApp.colorblackapp,
                  fontcolor: colorsApp.colorWhaitApp,
                  func: () {
                    Navigator.of(context).pop();
                  },
                  width: 100),
            ],
          );
        });
      },
    );
  }
}
