// ignore_for_file: prefer_const_constructors

import 'package:chattapp/pages/Auth/auth.dart';
import 'package:chattapp/pages/complete.dart';
import 'package:chattapp/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatelessWidget {
  SignUp({
    Key? key,
  }) : super(key: key);

  final email = TextEditingController();
  final password = TextEditingController();
  final comfirmPassword = TextEditingController();

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
              "Sign Up",
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
                  controller: email,
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
                  controller: password,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    suffixIcon: Icon(Icons.key),
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
                  controller: comfirmPassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Confirm password',
                    suffixIcon: Icon(Icons.key),
                  ),
                ),
              ),
            ),
          ),
          // TextButton(
          //   onPressed: () {},
          //   child: Text(
          //     "Forgot Password?",
          //     style:
          //         TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          //   ),
          // ),
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
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap: () async {
                if (email.text.trim().isNotEmpty && password.text.isNotEmpty) {
                  await Auth().signUp(
                    email.text.trim(),
                    password.text.trim(),
                    comfirmPassword.text.trim(),
                    context,
                  );
                } else {
                  Fluttertoast.showToast(msg: "Fill the fields");
                }
                email.clear();
                password.clear();
                comfirmPassword.clear();
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
                      "Sign Up",
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
            Text("Already Have an Account?"),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ),
                );
              },
              child: Text(
                "Login",
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
