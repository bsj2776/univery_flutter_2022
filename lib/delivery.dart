import 'package:flutter/material.dart';

class delivery extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

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
                              inputDecorationTheme: InputDecorationTheme(
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
                                  child: Text('이름'),
                                ),
                                SizedBox(
                                  height: 0,
                                ),
                                TextField(
                                  controller: controller,
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
                                  controller: controller,
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
                                  controller: controller,
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
                                  controller: controller2,
                                  decoration:
                                  InputDecoration(labelText: ''),
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
                                        if (controller == null) {
                                          showSnackBar(context);
                                        } else {
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
        ));
  }
}

void showSnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text('요청할 물건을 입력해주세요', textAlign: TextAlign.center),
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