import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'favourites_page.dart';
import 'settings_page.dart';
import 'help_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Profile'),
        actions: [Icon(Icons.settings)],
        elevation: 0,
      ),
      body: Column(
        children: [
          // Profile Header
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person, size: 40),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      "ABC XYZ",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "+910123456789\nabcxyz@gmail.com",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          // Profile Options
          ListTile(
            title: Text('Edit Profile'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => EditProfilePage()));
            },
          ),
          ListTile(
            title: Text('Favourites'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FavoritesPage()));
            },
          ),
          ListTile(
            title: Text('Setting And Privacy'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
          ListTile(
            title: Text('Help'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HelpPage()));
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Courses"),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: "Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
