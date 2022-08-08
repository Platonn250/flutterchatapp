import 'package:chattapp/pages/complete.dart';
import 'package:chattapp/pages/dash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Auth {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  Future signUp(
      String email, String password, String comfirmPasswod, context) async {
    var user;
    if (password == comfirmPasswod) {
      try {
        user = await _auth
            .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
            .then((value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CompleteProfile(user: value.user);
              },
            ),
          );
        });
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(
          msg: e.message.toString(),
        );
        print(
          e.toString(),
        );
      }
    } else {
      Fluttertoast.showToast(msg: "Passwords do'nt match");
    }
    return user;
  }

  complete({required User user, name, number, image, context}) async {
    try {
      await _firestore.collection("users").add(
        {
          'email': user.email,
          'name': name,
          'number': number,
          'image': image,
        },
      ).then(
        (value) {
          Fluttertoast.showToast(msg: "profile completed");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) {
                return DashBoard();
              }),
            ),
          );
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
