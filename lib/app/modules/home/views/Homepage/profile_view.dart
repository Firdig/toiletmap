import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../profilepage/region_view.dart'; // Import RegionView untuk navigasi
//import '../profilepage/ToiletMarkedView'; // Import ToiletMarkedView untuk navigasi
import '../profilepage/following_view.dart'; // Import FollowingView untuk navigasi
import '../profilepage/followers_view.dart'; // Import FollowersView untuk navigasi

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code, color: Colors.white),
            onPressed: () {
              // Aksi QR Code
              Get.snackbar('QR Code', 'QR Code pressed');
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Aksi untuk opsi lainnya
              Get.snackbar('More', 'More options pressed');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Bagian foto profil dan nama
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://placehold.co/100x100'), // Placeholder image
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Member Since:',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            // Tombol Edit Profile dan Add Friend
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.snackbar('Edit Profile', 'Navigating to edit profile');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.yellow[600], // Warna teks
                  ),
                  child: Text('Edit Profile'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Get.snackbar('Add Friend', 'Friend added');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.yellow[600], // Warna teks
                  ),
                  child: Text('Add Friend'),
                ),
              ],
            ),
            SizedBox(height: 24),
            // Box panjang untuk Toilet Marked dengan navigasi ke ToiletMarkedView
            GestureDetector(
              // onTap: () {
              //   Get.to(() => ToiletMarkedView());
              // },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.tag, color: Colors.red),
                        SizedBox(height: 8),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '11',
                          style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Toilets Marked',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Icon(Icons.chevron_right, color: Colors.white),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Box gabungan untuk States, Countries, Continents dengan navigasi ke RegionView
            GestureDetector(
              onTap: () {
                Get.to(() => RegionView());
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('4', 'States', Colors.cyan),
                    _buildStatItem('2', 'Countries', Colors.blue),
                    _buildStatItem('1', 'Continents', Colors.purple),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Box untuk Following dan Followers yang ukurannya sama dengan Toilets Marked
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Box untuk Following dengan navigasi ke FollowingView
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => FollowingView());
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.pink),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.group, color: Colors.pink),
                          SizedBox(height: 8),
                          Text(
                            '6',
                            style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Following',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                // Box untuk Followers dengan navigasi ke FollowersView
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => FollowersView());
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.people, color: Colors.green),
                          SizedBox(height: 8),
                          Text(
                            '3',
                            style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Followers',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Settings
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text('Settings', style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.chevron_right, color: Colors.white),
              onTap: () {
                Get.snackbar('Settings', 'Navigating to Settings');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Set to selected tab
        onTap: (index) {
          Get.snackbar('Tab', 'Navigating to tab $index');
        },
        backgroundColor: Colors.black,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.public), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
    );
  }

  Widget _buildStatItem(String count, String label, Color color) {
    return Column(
      children: [
        Icon(Icons.public, color: color),
        SizedBox(height: 8),
        Text(
          count,
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
