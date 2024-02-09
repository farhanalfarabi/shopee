import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopee/pages/facebook.dart';
import './pages/login.dart';
import './pages/home.dart';
import './pages/google.dart';
import './pages/whatsapp.dart';
import './pages/daftar.dart';
import './pages/telepon.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      getPages: [
        GetPage(
          name: "/login",
          page: () => Login(),
        ),
        GetPage(
          name: "/home",
          page: () => Home(),
        ),
        GetPage(
          name: "/google",
          page: () => Google(),
        ),
        GetPage(
          name: "/facebook",
          page: () => Facebook(),
        ),
        GetPage(
          name: "/whatsapp",
          page: () => Whatsapp(),
        ),
        GetPage(
          name: "/daftar",
          page: () => Daftar(),
        ),
        GetPage(
          name: "/telepon",
          page: () => Telepon(),
        ),
      ],
    );
  }
}
