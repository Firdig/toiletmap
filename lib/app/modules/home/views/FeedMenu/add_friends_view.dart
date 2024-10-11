// lib/views/add_friends_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'qr_code_view.dart'; // Import QRCodeView

class AddFriendsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Get.back(); // Kembali ke halaman sebelumnya
          },
        ),
        title: Text('Add Friends', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.white),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text("Invreiz's", style: TextStyle(color: Colors.white)),
              subtitle: Text("now 17 hours ago", style: TextStyle(color: Colors.grey)),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {
                // Action when tapped
              },
            ),
            Divider(color: Colors.grey),
            ListTile(
              title: Text("Invudin", style: TextStyle(color: Colors.white)),
              subtitle: Text("1 days ago", style: TextStyle(color: Colors.grey)),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {
                // Action when tapped
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        child: Icon(Icons.qr_code, color: Colors.black),
        onPressed: () {
          Get.to(() => QRCodeView()); // Navigate to QR Code View
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        currentIndex: 1, // Index for the Add Friends tab
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        onTap: (index) {
          // Handle bottom navigation tap
          if (index == 0) {
            Get.toNamed('/mapPage'); // Navigate to Map Page
          } else if (index == 1) {
            Get.to(() => AddFriendsView()); // Stay on Add Friends Page
          } else if (index == 2) {
            Get.toNamed('/profilePage'); // Navigate to Profile Page
          } else if (index == 3) {
            Get.toNamed('/notificationsPage'); // Navigate to Notifications Page
          }
        },
      ),
    );
  }
}
