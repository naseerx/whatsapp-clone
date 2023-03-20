import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/Core/Constants/colors.dart';
import 'package:flutter_whatsapp_clone/Core/routes.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Whatsapp Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kScaffoldBackground
      ),
      initialRoute: '/home',
      getPages: appRoutes(),
    );
  }
}
