import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rock_scissor_paper/routes/routes.dart';
import 'package:get/get.dart';

void main() {
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: pages,
      debugShowCheckedModeBanner: false,
      title: 'Rock Scissor Paper',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}
