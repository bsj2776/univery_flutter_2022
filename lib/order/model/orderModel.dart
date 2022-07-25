import 'package:flutter/material.dart';
import 'package:get/get.dart';

class orderModel extends GetxController {
  String name = '';
  String place1 = '';
  String place2 = '';
  String hope = '';
  String temName = '';
  final int price = 1000;

  void doneOrder(
      String name, String place1, String place2, String temName, String hope) {
    this.name = name;
    this.place1 = place1;
    this.place2 = place2;
    this.temName = temName;
    this.hope = hope;
    update();
  }
}
