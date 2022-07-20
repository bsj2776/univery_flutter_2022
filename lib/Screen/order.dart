import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class order extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('주문하기'),
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
                              primaryColor: Theme.of(context).accentColor,
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
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 400,
                                  height: 20,
                                  child: Text('물건 이름'),
                                ),
                                SizedBox(
                                  height: 0,
                                ),
                                TextField(
                                  controller: controller,
                                  decoration:
                                      InputDecoration(labelText: 'ex) 아이스크림'),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  width: 400,
                                  height: 20,
                                  child: Text('받을 장소'),
                                ),
                                TextField(
                                  controller: controller2,
                                  decoration:
                                      InputDecoration(labelText: 'ex) 오석관 1층 '),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 0,
                                ),
                                SizedBox(
                                  width: 400,
                                  height: 20,
                                  child: Text('물건이 있는 장소'),
                                ),
                                TextField(
                                  controller: controller3,
                                  decoration: InputDecoration(
                                      labelText: 'ex) 에벤에셀 1층 헤브론홀 냉장고'),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 0,
                                ),
                                SizedBox(
                                  height: 100,
                                ),
                                RaisedButton(
                                  color: Color(0xff326295),
                                  onPressed: () {
                                    if (controller == null) {
                                      showSnackBar(context);
                                    } else {
                                      showSnackBar2(context);
                                      final name = controller.text;
                                      createUser(name: name);
                                    }
                                  },
                                  child: Text(
                                    '결제하기',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
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

  Future createUser({required String name}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');

    /*final user{
      'name': name,
      'age': 21,
      'birthday': DateTime(2001, 7, 28),
    };
    final json = user.toJson();
    await docUser.set(json);*/
  }
}

void showSnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text('필수입력란을 채워야 합니다', textAlign: TextAlign.center),
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
