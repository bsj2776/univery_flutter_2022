import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:univery_flutter_2022/order/controller/cart_controller.dart';
import 'package:univery_flutter_2022/order/controller/shopping_controller.dart';

class onairdoc extends StatefulWidget {
  onairdoc({Key? key}) : super(key: key);

  @override
  State<onairdoc> createState() => _onairdocState();
}

class _onairdocState extends State<onairdoc> {
  final shoppingController = Get.put(ShoppingController());

  final cartController = Get.put(CartController());
  //일단 controller가 디펜던시 인젝션 되면 다시 생성할 필요 없음
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff326295),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: Text(
                    '이름',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Container(
                  child: Text(
                    '장소 1',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Container(
                  child: Text(
                    '장소 2',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Container(
                  child: Text(
                    '물건이름',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Container(
                  child: Text(
                    '요청사항',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Container(
                  child: Text(
                    '가격',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
