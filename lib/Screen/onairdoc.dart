import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iamport_flutter/iamport_payment.dart';
import 'package:univery_flutter_2022/Screen/order.dart';
import 'package:univery_flutter_2022/order/controller/cart_controller.dart';
import 'package:univery_flutter_2022/order/controller/shopping_controller.dart';
import 'package:provider/provider.dart';
import 'package:univery_flutter_2022/order/model/orderModel.dart';

class onairdoc extends StatefulWidget {
  onairdoc({Key? key}) : super(key: key);

  @override
  State<onairdoc> createState() => _onairdocState();
}

class _onairdocState extends State<onairdoc> {
  final shoppingController = Get.put(ShoppingController());

  String name = '홍길동';
  String place1 = '매점';
  String place2 = '은혜관';
  String temName = '아이스크림';
  String price = '1000원';
  String hope = '아이스크림 안녹게 빨리 와주세요';

  late orderModel _orderModel;

  final cartController = Get.put(CartController());
  //일단 controller가 디펜던시 인젝션 되면 다시 생성할 필요 없음
  @override
  Widget build(BuildContext context) {
    _orderModel = Provider.of<orderModel>(context, listen: false);

    return ChangeNotifierProvider(
      create: (_) => orderModel(),
      child: Scaffold(
        backgroundColor: Color(0xff326295),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    child: Text(Provider.of<orderModel>(context).name,
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  Container(
                    child: Text(place1,
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  Container(
                    child: Text(place2,
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  Container(
                    child: Text(temName,
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  Container(
                    child: Text(hope,
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  Container(
                    child: Text(price,
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
