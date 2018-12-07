import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gocloud/ApiUrls.dart';
import 'package:gocloud/Search.dart';
import 'package:gocloud/User.dart';
import 'package:gocloud/main.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:gocloud/shPref.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'shPref.dart';



class Loginful extends StatefulWidget {
  @override
  _LoginfulState createState() => _LoginfulState();
}

class _LoginfulState extends State<Loginful> {
  var user;
  final dateFormat = DateFormat("EEEE, MMMM d, yyyy");
  DateTime date;
  Future<String> _tocken;
  final codeController = TextEditingController();
  final passController = TextEditingController();
  SharedPreferences sharedPreferences;

  @override
  void dispose() {
    codeController.dispose();
    passController.dispose();
    super.dispose();
  }

  _onChanged() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (codeController.text.isNotEmpty || passController.text.isNotEmpty) {
        sharedPreferences.setString("username", codeController.text);
        sharedPreferences.setString("password", passController.text);
        sharedPreferences.commit();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>Search()
        ));
      }
    });
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
    final email = Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(30)),
      child: new TextFormField(
        keyboardType: TextInputType.number,
        autofocus: false,
        controller: codeController,
        style: new TextStyle(color: Colors.white, fontSize: 20.0),
        decoration: InputDecoration(
          hintText: mainList[3],
          hintStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 10, color: Colors.white),
              borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );

    final password = Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(30)),
      child: new DateTimePickerFormField(
          format: dateFormat,
          decoration: InputDecoration(
            hintText: mainList[4],
            hintStyle: TextStyle(color: Colors.white),
            contentPadding: EdgeInsets.fromLTRB(25.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 10, color: Colors.white),
                borderRadius: BorderRadius.circular(30)),
          ),
          controller: passController,
          style: new TextStyle(color: Colors.white, fontSize: 20.0),
          dateOnly: true,
          onChanged: (dt) => setState(() => date = dt)),
    );
    final loginButton = Builder(
      builder: (context) => Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 25.0),
            child: Material(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.green.shade400,
              elevation: 5.0,
              child: MaterialButton(
                minWidth: 200.0,
                height: 42.0,
                onPressed: () {
                  if (codeController.text.isEmpty ||
                      passController.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: mainList[5],
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIos: 1,
                        bgcolor: "#e74c3c",
                        textcolor: '#ffffff');
                  } else {
                    String x = date.year.toString();
                    String x2 = date.month.toString();
                    String x3 = date.day.toString();
                    String datee = x + "-" + x2 + "-" + x3;
                    SharedPreferencesHelper.getAuthTocken().then((s) {
                      var url = ApiURLs.logInURL;
                      http.post(url, body: {
                        "id": codeController.text,
                        "birthdate": datee,
                        "platform": "android",
                        "token": s,
                        "payer": "7",
                      }).then((response) {
                        Map userMap = json.decode(response.body);
                        user = new User.fromJson(userMap);

                        print(response.body);
                        if (user.userID != null) {
                          _onChanged();
                        } else {
                          Fluttertoast.showToast(
                              msg: mainList[6],
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIos: 1,
                              bgcolor: "#e74c3c",
                              textcolor: '#ffffff');
                        }
                      });
                    });
                  }
                },
//          color: Colors.lightBlueAccent,

                child: Text(mainList[0].toString().substring(6), style: TextStyle(color: Colors.white)),
              ),
            ),
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
            padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 100.0),
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),
              email,
              SizedBox(height: 8.0),
              password,
              loginButton,
            ],
          ),
        ),
      ),
    );
  }
}
