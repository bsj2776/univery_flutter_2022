import 'package:get/get.dart';
import 'package:univery_flutter_2022/order/model/product.dart';

class CartController extends GetxController{

  var cartItems = <Product>[].obs;
  double get totalPrice => cartItems.fold(0, (e, item) => e + item.price);//get을 써서 cartItems가 초기화된 후에 값을 가져오도록 함
  int get count => cartItems.length;

  void addToItem(Product product){
    cartItems.add(product);/*이제 어디에서나 addToItem 메서드를 부르면 그 즉시 cartItems가 업데이트 될것이고
    이 CartController를 listen 하고 있는 UI는 어디에 있든지 역시나 즉시 업데이트 될것이다. */
  }
//test해봄ㅇㅇㅇ
}