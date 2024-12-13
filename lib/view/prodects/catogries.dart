import 'package:dashboardgazhome/componant/appBarApp.dart';
import 'package:dashboardgazhome/componant/colors.dart';
import 'package:dashboardgazhome/componant/dialogeApp.dart';
import 'package:dashboardgazhome/prov/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Catogreis extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Catogreis();
  }
}

class _Catogreis extends State<Catogreis> {
  ColorsApp colorsApp = new ColorsApp();
  DialogApp dialogApp = new DialogApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Column(
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 20),
              child: AppBarApp(title: "Prodects : ")),
          Expanded(
            child: val.catogerydata == null
                ? Center(child: CircularProgressIndicator())
                : Container(
                    width: double.infinity,
                    child: GridView.builder(
                        itemCount: val.catogerydata['data'].length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, // عدد الأعمدة في الشبكة
                          crossAxisSpacing: 40, // المسافة بين الأعمدة
                          mainAxisSpacing: 10, // المسافة بين الصفوف
                          childAspectRatio: 1.1, // نسبة العرض إلى الارتفاع
                        ),
                        itemBuilder: (context, i) {
                          return MaterialButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              val.idCatogery =
                                  val.catogerydata['data'][i]['id'];
                              print(val.idCatogery);
                              print(val.idCatogery);
                              val.changeScreen("prodects");
                              val.Prodects(val.catogerydata['data'][i]['id']);
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: colorsApp.colorWhaitApp,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            dialogApp.deleteProdect(context,
                                                () {
                                              val.DeleteCatogery(
                                                  val.catogerydata['data'][i]
                                                      ['id'],
                                                  context);
                                            }, "هل تريد حذف القسم ؟");
                                          },
                                          icon: Icon(Icons.delete)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.edit,
                                          )),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.all(5),
                                    child: Text(
                                      "${val.catogerydata['data'][i]['name']}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: colorsApp.colorFontblack,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Image.network(
                                        //"https://mangamediaa.com/Gas/public/storage/uploads/products/ojy931G6iXPmiDhmSfJ0v5TTgNMqdU8ZQixzG9Lw.jpg",
                                        "${val.api.imagedomain}${val.catogerydata['data'][i]['image']}",
                                        fit: BoxFit
                                            .cover, // لتحديد كيفية عرض الصورة
                                        errorBuilder: (BuildContext context,
                                            Object error,
                                            StackTrace? stackTrace) {
                                          // في حال حدوث خطأ، يمكنك عرض صورة افتراضية
                                          return Image.asset(
                                            "assets/images/logo.png", // المسار إلى الصورة الافتراضية
                                            fit: BoxFit.cover,
                                          );
                                        },
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          // عرض مؤشر تحميل أثناء تحميل الصورة
                                          if (loadingProgress == null)
                                            return child;
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      (loadingProgress
                                                              .expectedTotalBytes ??
                                                          1)
                                                  : null,
                                            ),
                                          );
                                        },
                                      ), //
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
          ),
        ],
      );
    });
  }
}
