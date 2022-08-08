// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:chattapp/pages/complete.dart';
import 'package:chattapp/pages/dash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

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

  login(String email, String password, context) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        Fluttertoast.showToast(msg: "Loged in!");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) {
              return DashBoard();
            }),
          ),
        );
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  getInfo() async {
    var email = _auth.currentUser!.email;
    var datas;
    try {
      final responce = await _firestore.collection("users").get();
      final data =
          responce.docs.where((element) => element['email'] == email).first;
      datas = data;
    } catch (e) {
      print(e.toString());
    }
    return datas;
  }

  static Future selectImage(context) async {
    final storage = FirebaseStorage.instance;
    var url;

    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    // final File file = File(image.path);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("File Upleading"),
            content: Center(
              child: CircularProgressIndicator(
                color: Colors.indigo,
              ),
            ),
          );
        });

    try {
      final uploaded = await storage.ref(image!.name).putFile(File(image.path));
      var u = await uploaded.ref.getDownloadURL();
      url = u;
    } catch (e) {
      print(e.toString());
    }
    Navigator.pop(context);
    return url;
  }
}
