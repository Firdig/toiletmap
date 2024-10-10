import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_controller.dart'; // Import controller

class UsernameEditView extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.yellow),
          onPressed: () {
            Get.back(); // Navigasi kembali
          },
        ),
        title: Text(
          'Username',
          style: TextStyle(color: Colors.yellow), // Warna teks kuning
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Aksi ketika tombol Done ditekan
            },
            child: Text(
              'Done',
              style: TextStyle(color: Colors.yellow),
            ),
          ),
        ],
        backgroundColor: Colors.black, // Latar belakang hitam
      ),
      body: SingleChildScrollView( // Menambahkan scroll untuk mencegah overflow
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.usernameTextController,
              maxLength: 50, // Maksimal 50 karakter
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black54, // Warna background TextField
                hintText: 'Add your username',
                hintStyle: TextStyle(color: Colors.yellow), // Placeholder kuning
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey, // Border abu-abu
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.yellow, // Border kuning saat fokus
                    width: 2,
                  ),
                ),
              ),
              style: TextStyle(color: Colors.white), // Teks putih
              maxLines: 1,
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Obx(() => Text(
                '${controller.username.value.length}/50', // Menggunakan observable untuk menghitung karakter
                style: TextStyle(color: Colors.grey),
              )),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black, // Latar belakang hitam
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: 2, // Ikon ketiga dipilih
        onTap: (index) {
          // Aksi navigasi jika diperlukan
        },
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.language), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
    );
  }
}
