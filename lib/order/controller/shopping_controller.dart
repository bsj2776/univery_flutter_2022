//UI에 바인드 하기를 원하는 요소를 지정해주는 것
import 'package:get/get.dart';

import '../model/product.dart';
/*controller가 생성될 때 호츨되는 oninit이라는 메소드라는 것이 있음
->이 메소드를 통해서 원하는 명령을 컨트롤러가 생성될 때 실행시킬 수 있음*/
class ShoppingController extends GetxController{
  var products = <Product>[].obs;//데이터가 바뀌자마자 UI가 자동으로 업데이트 될 수 있음

  @override
  void onInit(){
    super.onInit();
    fetchData();

  }

  void fetchData() async{//서버에서 데이터를 끌어오는 역할을 해야하므로 async방식
    await Future.delayed(Duration(seconds: 2));//2초후에 데이터 들어오게 하기
    var productData = [
      Product(
          id: 1,
          productDescription: 'some description about product',
          productName: 'Mouse',
          price: 30),
      Product(
          id: 2,
          productDescription: 'some description about product',
          productName: 'Keyboard',
          price: 40),
      Product(
          id: 3,
          productDescription: 'some description about product',
          productName: 'Monitor',
          price: 620),
      Product(
          id: 4,
          productDescription: 'some description about product',
          productName: 'Ram',
          price: 80),
      Product(
          id: 5,
          productDescription: 'some description about product',
          productName: 'Speaker',
          price: 120.5),
    ];

    products.assignAll(productData);

  }
}