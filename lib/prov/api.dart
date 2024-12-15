import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  String ip = "https://mangamediaa.com/Gas/public";
  String imagedomain = "https://mangamediaa.com/Gas/public";
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  var loginUser;
  Future LoginUser() async {
    loginUser = null;
    String uri = "$ip/api/user/login";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "phone_number": email.text,
        "password": password.text,
      }, headers: {
        "Accept": "application/json",
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        loginUser = responsbody;
      }
      print("login user : ${responsbody}");
    } catch (e) {
      print(e);
    }
    return loginUser;
  }

  var homeUser = null;
  Future HomeUser() async {
    homeUser = null;
    String url = "$ip/api/user/products/1";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        homeUser = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return homeUser;
  }

  TextEditingController amount = new TextEditingController();

  TextEditingController catogery = new TextEditingController();
  var addcatogery;
  addCatogery(File imageFile) async {
    addcatogery = null;
    final dio = Dio();

    FormData formData = FormData.fromMap({
      'name': catogery.text,
      'image': await MultipartFile.fromFile(
        imageFile.path,
        filename: imageFile.path.split('/').last,
      ),
    });
    // إرسال الطلب
    try {
      Response response = await dio.post(
        '$ip/api/category/create', // رابط الخادم الخاص بك
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'User-Agent':
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
          },
        ),
      );

      
    // التحقق من حالة الرد
    if (response.statusCode == 200 || response.statusCode == 201) {
      addcatogery = jsonDecode(response.toString());
      print('تم إضافة السائق بنجاح: ${response.data}');
    } else {
      print('فشل في إضافة السائق: ${response.statusCode}');
      print('الرد من الخادم: ${response.data}');
    }
  } on DioError catch (dioError) {
    if (dioError.response != null) {
      // خطأ مع استجابة من الخادم
      print('خطأ من الخادم: ${dioError.response?.statusCode}');
      print('تفاصيل الخطأ: ${dioError.response?.data}');
    } else {
      // خطأ في الاتصال بالخادم
      print('فشل الاتصال بالخادم: ${dioError.message}');
    }
  } catch (e) {
    // لأي خطأ غير متوقع
    print('حدث خطأ غير متوقع: $e');
  }
    return addcatogery;
  }

  var catogerydata = null;
  Future Catogery() async {
    catogerydata = null;
    String url = "$ip/api/categories";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        catogerydata = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return catogerydata;
  }

  var deletecatogery = null;
  Future DeleteCatogery(int id) async {
    deletecatogery = null;
    String url = "$ip/api/category/delete/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        deletecatogery = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return deletecatogery;
  }

  var prodects = null;
  Future Prodects(int id) async {
    prodects = null;
    String url = "$ip/api/products/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        prodects = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return prodects;
  }

  TextEditingController nameProdect = new TextEditingController();
  TextEditingController priceProdect = new TextEditingController();
  TextEditingController amountProdect = new TextEditingController();
  TextEditingController descriptinProdect = new TextEditingController();
  var addProdect;
  AddProdect(File imageFileProdect, int idCatogery) async {
    addProdect = null;
    final dio = Dio();
    print(idCatogery);
    print(nameProdect.text);
    print(priceProdect.text);
    print(descriptinProdect.text);
    print(amountProdect.text);
    FormData formData = FormData.fromMap({
      'category_id': idCatogery.toString(),
      'name': nameProdect.text,
      'price': priceProdect.text,
      'description': descriptinProdect.text,
      'quantity': amountProdect.text,
      'image': await MultipartFile.fromFile(
        imageFileProdect.path,
        filename: imageFileProdect.path.split('/').last,
      ),
    });
    // إرسال الطلب
    try {
      Response response = await dio.post(
        '$ip/api/product/create', // رابط الخادم الخاص بك
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'User-Agent':
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
          },
        ),
      );
      
    // التحقق من حالة الرد
    if (response.statusCode == 200 || response.statusCode == 201) {
      addProdect = jsonDecode(response.toString());
      print('تم إضافة السائق بنجاح: ${response.data}');
    } else {
      print('فشل في إضافة السائق: ${response.statusCode}');
      print('الرد من الخادم: ${response.data}');
    }
  } on DioError catch (dioError) {
    if (dioError.response != null) {
      // خطأ مع استجابة من الخادم
      print('خطأ من الخادم: ${dioError.response?.statusCode}');
      print('تفاصيل الخطأ: ${dioError.response?.data}');
    } else {
      // خطأ في الاتصال بالخادم
      print('فشل الاتصال بالخادم: ${dioError.message}');
    }
  } catch (e) {
    // لأي خطأ غير متوقع
    print('حدث خطأ غير متوقع: $e');
  }
    return addProdect;
  }
  var deleteprodect = null;
  Future DeleteProdect(int id) async {
    deleteprodect = null;
    String url = "$ip/api/product/delete/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        deleteprodect = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return deleteprodect;
  }

  TextEditingController nameDriver = new TextEditingController();
  TextEditingController phoneDriver = new TextEditingController();
  TextEditingController addressDriver = new TextEditingController();
  TextEditingController licenseNumberDriver = new TextEditingController();
  TextEditingController vehicleNumberDriver = new TextEditingController();
  TextEditingController vehicleLicenseNumberDriver =
      new TextEditingController();
  var addDriver;
  AddDriver(File imageFile) async {
  var addDriver; // تعريف المتغير لتخزين نتيجة العملية
  final dio = Dio();

  // تجهيز بيانات النموذج
  FormData formData = FormData.fromMap({
    'name': nameDriver.text,
    'phone': phoneDriver.text,
    'address': addressDriver.text,
    'license_number': licenseNumberDriver.text,
    'vehicle_number': vehicleNumberDriver.text,
    'image': await MultipartFile.fromFile(
      imageFile.path,
      filename: imageFile.path.split('/').last,
    ),
  });

  try {
    // إرسال الطلب إلى الخادم
    Response response = await dio.post(
      '$ip/api/driver/create', // تأكد من تحديث الرابط بما يناسب واجهتك الخلفية
      data: formData,
      options: Options(
        headers: {
          'Accept': 'application/json',
            'User-Agent':
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        },
      ),
    );

    // التحقق من حالة الرد
    if (response.statusCode == 200 || response.statusCode == 201) {
      addDriver = jsonDecode(response.toString());
      print('تم إضافة السائق بنجاح: ${response.data}');
    } else {
      print('فشل في إضافة السائق: ${response.statusCode}');
      print('الرد من الخادم: ${response.data}');
    }
  } on DioError catch (dioError) {
    if (dioError.response != null) {
      // خطأ مع استجابة من الخادم
      print('خطأ من الخادم: ${dioError.response?.statusCode}');
      print('تفاصيل الخطأ: ${dioError.response?.data}');
    } else {
      // خطأ في الاتصال بالخادم
      print('فشل الاتصال بالخادم: ${dioError.message}');
    }
  } catch (e) {
    // لأي خطأ غير متوقع
    print('حدث خطأ غير متوقع: $e');
  }

  return addDriver;
}

}
