import 'package:flutter/material.dart';
import 'package:gocloud/main.dart';

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  bool _value = false;
  void _onChanged(bool value) {
    setState(() {
      _value = value;
      if(value == true){
        mainList = arabicList;
      }
      if(value == false) {
        mainList = englishList; 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width;
      MediaQuery.of(context).size.height;
    return Scaffold(
      
      appBar: AppBar(
        title: Text(mainList[22]),
        backgroundColor: Color.fromRGBO(25, 27, 76, 1),
      ),
      body: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/background_al.png'),fit: BoxFit.fill)),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Image.asset(
              'assets/logo.png',
              width: 150,
              height: 150,
            ),
            new Switch(
              activeColor: Color.fromRGBO(25, 27, 76, 1),
              value: _value,
              onChanged: (bool value){_onChanged(value);},
            ),
            new Container(
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}
