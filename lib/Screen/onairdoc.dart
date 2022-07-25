import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamport_flutter/iamport_payment.dart';
import 'package:univery_flutter_2022/Screen/order.dart';
import 'package:univery_flutter_2022/order/controller/cart_controller.dart';
import 'package:univery_flutter_2022/order/controller/shopping_controller.dart';
import 'package:provider/provider.dart';
import 'package:univery_flutter_2022/order/model/orderModel.dart';

class onairdoc extends StatelessWidget {
  //일단 controller가 디펜던시 인젝션 되면 다시 생성할 필요 없음
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(orderModel());
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xff326295),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 7,
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
          GetBuilder<orderModel>(builder: (controller) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 7,
                  ),
                  Container(
                    width: size.width - 120,
                    child: Text('${Get.find<orderModel>().name}',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  Container(
                    width: size.width - 120,
                    child: Text('${controller.place1}',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  Container(
                    width: size.width - 120,
                    child: Text('${controller.place2}',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  Container(
                    width: size.width - 120,
                    child: Text('${controller.temName}',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  Container(
                    width: size.width - 120,
                    child: Text('${controller.hope}',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  Container(
                    width: size.width - 120,
                    child: Text('${controller.price}원',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
