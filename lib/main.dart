import 'package:flutter/material.dart';
import 'package:gocloud/Login.dart';
import 'package:gocloud/Search.dart';
import 'package:gocloud/VerifyMember.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gocloud/publicService.dart';
import 'package:gocloud/shPref.dart';
import 'package:gocloud/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

List arabicList = [
  'تسجيل دخول',
  'تأكيد عضوية',
  'خدمات عامة',
  'الرقم',
  'تاريخ الميلاد',
  'كل العناصر يجب ادخالها',
  'الرقم خطأ او تاريخ الميلاد',
  'تسجيل دخول',
  'من نحن',
  'اتصل بنا',
  'المساعدة',
  'أرقام الطوارئ',
  'تذكير مواعيد الدواء',
  'قيمنا',
  'أقسام التقويم',
  'النشاطات القادمة',
  'لا توجد نشاطات',
  'انشاء نشاط',
  'اسم الدواء',
  'عدد المرات في اليوم',
  'من',
  'الي',
  'اللغة',
  'قبول الأعضاء'
];
List mainList = englishList;
List englishList = [
  'Member Login',
  'Verify Member',
  'Public Services',
  'Code',
  'Birthday',
  'All field required',
  'wrong ID or Date of Birth',
  'Log In',
  'About Us',
  'Contact Us',
  'Guide line',
  'Emergency numbers',
  'Pill reminder',
  'Your opinion count',
  'Section Of Calendar',
  'Active Events',
  'No events found',
  'Create new event',
  'Medicine Name',
  'number of times in day',
  'From',
  'To',
  'Language',
  'Member Appproval',
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,

      home: GoCloudHome(), // becomes the route named '/'
    ));

class GoCloudHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'GoCloud',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/memberLogin': (BuildContext context) => Loginful(),
        '/verifyMember': (BuildContext context) => VerifyMember(),
        '/publicService': (BuildContext context) => SampleAppPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
  SharedPreferences sharedPreferences;

  getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString('username').isNotEmpty &&
          sharedPreferences.getString('password').isNotEmpty) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Search()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getCredential();
    var android = new AndroidInitializationSettings('mipmap/ic_launcher');
    var ios = new IOSInitializationSettings();
    var platform = new InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(platform);

    firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> msg) {
        print(" onLaunch called ${(msg)}");
      },
      onResume: (Map<String, dynamic> msg) {
        print(" onResume called ${(msg)}");
      },
      onMessage: (Map<String, dynamic> msg) {
        showNotification(msg);
        print(" onMessage called ${(msg)}");
      },
    );
    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, alert: true, badge: true));
    firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings setting) {
      print('IOS Setting Registed');
    });
    firebaseMessaging.getToken().then((token) {
      update(token);
    });
  }

  showNotification(Map<String, dynamic> msg) async {
    var android = new AndroidNotificationDetails(
      'sdffds dsffds',
      "CHANNLE NAME",
      "channelDescription",
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, "This is title", "this is demo", platform);
  }

  update(String token) {
    SharedPreferencesHelper.setAuthTocken(token);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );
    final threelines = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Image.asset('assets/icon_membership.png'),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 0.0),
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/B.G_verify.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
//              Row(
//                children: <Widget>
//                [
              SizedBox(height: 48.0),
              logo,
              SizedBox(height: 110.0),

              Row(
                children: <Widget>[
                  Center(
                    child: Container(
                      child: Button(mainList[0], Loginful()),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: Colors.blue[900], width: 10)),
                      margin: EdgeInsets.only(top: 80, left: 20),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Button(mainList[1], VerifyMember()),
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: Colors.blue[500], width: 10)),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Button(mainList[2], SampleAppPage()),
                      margin: EdgeInsets.only(top: 80, left: 10),
//                    margin: EdgeInsets.only(top: 90),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: Colors.blue[200], width: 10)),
                    ),
                  ),
                ],
              ),
//              threelines,
            ],
          ),
        ),
      ),
    );
  }
//    });
//  }
}

class Button extends StatelessWidget {
  final String label;
  final Widget path;

  Button(this.label, this.path);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0)),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => path));
        },
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 12.2,
            fontWeight: FontWeight.bold),
          ),
        ));
  }
}
