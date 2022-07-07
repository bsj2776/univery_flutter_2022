import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Univery Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyhomePage(),
      routes: {
        //'login': (context) => login(),
        //'/Sign_up': (context) => Sign_up()
      },
    );
  }
}

class MyhomePage extends StatefulWidget{
  const MyhomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Center(
                child: Text(
                  'C-STYLE',
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
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            //로그인 회원가입 창
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlatButton(
                    child: const Text(
                      '로그인',
                      style: TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        fontFamily: 'Nanum Myeongjo',
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      final result =
                          await Navigator.pushNamed(context, '/login');
                    },
                  ),
                  //로그인과 회원가입 사이의 여백
                  const SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    child: const Text(
                      '회원 가입',
                      style: TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        fontFamily: 'Nanum Myeongjo',
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      final result =
                          await Navigator.pushNamed(context, '/Sign_up');
                    },
                  ),
                ],
              ),
            ),
            ListTile(
                title: Text('중고 옷 올리기'),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
              title: Text('TOP'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('OUTER'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('PAINTS'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('SHOES'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('ACCESSORY'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
