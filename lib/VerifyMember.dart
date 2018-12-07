import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gocloud/model/verifyModel.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class VerifyMember extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _VerifyState createState() => new _VerifyState();
}

class _VerifyState extends State<VerifyMember> {
  Map<String, double> _startLocation;
  Map<String, double> _currentLocation;
  Location _location = new Location();
  StreamSubscription<Map<String, double>> _locationSubscription;

  bool _permission = false;
  String error;

  bool currentWidget = true;
  double opacity = 1.0;

  bool start = true;
  bool allInfo = false;
  bool loading = false;
  bool notfound = false;

  final iDController = TextEditingController();
  final nameController = TextEditingController();
  final Insurance_StatusController = TextEditingController();
  final Insurance_ClassController = TextEditingController();
  final Pharmacy_CoinsuranceController = TextEditingController();
  final Start_DateController = TextEditingController();
  final Expire_DateController = TextEditingController();
  final Policy_CodeController = TextEditingController();
  @override
  void initState() {
    super.initState();

    initPlatformState();

    _locationSubscription =
        _location.onLocationChanged().listen((Map<String,double> result) {
          setState(() {
            _currentLocation = result;
          });
        });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    Map<String, double> location;
    // Platform messages may fail, so we use a try/catch PlatformException.

    try {
      _permission = await _location.hasPermission();
      location = await _location.getLocation();


      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'Permission denied - please ask the user to enable it from the app settings';
      }

      location = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;

    setState(() {
      _startLocation = location;
    });

  }
  @override
  void dispose() {
    iDController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  memberState   memberName   policy  pharmacy   insuranceClass
    final memberState = ListView(
      shrinkWrap: true,
      children: <Widget>[
        TextField(
          controller: nameController,
          style: new TextStyle(color: Colors.white),
          decoration: InputDecoration(
          ),
        ),
        TextField(
          style: new TextStyle(color: Colors.white),
          controller: Insurance_StatusController,
          enabled: false,

        ),
        TextField(
          style: new TextStyle(color: Colors.white),
          controller: Pharmacy_CoinsuranceController,
          enabled: false,

        ),
        TextField(
          style: new TextStyle(color: Colors.white),
          controller: Start_DateController,
          enabled: false,

        ),
        TextField(
          style: new TextStyle(color: Colors.white),
          controller: Expire_DateController,
          enabled: false,

        ),
        TextField(
          style: new TextStyle(color: Colors.white),
          controller: Insurance_ClassController,
          enabled: false,

        ),
        TextField(
          style: new TextStyle(color: Colors.white),
          controller: Policy_CodeController,
          enabled: false,
        ),
      ],
    );
    final email = Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(30)),
      child: new TextFormField(
        keyboardType: TextInputType.number,
        autofocus: false,
        controller: iDController,
        style: new TextStyle(color: Colors.white),
        decoration: InputDecoration(

          hintText: 'ID',
          hintStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );
    final loginButton = Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 25.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.green.shade400,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {

            if (iDController.text.isEmpty) {

              Fluttertoast.showToast(
                  msg: "All field required",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  bgcolor: "#e74c3c",
                  textcolor: '#ffffff');
            } else {
              setState(() {
                start = false;
                loading = true;
                allInfo = false;
                notfound =false;
              });
              var url =
                  "http://ngapis.azurewebsites.net/api/default/validatemember?memberid=" +
                      iDController.text.toString() +
                      "&payer=" +
                      "7"
                      ;
              http.get(url).then((response) {
                final verifyModel = json.decode(response.body);
                if (verifyModel.toString() == "[]") {
                  setState(() {
                    start = false;
                    loading = false;
                    allInfo = false;
                    notfound =true;
                  });
                  Fluttertoast.showToast(
                      msg: "not found",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      bgcolor: "#e74c3c",
                      textcolor: '#ffffff');
                } else {
                  final items = (verifyModel as List)
                      .map((i) => new VerifyModel.fromJson(i));
                  if (items.toList()[0].arabicName != null) {
                    setState(() {
                      start = false;
                      loading = false;
                      allInfo = true;
                      notfound =false;
                      nameController.text = "Name: "+ items.toList()[0].arabicName;
                      Insurance_StatusController.text ="Insurance status: "+
                          items.toList()[0].insuranceStatus;
                      Insurance_ClassController.text ="Insurance class: "+
                          items.toList()[0].insuranceClass;
                      Pharmacy_CoinsuranceController.text ="Pharmacy coinsurance: "+
                          items.toList()[0].pharmacyCoinsurance;
                      Start_DateController.text ="Start date: "+items.toList()[0].startDate;
                      Expire_DateController.text = "Expire date: "+items.toList()[0].expireDate;
                      Policy_CodeController.text ="Policy code: "+ items.toList()[0].policyCode;
                    });
                  }
                }
              });
            }
          },
          child: Text('Verify Member', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
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
                image: new AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 100),
              children: <Widget>[
                logo,
                new Center(
                    child: new Text(_startLocation != null
                        ? 'Start location: $_startLocation\n'
                        : 'Error: $error\n')),
                new Center(
                    child: new Text(_currentLocation != null
                        ? 'Continuous location: $_currentLocation\n'
                        : 'Error: $error\n')),
                email,
                SizedBox(height: 8.0),
                SizedBox(height: 24.0),
                loginButton,
                allInfo? memberState:Text(" "),
                notfound? Text("NotFound",style: TextStyle(color: Colors.white),):Text(" "),
                loading ? Text("Loading ....",style: TextStyle(color: Colors.white),):Text(" "),
                start ? Text("Please enter ID and Verify",style: TextStyle(color: Colors.white),):Text(" "),
              ],
            ),
          ),
        ));
  }
}
