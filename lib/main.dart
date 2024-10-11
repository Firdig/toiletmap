import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart'; // Import AppPages untuk routing
import 'package:toiletmap/app/modules/home/controllers/bottomnav_controller.dart'; // Import BottomNavController

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL, // Rute awal aplikasi
      getPages: AppPages.routes, // Daftar halaman yang bisa diakses melalui rute
      initialBinding: BindingsBuilder(() {
        Get.put(BottomNavController()); // Inisialisasi BottomNavController di sini
      }),
    );
  }
}
