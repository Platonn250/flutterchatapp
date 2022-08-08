// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chattapp/pages/singup.dart';
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 47,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 25),
              height: 56,
              width: 284,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'email',
                    suffixIcon: Icon(Icons.email),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 25),
              height: 56,
              width: 284,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    suffixIcon: Icon(Icons.key),
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Forgot Password?",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //   child: Align(
          //     alignment: Alignment.centerRight,
          //     child: TextButton(
          //       onPressed: () {},
          //       child: Text(
          //         "Forgot Password?",
          //         style: TextStyle(
          //             color: Colors.white, fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUp();
                    },
                  ),
                );
              },
              child: Container(
                // padding: EdgeInsets.symmetric(horizontal: 25),
                height: 56,
                width: 284,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("New User"),
            TextButton(
              onPressed: () {},
              child: Text(
                "Sign Up!?",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
