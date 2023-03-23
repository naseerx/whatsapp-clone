import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/Core/Constants/colors.dart';
import 'package:flutter_whatsapp_clone/Core/Constants/strings.dart';
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
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kScaffoldBackground,
        useMaterial3: true,
      ),
      initialRoute: '/home',
      getPages: appRoutes(),
    );
  }
}
