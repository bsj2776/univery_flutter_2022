import 'package:flutter/material.dart';

class homme extends StatelessWidget {
  const homme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Image.asset('../assets/images/deliver_a.jag'),
      ),
    );
  }
}
