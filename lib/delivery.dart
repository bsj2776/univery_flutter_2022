import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class delivery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _delivery();
}

class _delivery extends State<delivery> {
  TextEditingController controllerStudent = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerAccount = TextEditingController();
  TextEditingController controllerBank = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('배달원 등록'),
          backgroundColor: Color(0xff326295),
        ),
        body: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(children: [
                      Container(
                        child: Form(
                          child: Theme(
                            data: ThemeData(
                              primaryColor: Color(0xff326295),
                              inputDecorationTheme: const InputDecorationTheme(
                                  border: OutlineInputBorder(),
                                  labelStyle: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 15.0,
                                  )),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(children: <Widget>[
                                SizedBox(
                                  width: 400,
                                  height: 20,
                                  child: Text('학번 '),
                                ),
                                TextField(
                                  controller: controllerStudent,
                                  decoration: InputDecoration(
                                      labelText: 'ex) 22100000 '),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 0,
                                ),
                                SizedBox(
                                  width: 400,
                                  height: 20,
                                  child: Text('전화번호 '),
                                ),
                                TextField(
                                  controller: controllerPhone,
                                  decoration: InputDecoration(
                                      labelText: 'ex) 010-0000-0000 '),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 0,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(0),
                                  child: SizedBox(
                                    width: 400,
                                    height: 20,
                                    child: Text('계좌번호 '),
                                  ),
                                ),
                                TextField(
                                  controller: controllerAccount,
                                  decoration: InputDecoration(labelText: '-을 포함시켜주세요'),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  width: 400,
                                  height: 20,
                                  child: Text('은행명 '),
                                ),
                                TextField(
                                  controller: controllerBank,
                                  decoration:
                                      InputDecoration(labelText: 'ex) 기업은행 '),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 100,
                                ),
                                Container(
                                  width: 111,
                                  height: 80,
                                  child: RaisedButton(
                                      child: Text(
                                        '완료 ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      color: Color(0xff326295),
                                      onPressed: () {
                                        final docUser = FirebaseFirestore.instance.collection('users').doc(_auth.currentUser?.uid);
                                        docUser.update({
                                          'studentId': controllerStudent.text,
                                          'phone': controllerPhone.text,
                                          'account': controllerAccount.text,
                                          'bank': controllerBank.text,
                                          'delivery' : 1,
                                        });
                                        showSnackBar2(context);
                                      }),
                                )
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            );
          },
        ));
  }

  void showSnackBar(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('모든 입력란을 채워야 합니다', textAlign: TextAlign.center),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ));
  }

  void showSnackBar2(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('등록이 완료되었습니다', textAlign: TextAlign.center),
      duration: Duration(seconds: 2),
      backgroundColor: Theme.of(context).primaryColor,
    ));
  }
}
