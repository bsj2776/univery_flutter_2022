import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:univery_flutter_2022/order/controller/cart_controller.dart';
import 'package:univery_flutter_2022/order/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget{
  ShoppingPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());//일단 controller가 디펜던시 인젝션 되면 다시 생성할 필요 없음

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(
              builder: (controller) {//이 컨트롤러를 통해서 모든 데이터 정보를 가져오게 됨
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index){
                      return Card(
                        margin: EdgeInsets.all(12),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.products[index].productName}',//card안 왼쪽 위 글자(칼럼 안)/string interpolation을 사용해서 controller를 불러오고
                                        //뒤에 products를 불러와서 인덱스를 가져옴
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text('${controller.products[index].productDescription}'),//product밑 글자(칼럼 안)
                                    ],
                                  ),
                                  Text('\$${controller.products[index].price}',//card 오른쪽 위(row안)
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: (){
                                    cartController.addToItem(controller.products[index]);
                                  },
                                  child: Text('Add to cart'),//card안 오른쪽 아래 버튼/ add to cart버튼을 누를때마다 해당아이템의 가격이 합산되어서 출력됨
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
              }
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GetX<CartController>(
            builder: (controller) {
              return Text('Total amount: \$ ${controller.totalPrice}',
                style: TextStyle(//화면 맨 아래 가운데 글자
                fontSize: 25,
                color: Colors.white),//그만
              );
            }
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){},
          label: GetX<CartController>(
            builder: (controller) {
              return Text(
                cartController.count.toString(),
                style: TextStyle(
                fontSize: 20,
      ),
     );
            }
          ),
      icon: Icon(Icons.add_shopping_cart_rounded),
      backgroundColor: Colors.black87
      ),
    );
  }
}