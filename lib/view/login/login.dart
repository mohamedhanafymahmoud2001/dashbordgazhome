import 'package:dashboardgazhome/componant/bottonapp.dart';
import 'package:dashboardgazhome/componant/colors.dart';
import 'package:dashboardgazhome/componant/dialogeApp.dart';
import 'package:dashboardgazhome/componant/inputeApp.dart';
import 'package:dashboardgazhome/prov/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  ColorsApp colorsApp = new ColorsApp();
  DialogApp dialogApp = new DialogApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Scaffold(
        backgroundColor: colorsApp.colorWhaitApp.withOpacity(0.9),
        body: Row(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                margin:
                    EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 7),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colorsApp.colorWhaitApp,
                ),
                child: Column(
                  children: [
                    Row(
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
                                fontSize: 25,
                                color: colorsApp.colorgreyApp.withOpacity(0.6),
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(flex: 1, child: Container()),
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: InputApp(
                                hint: "email",
                                controler: val.api.email,
                                icon: Icon(
                                  Icons.email_outlined,
                                  color: colorsApp.colorgreyApp,
                                ),
                                keyboard: TextInputType.emailAddress),
                          ),
                        ),
                        Expanded(flex: 1, child: Container()),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(flex: 1, child: Container()),
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: InputAppPass(
                                hint: "password",
                                show: true,
                                controler: val.api.password,
                                icon: Icon(
                                  Icons.visibility_off_outlined,
                                  color: colorsApp.colorblackapp,
                                ),
                                keyboard: TextInputType.text),
                          ),
                        ),
                        Expanded(flex: 1, child: Container()),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ButtonApp(
                        title: "Sign In",
                        color: colorsApp.colorblackapp,
                        fontcolor: colorsApp.colorWhaitApp,
                        func: () {
                          dialogApp.checkdialog(context, (){
                            Navigator.of(context).pushReplacementNamed("mainApp");
                          }, "تم بنجاح", true);
                        },
                        width: 200),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                margin:
                    EdgeInsets.only(top: 15, right: 15, bottom: 15, left: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colorsApp.colorWhaitApp,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/login.png",
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ],
        ),
      );
    });
  }
}
