// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_print

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
  final _firebaseStorage = FirebaseStorage.instance;
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

  Future uploadVideoFile(String file) async {
    Reference ref = _firebaseStorage.ref().child('${DateTime.now()}.mp4');
    UploadTask uploadTask = ref.putFile(File(file));

    TaskSnapshot taskSnapshot = await uploadTask
        // ignore: avoid_print
        .whenComplete(() => print('done'))
        // ignore: invalid_return_type_for_catch_error, avoid_print
        .catchError((error) => print('something went wrong'));
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }

  Future selectImage(context) async {
    final storage = FirebaseStorage.instance;
    var url;

    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    Fluttertoast.showToast(msg: "image picked");
    // final File file = File(image.path);
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: Text("File Upleading"),
    //         content: Center(
    //           child: CircularProgressIndicator(
    //             color: Colors.indigo,
    //           ),
    //         ),
    //       );
    //     });

    url = uploadVideoFile(image!.path);
  }
}
