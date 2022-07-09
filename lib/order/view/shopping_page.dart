import 'package:flutter/material.dart';

class ShoppingPage extends StatelessWidget{
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 5,
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
                                  Text('Product name',//card안 왼쪽 위 글자(칼럼 안)
                                  style: TextStyle(fontSize: 24),
                                  ),
                                  Text('Product description'),//product밑 글자(칼럼 안)
                                ],
                              ),
                              Text('\$30',//card 오른쪽 위(row안)
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: (){},
                              child: Text('Add to cart'),//card안 오른쪽 아래 버튼
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ),
          SizedBox(
            height: 30,
          ),
          Text('Show Total amount', style: TextStyle(//화면 맨 아래 가운데 글자
            fontSize: 25,
            color: Colors.white
          ),)
        ],
      ),
    );
  }
}