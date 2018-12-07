import 'package:flutter/material.dart';
import 'package:gocloud/main.dart';
import 'package:url_launcher/url_launcher.dart';
class EmergencyNumbers extends StatefulWidget {
  @override
  _EmergencyNumbersState createState() => _EmergencyNumbersState();
}

class _EmergencyNumbersState extends State<EmergencyNumbers> {
  var numbers = [
    {"number": "122", "name": "شرطة النجدة"},
    {"number": "123", "name": "الأسعاف"},
    {"number": "180", "name": "المطافئ"},
    {"number": "121", "name": "اعطال الكهرباء"},
    {"number": "129", "name": "الغاز الطبيعي"},
    {"number": "126", "name": "شرطة السياحة"},
    {"number": "140", "name": "دليل التليفونات"},
    {"number": "144", "name": "دليل التليفونات الدولي"},
    {"number": "145", "name": "شرطة السكة الحديد"},
    {"number": "150", "name": "الساعة الناطقة"},
    {"number": "125", "name": "شكاوي المياه"},
    {"number": "3152802", "name": "الخط ساخن للايدز"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text(mainList[11]),
          backgroundColor: Color.fromRGBO(25, 27, 76, 1),
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background_al.png"),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: numbers.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Card(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: ListTile(
                        title: Align(
                            alignment: Alignment.center,
                            child: Text(
                              numbers[i]['name'],
                              style: TextStyle(fontSize: 20.0),
                            )),
                        subtitle: Align(
                            alignment: Alignment.center,
                            child: Text(numbers[i]['number'])),
                        leading: IconButton(
                          icon: Icon(
                            Icons.call,
                            color: Colors.green,
                            size: 40.0,
                          ),
                          onPressed: ()=> launch('tel:${numbers[i]['number']}'),
                        ),
                        contentPadding: EdgeInsets.all(5.0),
                      ),
                    );
                  }),
            )));
  }
}
