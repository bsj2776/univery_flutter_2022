import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      home: const MyhomePage(),
      routes: {
        //'/Profile': (context) => Profile(),
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

class AppState{
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
    if(app.loading) return _loading();
    //if(app.user == null) return _signIn();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return main();
  }

  Widget _loading(){
    return Scaffold(
        appBar: AppBar(title : const Text("loading...")),
        body : const Center(child: CircularProgressIndicator())
    );
  }

  Widget main(){
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
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
                  ), onPressed: () {  },
                ),
              ],
            )
          ],
        ),
      ),

      body: const Center(
        child: Text('가장 최근에 올린 옷부터 정렬'),
      ),

      //슬라이드 메뉴
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            //로그인 회원가입 창
            if(app.user == null) Login_SignUp()
            else Login_done(),
            ListTile(
                title: const Text('프로필'),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
              title: const Text('배달 내역 확인'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('주문 내역 확인'),
              onTap: () {
                Navigator.pop(context);
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
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget Login_done(){
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
            onPressed: () async {
              final result = await Navigator.pushNamed(context, '/My_information');
            },
          ),
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
              onPressed: (){
                _sign_Out();
              }
          ),
        ],
      ),
      decoration: const BoxDecoration(
        color: Colors.black,
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
        color: Colors.black,
      ),
    );
  }

  Future<String> _signIn() async{
    setState(() => app.loading = true);
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final UserCredential awitAsult = await _auth.signInWithCredential(credential);
    final User? user = awitAsult.user;

    setState(() {
      app.loading = false;
      app.user = user;
      app.userEmail = user?.email;
      print(user);
    });

    var check = app.userEmail!.split("@");
    if(check[1] != 'handong.ac.kr') {
      showSnackBar(context);
      _sign_Out();
    }

    return 'successor';
  }

  _sign_Out() async{
    await _googleSignIn.signOut();
    setState(() {
      return app.user = null;
    });
  }
}

void showSnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(const SnackBar(
    content: Text('한동 이메일로만 가입 가능 합니다.', textAlign: TextAlign.center),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}