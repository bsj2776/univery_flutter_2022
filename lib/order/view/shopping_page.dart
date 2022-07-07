import 'package:flutter/material.dart';

class ShoppingPage extends StatelessWidget{
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          widget(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index){
                  return Card();
                },
      ),
          ),
      ],
      ),
    );
  }
}