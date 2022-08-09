// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:chattapp/pages/Auth/auth.dart';
import 'package:chattapp/pages/dash.dart';
import 'package:flutter/material.dart';

class CompleteProfile extends StatelessWidget {
  final user;
  CompleteProfile({Key? key, this.user}) : super(key: key);
  final name = TextEditingController();
  final number = TextEditingController();
  var image;
  // final image = TextEditingController();

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
              "Complete",
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
                  controller: name,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Name',
                    suffixIcon: Icon(Icons.title),
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
                  controller: number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Contact',
                    suffixIcon: Icon(Icons.phone),
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
                  onTap: () async {
                    image = await Auth().selectImage(context);
                  },
                  // controller: image,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Select Photo',
                    suffixIcon: Icon(Icons.person),
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
                await Auth().complete(
                  user: user,
                  name: name.text.trim(),
                  number: number.text.trim(),
                  image: image,
                  context: context,
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
                  // child: GestureDetector(
                  // onTap: () async {
                  //   await Auth().complete(
                  //       user: user,
                  //       name: name.text.trim(),
                  //       number: number.text.trim(),
                  //       image: image,
                  //       context: context);
                  // },
                  child: Center(
                    child: Text(
                      "Submit",
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
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text("Already Have an Account?"),
          //     TextButton(
          //       onPressed: () {},
          //       child: Text(
          //         "Login",
          //         style: TextStyle(
          //             color: Colors.white, fontWeight: FontWeight.bold),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
