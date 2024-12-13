import 'dart:io';

import 'package:dashboardgazhome/prov/prov.dart';
import 'package:dashboardgazhome/view/login/login.dart';
import 'package:dashboardgazhome/view/mainApp.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  await Hive.openBox('language');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return Control();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            'login': (context) => Login(),
            'mainApp': (context) => MainApp(),
          },
          home: Login(),
        ));
  }
}
