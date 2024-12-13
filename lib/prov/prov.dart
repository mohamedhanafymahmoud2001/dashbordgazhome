import 'package:dashboardgazhome/componant/dialogeApp.dart';
import 'package:dashboardgazhome/prov/api.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

class Control extends ChangeNotifier {
  Api api = new Api();
  DialogApp dialogApp = new DialogApp();
  late Box languagebox = Hive.box("language");
  choseLanguage(String lan) {
    languagebox.put("language", "$lan");
    notifyListeners();
  }

  String screen = "home";
  changeScreen(String value) {
    screen = value;
    notifyListeners();
  }

  File? imageFile;
  void uploadImage() async {
    try {
      // فتح نافذة لاختيار ملف
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null) {
        imageFile = File(result.files.single.path!);
        print("doneeee");
        print(imageFile?.path);
        print("doneeee");
        print(imageFile);
        notifyListeners();
      }
    } catch (e) {
      print('حدث خطأ أثناء رفع الصورة: $e');
    }
    notifyListeners();
  }

  var addcatogery;
  AddCatogery(File imageFile, BuildContext context) async {
    addcatogery = null;
    addcatogery = await api.addCatogery(imageFile);
    if (context.mounted) {
      Navigator.of(context).pop();
      dialogApp.check(context,addcatogery);
      print(addcatogery);
    }
    Catogery();
    print("end");
    notifyListeners();
  }

  var deleteCatogery;
  DeleteCatogery(int id, BuildContext context) async {
    deleteCatogery = await api.DeleteCatogery(id);
    print("end${deleteCatogery}");
    if (context.mounted) {
      print("object");
      Navigator.of(context).pop();
      dialogApp.check(context,deleteCatogery);
    }
    Catogery();

    notifyListeners();
  }

  var catogerydata = null;
  Catogery() async {
    catogerydata = null;
    catogerydata = await api.Catogery();
    notifyListeners();
  }
  
  int idCatogery=0;
  var prodects = null;
  Prodects(int id) async {
    prodects = null;
    prodects = await api.Prodects(id);
    notifyListeners();
  }

  File? imageFileProdect;
  void uploadImageProdect() async {
    imageFileProdect=null;
    try {
      // فتح نافذة لاختيار ملف
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null) {
        imageFileProdect = File(result.files.single.path!);
        
        print(imageFileProdect?.path);
        print("image$imageFileProdect");
        notifyListeners();
      }
    } catch (e) {
      print('حدث خطأ أثناء رفع الصورة: $e');
    }
    notifyListeners();
  }

  var addprodect;
  AddProdect(BuildContext context) async {
    addprodect = null;
    addprodect = await api.AddProdect(imageFileProdect!,idCatogery);
    if (context.mounted) {
      Navigator.of(context).pop();
      dialogApp.check(context,addprodect);
      print(addprodect);
    }
    Prodects(idCatogery);
    print("end");
    notifyListeners();
  } 
  File? imageFileDriver;
  void uploadImageDriver() async {
    imageFileDriver=null;
    try {
      // فتح نافذة لاختيار ملف
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null) {
        imageFileDriver = File(result.files.single.path!);
        
        print(imageFileDriver?.path);
        print("image$imageFileDriver");
        notifyListeners();
      }
    } catch (e) {
      print('حدث خطأ أثناء رفع الصورة: $e');
    }
    notifyListeners();
  }
  var addDriver;
  AddDriver(BuildContext context) async {
    addDriver = null;
    addDriver = await api.AddDriver(imageFileDriver!);
    if (context.mounted) {
      Navigator.of(context).pop();
      dialogApp.check(context,addDriver);
      print(addDriver);
    }
    ///
    print("end");
    notifyListeners();
  }
}
