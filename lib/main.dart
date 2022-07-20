import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:univery_flutter_2022/delivery.dart' as u;
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Profile.dart';
import 'order/view/shopping_page.dart';
import 'package:univery_flutter_2022/Screen/order.dart';
import 'package:univery_flutter_2022/Screen/deliver.dart' as d;
import 'dart:ui';

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
      home: const MyhomePage(),
      routes: {
        '/Profile': (context) => Profile(),
        '/Delivery': (context) => u.delivery(),
        '/Order': (context) => order(),
        '/Deliver': (context) => d.deliver(),
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

    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
              ),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                        elevation: 20,
                        color: Colors.white, //Color(0xff326295),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => order()),
                            );
                          },
                          child: SizedBox(
                            width: size.width / 2 - 20,
                            height: height_Button,
                            child: Center(
                              child: Text('주문하기',
                                  style: TextStyle(
                                      fontSize: 30, color: Color(0xff326295))),
                            ),
                          ),
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
            ),
            Center(
              child: Text("music"),
            ),
            Center(
              child: Text("apps"),
            ),
            Center(
              child: Text("settings"),
            ),
          ],
        ),
        extendBodyBehindAppBar: true, // add this line

        bottomNavigationBar: Container(
          color: Colors.white, //색상
          child: Container(
            height: 70,
            padding: EdgeInsets.only(bottom: 10, top: 5),
            child: const TabBar(
              //tab 하단 indicator size -> .label = label의 길이
              //tab 하단 indicator size -> .tab = tab의 길이
              indicatorSize: TabBarIndicatorSize.label,
              //tab 하단 indicator color
              indicatorColor: Colors.red,
              //tab 하단 indicator weight
              indicatorWeight: 2,
              //label color
              labelColor: Colors.red,
              //unselected label color
              unselectedLabelColor: Colors.black38,
              labelStyle: TextStyle(
                fontSize: 13,
              ),
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.music_note),
                  text: 'Music',
                ),
                Tab(
                  icon: Icon(
                    Icons.apps,
                  ),
                  text: 'Apps',
                ),
                Tab(
                  icon: Icon(
                    Icons.settings,
                  ),
                  text: 'Settings',
                )
              ],
            ),
          ),
        ),

        //슬라이드 메뉴
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              //로그인 회원가입 창
              if (app.user == null)
                Login_SignUp()
              else if (check[1] != "handong.ac.kr")
                Login_SignUp()
              else
                Login_done(),
              ListTile(
                title: const Text('배달 내역 확인'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('주문 내역 확인'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ShoppingPage()));
                },
              ),
              ListTile(
                title: const Text('수락한 배달 목록'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('배달원 등록'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => u.delivery()),
                  );
                },
              ),
            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Widget Login_done() {
    return DrawerHeader(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
              child: const Text(
                '내 정보',
                style: const TextStyle(
                  height: 0.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  //fontFamily: 'Nanum Myeongjo',
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              }),
          const SizedBox(
            height: 10,
          ),
          FlatButton(
              child: const Text(
                '로그아웃',
                style: TextStyle(
                  height: 0.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  //fontFamily: 'Nanum Myeongjo',
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                _sign_Out();
              }),
        ],
      ),
      decoration: const BoxDecoration(
        color: Color(0xff326295),
      ),
    );
  }

  Widget Login_SignUp() {
    return DrawerHeader(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: const Text(
              '구글 아이디로 로그인',
              style: TextStyle(
                height: 1.5,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Nanum Myeongjo',
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              _signIn();
            },
          ),
        ],
      ),
      decoration: const BoxDecoration(
        color: Color(0xff326295),
      ),
    );
  }

  Future<String> _signIn() async {
    setState(() => app.loading = true);
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final UserCredential awitAsult =
        await _auth.signInWithCredential(credential);
    final User? user = awitAsult.user;

    setState(() {
      app.loading = false;
      app.user = user;
      app.userEmail = user?.email;
      print(user);
    });

    final String? email = _auth.currentUser?.email;
    var check = email.toString().split("@");
    if (check[1] != "handong.ac.kr") {
      showSnackBar(context);
      _sign_Out();
    }

    return 'successor';
  }

  _sign_Out() async {
    await _googleSignIn.signOut();
    setState(() {
      return app.user = null;
    });
  }

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('한동대학교 메일로만 로그인할 수 있습니다.', textAlign: TextAlign.center),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ));
  }

  void showSnackBar2(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('서비스이용을 위해 전화번호 인증이 필요합니다.', textAlign: TextAlign.center),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ));
  }
}
