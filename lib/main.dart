import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async{
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
      home: Login_Page(title: 'Login_Page'),
    );
  }
}
class Login_Page extends StatefulWidget {
  Login_Page({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _Login_Page createState() => _Login_Page();
}

class _Login_Page extends State<Login_Page>{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  late User currentUser;
  String name = "";
  String email = "";
  String url = "";

  Future<String> googleSingIn() async {
    final GoogleSignInAccount? account = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await account?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final User? user = authResult.user;

    assert(user!.isAnonymous);
    assert(await user?.getIdToken() != null);

    currentUser = await _auth.currentUser!;
    assert(user?.uid == currentUser.uid);

    setState(() {
      email = user!.email!;
      url = user.photoURL!;
      name = user.displayName!;
    });

    return '구글 로그인 성공: $user';
  }

  void googleSignOut() async {
    await _auth.signOut();
    await googleSignIn.signOut();

    setState(() {
      email = "";
      url = "";
      name = "";
    });

    print("User Sign Out");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            email == ""
                ? Container()
                : Column(
              children: <Widget>[
                Image.network(url),
                Text(name),
                Text(email),
              ],
            ),
            RaisedButton(
              onPressed: () {
                if (email == "") {
                  googleSingIn();
                } else {
                  googleSignOut();
                }
              },
              child: Container(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Icon(Icons.subdirectory_arrow_right),
                      Text(email == "" ? 'Google Login' : "Google Logout")
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
