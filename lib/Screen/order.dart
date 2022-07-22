import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:univery_flutter_2022/Screen/paymant.dart' as pay;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class order extends StatefulWidget {
  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
  TextEditingController controller = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  TextEditingController controller3 = TextEditingController();

  TextEditingController controller4 = TextEditingController();

  TextEditingController controller5 = TextEditingController();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    // 알림 초기화
    init();
  }

  void init() async {
    // 알림용 ICON 설정
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    // 알림 초기화
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      //onSelectNotification은 알림을 선택했을때 발생
      if (payload != null) {
        debugPrint('notification payload: $payload');
      }
    });
  }

  // 알림 더미 타이틀
  List pushTitleList = ['하하', '메메', '히히', '호호', '아아', '우우'];

  // 알림 그룹 ID 카운트용, 알림이 올때마다 이 값을 1씩 증가 시킨다.
  int groupedNotificationCounter = 1;

  // 알림 발생 함수!!
  Future<void> _showGroupedNotifications() async {
    // 알림 그룹 키
    const String groupKey = 'com.android.example.WORK_EMAIL';
    // 알림 채널
    const String groupChannelId = 'grouped channel id';
    // 채널 이름
    const String groupChannelName = 'grouped channel name';
    // 채널 설명
    const String groupChannelDescription = 'grouped channel description';

    // 안드로이드 알림 설정
    const AndroidNotificationDetails notificationAndroidSpecifics =
        AndroidNotificationDetails(groupChannelId, groupChannelName,
            importance: Importance.max,
            priority: Priority.high,
            groupKey: groupKey);

    // 플랫폼별 설정 - 현재 안드로이드만 적용됨
    const NotificationDetails notificationPlatformSpecifics =
        NotificationDetails(android: notificationAndroidSpecifics);

    // 알림 발생!
    await flutterLocalNotificationsPlugin.show(
        groupedNotificationCounter,
        pushTitleList[1],
        '하이제니스!! 이것은 몸체 메시지 입니다.- ${pushTitleList[1]}',
        notificationPlatformSpecifics);
    // 알림 그룹 ID를 1씩 증가 시킨다.
    groupedNotificationCounter++;

    // 그룹용 알림 설정
    // 특징 setAsGroupSummary 가 true 이다.
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(groupChannelId, groupChannelName,
            onlyAlertOnce: true, groupKey: groupKey, setAsGroupSummary: true);

    // 플랫폼별 설정 - 현재 안드로이드만 적용됨
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    // 그룹용 알림 출력
    // 이때는 ID를 0으로 고정시켜 새로 생성되지 않게 한다.
    await flutterLocalNotificationsPlugin.show(
        0, '', '', platformChannelSpecifics);
  }

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
                                  height: 50,
                                ),
                                RaisedButton(
                                  color: Color(0xff326295),
                                  onPressed: _showGroupedNotifications,
                                  child: Text(
                                    '알림창 띄우기',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  //
                                  height: 40,
                                ),
                                RaisedButton(
                                  color: Color(0xff326295),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                pay.Payment()));
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
