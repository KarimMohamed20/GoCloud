import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gocloud/About.dart';
import 'package:gocloud/ContactUs.dart';
import 'package:gocloud/EmergencyNumbers.dart';
import 'package:gocloud/GuideLine.dart';
import 'package:gocloud/Language.dart';
import 'package:gocloud/Opnion.dart';
import 'package:gocloud/calendars.dart';
import 'main.dart';

class SampleAppPage extends StatefulWidget {

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
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
    return Scaffold(
        appBar: AppBar(
          title: Text(mainList[2]),
          backgroundColor: Color.fromRGBO(25, 27, 76, 1),
        ),
        body: Center(
            child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 30.0),
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/background_al.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 32.0),
              Container(
                decoration: new BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(30)),
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 24.0, right: 24.0),
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    Button(
                      mainList[8],
                      About(),
                      Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Button(
                      mainList[9],
                      ContactUs(),
                      Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Button(
                      mainList[10],
                      GuideLine(),
                      Icon(
                        Icons.chrome_reader_mode,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Button(
                      mainList[11],
                      EmergencyNumbers(),
                      Icon(
                        Icons.directions_car,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Button(
                      mainList[12],
                      CalendarsPage(),
                      Icon(
                        Icons.notifications_active,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Button(
                      mainList[13],
                      Opnion(),
                      Icon(
                        Icons.chat_bubble,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Button(
                      mainList[22],
                      Language(),
                      Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10.0,)
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}

class Button extends StatelessWidget {
  final String label;
  final Widget path;
  final Icon icon;
  Button(this.label, this.path, this.icon);
  @override
  Widget build(BuildContext context) {
    return
      new GestureDetector(
      onTap: (){
       Navigator.of(context).push(MaterialPageRoute(
         builder: (context)=>path
       ));
      },
       child:  Container(
         padding:  EdgeInsets.only(left: 20),
         height: 40,
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(50),
             color:Color.fromRGBO(143, 196, 90, 1) ,
            ),
         child: Row(
             mainAxisAlignment: MainAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
               icon,
               SizedBox(width: 10,),
               Text(
                 label,
                 style: TextStyle(color: Colors.white,fontSize: 18),
               ),
             ]
         ),
       ),
    ) ;
  }
}
