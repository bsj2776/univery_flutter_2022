import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class orderModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String name = '';
  String place1 = '';
  String place2 = '';
  String hope = '';
  String temName = '';
  int price = 0;

  void doneOrder(String place1, String place2, String temName, String hope) {
    this.name = _auth.currentUser!.displayName.toString();
    this.place1 = place1;
    this.place2 = place2;
    this.temName = temName;
    this.hope = hope;
    this.price = 1000;
    update();
  }
}
