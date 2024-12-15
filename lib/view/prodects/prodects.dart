import 'package:dashboardgazhome/componant/appBarApp.dart';
import 'package:dashboardgazhome/componant/colors.dart';
import 'package:dashboardgazhome/componant/dialogeApp.dart';
import 'package:dashboardgazhome/prov/prov.dart';
import 'package:dashboardgazhome/view/home/indecatorhome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Prodects extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Prodects();
  }
}

class _Prodects extends State<Prodects> {
  ColorsApp colorsApp = new ColorsApp();
  DialogApp dialogApp = new DialogApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Column(
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 20),
              child: AppBarApp(title: "Gaz Clynders : ")),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: val.prodects == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          width: double.infinity,
                          child: GridView.builder(
                              itemCount: val.prodects['data'].length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4, // عدد الأعمدة في الشبكة
                                crossAxisSpacing: 20, // المسافة بين الأعمدة
                                mainAxisSpacing: 20, // المسافة بين الصفوف
                                childAspectRatio:
                                    0.65, // نسبة العرض إلى الارتفاع
                              ),
                              itemBuilder: (context, i) {
                                return Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: colorsApp.colorWhaitApp
                                          .withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: MaterialButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {
                                      val.oneProdect(i);
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: CircleAvatar(
                                            radius: 17,
                                            backgroundColor:
                                                colorsApp.colorWhaitApp,
                                            child: IconButton(
                                                onPressed: () {
                                                  dialogApp.delete(
                                                      context,
                                                      () {
                                                        val.DeleteProdect(val.prodects['data'][i]['id'], context);
                                                      },
                                                      "هل ترغب في حذف المنتج من النظام ؟!");
                                                },
                                                icon: Icon(
                                                  Icons.delete_outline,
                                                  size: 17,
                                                )),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 30),
                                          padding: EdgeInsets.only(
                                              top: 10, left: 10, right: 10),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      colorsApp.colorgreenApp),
                                              color: colorsApp.colorWhaitApp,
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.network(
                                              "${val.prodects['data'][i]['image']}",
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object error,
                                                      StackTrace? stackTrace) {
                                                // في حال حدوث خطأ، يمكنك عرض صورة افتراضية
                                                return Image.asset(
                                                  "assets/images/logo.png", // المسار إلى الصورة الافتراضية
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                // عرض مؤشر تحميل أثناء تحميل الصورة
                                                if (loadingProgress == null)
                                                  return child;
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
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
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "${val.prodects['data'][i]['name']}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  "ريال  سعودي",
                                                  style: TextStyle(
                                                    color:
                                                        colorsApp.colororange,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  "${val.prodects['data'][i]['price']}",
                                                  style: TextStyle(
                                                      color: colorsApp
                                                          .colorblackapp,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "${val.prodects['data'][i]['quantity']} remained",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                ),
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
                                      colorsApp.colorWhaitApp.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(20)),
                              child: val.oneprodect == null
                                  ? Center(
                                      child: Text(
                                        "اضغط علي المنتج لعرضه",
                                        style: TextStyle(
                                            color: colorsApp.colorgreyApp),
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: 250,
                                            width: double.infinity,
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: colorsApp.colorWhaitApp,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Image.network(
                                              '${val.oneprodect['image']}',
                                              fit: BoxFit.contain,
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object error,
                                                      StackTrace? stackTrace) {
                                                // في حال حدوث خطأ، يمكنك عرض صورة افتراضية
                                                return Image.asset(
                                                  "assets/images/logo.png", // المسار إلى الصورة الافتراضية
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                // عرض مؤشر تحميل أثناء تحميل الصورة
                                                if (loadingProgress == null)
                                                  return child;
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
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
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "${val.oneprodect['name']}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            textAlign: TextAlign.end,
                                            "${val.oneprodect['description']}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  "ريال  سعودي",
                                                  style: TextStyle(
                                                    color:
                                                        colorsApp.colororange,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  " ${val.oneprodect['price']}",
                                                  style: TextStyle(
                                                      color: colorsApp
                                                          .colorblackapp,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                        Container(
                                          child: Row(
                                            children: [
                                              CircularProgressWithGradientHomeProdect(),
                                              Expanded(child: Container()),
                                              CircleAvatar(
                                                backgroundColor:
                                                    colorsApp.colorWhaitApp,
                                                child: IconButton(
                                                    onPressed: () {
                                                      dialogApp.delete(
                                                      context,
                                                      () {
                                                      val.DeleteProdect(val.oneprodect['id'], context);
                                                      },
                                                      "هل ترغب في حذف المنتج من النظام ؟!");
                                                      
                                                    },
                                                    icon: Icon(
                                                        Icons.delete_outline)),
                                              ),
                                            ],
                                          ),
                                        )
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
                                        dialogApp.addProdect(
                                            context, () {}, "اضافة منتج جديد");
                                      },
                                      icon: Icon(Icons.add)),
                                ),
                                Expanded(
                                    child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "اضافة منتج ",
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
