import 'package:dashboardgazhome/componant/colors.dart';
import 'package:dashboardgazhome/prov/prov.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class InputApp extends StatelessWidget {
  InputApp({
    super.key,
    required this.hint,
    required this.controler,
    required this.icon,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String hint;
  final Widget icon;
  final TextInputType keyboard;

  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return val.languagebox.get("language") == "en" ? "empty" : "فارغ";
            }
            return null;
          },
          keyboardType: keyboard,
          controller: controler,
          decoration: InputDecoration(
              prefixIcon: icon,
              hintText: hint,
              hintStyle: TextStyle(
                color: colorsApp.colorgreyApp,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: colorsApp.colorborder),
                  borderRadius: BorderRadius.circular(10))),
        ),
      );
    });
  }
}

class InputAppNumber extends StatelessWidget {
  InputAppNumber({
    super.key,
    required this.hint,
    required this.controller,
    required this.icon,
    required this.keyboard,
  });

  final TextEditingController controller;
  final String hint;
  final Widget icon;
  final TextInputType keyboard;

  final ColorsApp colorsApp = ColorsApp();

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(
      builder: (context, val, child) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return val.languagebox.get("language") == "en"
                    ? "Field cannot be empty"
                    : "الحقل لا يمكن أن يكون فارغًا";
              }
              return null;
            },
            keyboardType: keyboard,
            controller: controller,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'\d'))],
            decoration: InputDecoration(
              prefixIcon: icon,
              hintText: hint,
              hintStyle: TextStyle(
                color: colorsApp.colorgreyApp,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: colorsApp.colorborder),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
      },
    );
  }
}


class InputAppPass extends StatelessWidget {
  InputAppPass({
    super.key,
    required this.hint,
    required this.show,
    required this.controler,
    required this.icon,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String hint;
  final Widget icon;
  final bool show;
  final TextInputType keyboard;

  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return val.languagebox.get("language") == "en" ? "empty" : "فارغ";
            }
            return null;
          },
          obscureText: show,
          keyboardType: keyboard,
          controller: controler,
          decoration: InputDecoration(
            prefixIcon: icon,
            hintText: hint,
            hintStyle: TextStyle(
              color: colorsApp.colorgreyApp,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    });
  }
}
