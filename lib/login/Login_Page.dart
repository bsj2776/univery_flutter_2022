import 'package:flutter/material.dart';
import 'google_login.dart';

class Login_Page extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Login_page'),
      ),
        body: google_login()
    );
  }
}



