import 'package:flutter/material.dart';

class orderModel extends ChangeNotifier {
  String _name = '';
  String _place1 = '';
  String _place2 = '';
  String _hope = '';
  final int _price = 1000;

  String get name => _name;
  String get place1 => _place1;
  String get place2 => _place2;
  String get hope => _hope;

  void doneOrder(String name, String place1, String place2, String hope) {
    _name = name;
    _place1 = place1;
    _place2 = place2;
    _hope = hope;

    notifyListeners();
  }
}
