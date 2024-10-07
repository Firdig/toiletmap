import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:toiletmap/app/modules/home/controllers/following_controller.dart';

class FollowingView extends GetView<FollowingController> {
  @override
  Widget build(BuildContext context) {
    final FollowingController controller = Get.put(FollowingController());

    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('Users you follow',
          style: TextStyle(color: Colors.white),),

        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.users.length,
        itemBuilder: (context, index) {
          final user = controller.users[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: user['image'] != null
                  ? NetworkImage(user['image']!)
                  : null,
              backgroundColor: Colors.grey,
            ),
            title: Text(
              user['name']!,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          );
        },
      )),
      bottomNavigationBar: Obx(
            () => Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, -3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: BottomNavigationBar(
              currentIndex: controller.selectedIndex.value,
              onTap: controller.onBottomNavTapped,
              backgroundColor: Colors.transparent, // Make it transparent
              elevation: 0, // Remove elevation
              selectedItemColor: Colors.yellow,
              unselectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              items: [
                _buildNavItem(Icons.language, 0, controller.selectedIndex.value),
                _buildNavItem(Icons.layers, 1, controller.selectedIndex.value),
                _buildNavItem(Icons.person, 2, controller.selectedIndex.value),
                _buildNavItem(Icons.notifications, 3, controller.selectedIndex.value),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build each navigation item with a custom look
  BottomNavigationBarItem _buildNavItem(IconData icon, int index, int selectedIndex) {
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.yellow.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(8.0),
        child: Icon(
          icon,
          size: 30, // Increase icon size
          color: selectedIndex == index ? Colors.yellow : Colors.white,
        ),
      ),
      label: '',
    );
  }
}