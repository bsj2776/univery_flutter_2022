import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class delivery extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _delivery();
}

class _delivery extends State<delivery> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerStudent = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerAccount = TextEditingController();
  TextEditingController controllerBank = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('배달원 등록'),
          backgroundColor: Theme.of(context).primaryColor,
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
                              primaryColor: Theme.of(context).accentColor,
                              inputDecorationTheme: const InputDecorationTheme(
                                  border: OutlineInputBorder(),
                                  labelStyle: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 15.0,
                                  )
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 400,
                                  height: 20,
                                  child: Text('이름'),
                                ),
                                SizedBox(
                                  height: 0,
                                ),
                                TextField(
                                  controller: controllerName,
                                  decoration:
                                  InputDecoration(labelText: 'ex) 홍길동'),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  width: 400,
                                  height: 20,
                                  child: Text('학번 '),
                                ),
                                TextField(
                                  controller: controllerStudent,
                                  decoration:
                                  InputDecoration(labelText: 'ex) 22100000 '),
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
                                  decoration:
                                  InputDecoration(labelText: 'ex) 010-0000-0000 '),
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
                                  decoration:
                                  InputDecoration(labelText: ''),
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
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                          final user = User(
                                            name: controllerName.text,
                                            studentId: controllerStudent.text,
                                            phone: controllerPhone.text,
                                            account: controllerAccount.text,
                                            bank: controllerBank.text,
                                          );
                                          if(user.name == "" || user.studentId == null || user.phone == null ||
                                            user.account == null || user.bank == null){
                                            showSnackBar(context);
                                          }else {
                                            createUser(user);
                                            showSnackBar2(context);
                                          }
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
        )
    );
  }
  Future createUser(User user) async{
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;

    final json = user.toJson();
    ///create document and write data to Firebase
    await docUser.set(json);
  }
}
class User {
  String id;
  final String name;
  final String studentId;
  final String phone;
  final String account;
  final String bank;

  User({
    this.id = '',
    required this.name,
    required this.studentId,
    required this.phone,
    required this.account,
    required this.bank,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'studentId': studentId,
    'phone': phone,
    'account': account,
    'bank': bank,
  };
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