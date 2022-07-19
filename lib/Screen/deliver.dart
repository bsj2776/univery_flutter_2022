import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:univery_flutter_2022/delivery.dart' as u;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:univery_flutter_2022/main.dart';
import 'dart:ui';

import 'package:univery_flutter_2022/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const deliver());
}

class deliver extends StatelessWidget {
  const deliver({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Univery Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyhomePage(),
      routes: {
        '/Delivery': (context) => u.delivery(),
        '/Main': (context) => MyApp(),
      },
    );
  }
}

class MyhomePage extends StatefulWidget {
  const MyhomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class AppState {
  bool loading;
  User? user;
  String? userEmail;
  AppState(this.loading, this.user, this.userEmail);
}

class _MyHomePageState extends State<MyhomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final app = AppState(false, null, null);

  @override
  Widget build(BuildContext context) {
    if (app.loading) return _loading();
    //if(app.user == null) return _signIn();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return main(context);
  }

  Widget _loading() {
    return Scaffold(
        appBar: AppBar(title: const Text("loading...")),
        body: const Center(child: CircularProgressIndicator()));
  }

  Widget main(BuildContext context) {
    final String? email = _auth.currentUser?.email;
    var check = email.toString().split("@");
    Size size = MediaQuery.of(context).size;
    double height_Button = 150;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Color(0xff326295),
          shape: RoundedRectangleBorder(),
          elevation: 10,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'HGU-Univery',
                  style: TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      fontFamily: 'Nanum Barumpen',
                      //나눔 글꼴
                      fontStyle: FontStyle.normal),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Card(
                  elevation: 20,
                  color: Colors.white, //Color(0xff326295),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: SizedBox(
                    width: size.width / 2 - 20,
                    height: height_Button,
                    child: Center(
                        child: Text('주문하기',
                            style: TextStyle(
                                fontSize: 30, color: Color(0xff326295)))),
                  )),
              Card(
                elevation: 20,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: SizedBox(
                  width: size.width / 2 - 20,
                  height: height_Button,
                  child: Center(
                      child: Text('배달하기',
                          style: TextStyle(
                              fontSize: 30, color: Color(0xff326295)))),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
