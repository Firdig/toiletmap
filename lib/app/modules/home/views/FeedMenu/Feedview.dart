// lib/views/feed_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toiletmap/app/modules/home/views/FeedMenu/ToiletDetailView.dart';
import 'package:toiletmap/app/modules/home/views/custom_bottom_nav.dart';

import 'add_friends_view.dart';

class FeedView extends StatelessWidget {
  final List<Map<String, String>> feedData = [
    {
      "name": "Atzaa",
      "date": "08/10/2023 17:22",
      "rating": "1",
    },
    {
      "name": "Invreiz",
      "date": "07/10/2023 23:36",
      "rating": "2",
    },
    {
      "name": "John Doe",
      "date": "11/12/2023 19:48",
      "rating": "3",
    },
    {
      "name": "John Doe",
      "date": "11/12/2023 19:48",
      "rating": "2",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color as in the screenshot
      appBar: AppBar(
        title: Text('Feed', style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false, // Remove back button
        actions: [
          TextButton(
            onPressed: () {
              Get.to(() => AddFriendsView()); // Navigate to Add Friends Page
            },
            child: Text('Add Friends', style: TextStyle(color: Colors.yellow)),
          ),
        ],
        backgroundColor: Colors.black, // Black background for AppBar
        elevation: 0, // Remove shadow
      ),
      body: ListView.builder(
        itemCount: feedData.length,
        itemBuilder: (context, index) {
          final item = feedData[index];
          return ListTile(
            onTap: () {
              // Navigasi ke ToiletDetailView dengan mengirim nama pengguna
              Get.to(() => ToiletDetailView(), arguments: {
                'name': item['name'],
              });
            },
            leading: CircleAvatar(
              backgroundColor: Colors.grey[800], // Placeholder for profile picture
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['name'] ?? '', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                      ],
                    ),
                  ],
                ),
                Text(item['date'] ?? '', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNav(), // Keep the custom bottom navigation
    );
  }
}
