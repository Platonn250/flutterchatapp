// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                // radius: 23,
                backgroundColor: Colors.white54,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.blue[900],
        title: Text('Chatts'),
      ),
      body: Center(
        child: Text("Profile Page"),
      ),
    );
  }
}
