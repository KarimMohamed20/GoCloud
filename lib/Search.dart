import "package:flutter/material.dart";
import 'package:gocloud/RequestApproval.dart';
import 'package:gocloud/main.dart';
import 'package:gocloud/memberApproval.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gocloud/ApiUrls.dart';
import 'package:gocloud/SearchLists.dart';
import 'package:gocloud/model/District.dart';
import 'package:gocloud/model/governorate.dart';
import 'package:gocloud/model/specialType.dart';
import 'package:gocloud/model/speciality.dart';
import 'package:shared_preferences/shared_preferences.dart';

//*******************************************************************

//   Abdelrhman Mohamed

//   Date  30/11/2018
// purpose  construct search filter to doctor list page

//*******************************************************************

class Search extends StatefulWidget {
  @override
  SearchPage createState() => SearchPage();
}

class SearchPage extends State<Search> {
  SharedPreferences sharedPreferences;
  deleteCredntial() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => GoCloudHome()));
  }

  final topBar = new AppBar(
    backgroundColor: Color.fromRGBO(25, 27, 76, 1),
    centerTitle: true,
    elevation: 1.0,
    title: SizedBox(
      height: 35.0,
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Icon(Icons.send),
      )
    ],
  );
  Drawer drawer(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the Drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Search'),
            leading: Icon(Icons.search),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Near me'),
            leading: Icon(Icons.near_me),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Favorite'),
            leading: Icon(Icons.favorite),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Latest news'),
            leading: Icon(Icons.new_releases),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Other services'),
            leading: Icon(Icons.build),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('My profile'),
            leading: Icon(Icons.account_box),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Sign Out'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              deleteCredntial();
            },
          ),
        ],
      ),
    );
  }

  String _mySelection;

  final String url = ApiURLs.GOVERNATEURL;
  final String SpecialTypeURL = ApiURLs.MEDICALSERVICEURL;
  //  4 parameters
  int government_id = 0;
  int district_id = 0;
  int service_id = 0;
  int speciality_id = 0;
  // first block
  List<governorate> _Governorate = new List<governorate>();
  List<governorate> _Governorate_data = new List<governorate>();
  List<dynamic> districtsData = new List<dynamic>();
  List<District> districtsOUT = new List<District>();
  List<District> DataOUT = new List<District>();
  int districtchanged;
  String selectedGovernorate;

//  second block
  List<specialType> _SpecialType = new List<specialType>();
  List<specialType> _SpecialType_data = new List<specialType>();
  List<dynamic> specialityData = new List<dynamic>();
  List<speciality> specialityOUT = new List<speciality>();
  List<speciality> specData = new List<speciality>();
  int specialTypechanged;
  int specialityChanged;

  Future<String> specialTypeData() async {
    http.post(SpecialTypeURL, body: {"payer": "7"}).then((response) {
      final json = JsonDecoder().convert(response.body);
      _SpecialType = (json)
          .map<specialType>((item) => specialType.fromJson(item))
          .toList();


      setState(() {
        _SpecialType_data = this._SpecialType;
      });
    });
    return "success";
  }

  Future<String> getSWData() async {
    http.post(url, body: {"payer": "7"}).then((response) {
//      var userMap = json.decode(response.body);
      final json = JsonDecoder().convert(response.body);
      _Governorate = (json)
          .map<governorate>((item) => governorate.fromJson(item))
          .toList();

      setState(() {
        _Governorate_data = this._Governorate;
      });
    });
    return "success";
  }

  @override
  void initState() {
  super.initState();
//    governorateChanged="";
    this.specialTypeData();
    this.getSWData();
  }

  int governorateChanged;

//*******************************************************************

//    Governorate && distrcts

  //*******************************************************************

  final GovernText = Container(
      margin: const EdgeInsets.all(9.0),
      child: Text(
        'Governorate',
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ));

  final DistrictsText = Container(
      margin: const EdgeInsets.all(9.0),
      child: Text(
        'Districts',
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ));

  //*******************************************************************

  //    Governorate

  //*******************************************************************

  //*******************************************************************

  //    Service Type && Specialty

  //*******************************************************************

  final ServiceTypeText = Container(
      margin: const EdgeInsets.all(9.0),
      child: Text(
        'Service Type',
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ));

  final SpecialtyText = Container(
      margin: const EdgeInsets.all(9.0),
      child: Text(
        'Specialty',
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ));

  //*******************************************************************

  //    District

  //*******************************************************************
  String yoo = "";
  @override
  Widget build(BuildContext context) {
    //*******************************************************************

    //    governeoment

    //*******************************************************************

    int err;
    final governeomentdrop = Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: new DropdownButton<int>(
            style: TextStyle(color: Colors.white, fontSize: 18.0),
            iconSize: 50.0,
            hint: Text('ALL',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0)),
            onChanged: (int chanValue) {
              districtsData =
                  _Governorate_data.firstWhere((b) => b.id == chanValue)
                      .districts;

//print(districtchanged);
              DataOUT = districtsOUT;
              districtsOUT.removeRange(0, districtsOUT.length);

              for (var i = 0; i < districtsData.length; i++) {
                DataOUT.add(new District(districtsData[i]['id'],
                    districtsData[i]['name_ar'], districtsData[i]['name_en']));
              }

              setState(() {
                districtchanged = chanValue;
                governorateChanged = null;
              });
            },
            value: districtchanged,
            items: _Governorate_data.map((governorate value2) {
              return new DropdownMenuItem<int>(
                  value: value2.id,
                  child: new Text(value2.name_ar,
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0)));
            }).toList()));

    //*******************************************************************

    //    Districts

    //*******************************************************************

    final Districtdrop = Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: new DropdownButton<int>(
          style: TextStyle(
              fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.green),
          iconSize: 50.0,
          hint: Text('ALL',
              style: TextStyle(color: Colors.green, fontSize: 17.0)),
          value: governorateChanged,
          onChanged: (int chaonValue) {
            print("*******************");
            print(chaonValue);
            setState(() {
              governorateChanged = chaonValue;
//              districtchanged = null;
            });
          },
          items: districtsOUT.map((District vall2) {
            return new DropdownMenuItem<int>(
                value: vall2.id,
                child: new Text(vall2.name_ar,
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0)));
          }).toList()),
    );

//*******************************************************************

    //    Special Types

    //*******************************************************************
    final SpecialTypes = Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: new DropdownButton<int>(
            style: TextStyle(color: Colors.green, fontSize: 17.0),
            elevation: 9,
            iconSize: 50.0,
            hint: Text('ALL',
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
            value: specialTypechanged,
            onChanged: (int chanValue) {
              print("***********DDDDDDDD***********");
              print(chanValue);

              specialTypechanged = chanValue;

              specialityData =
                  _SpecialType_data.firstWhere((b) => b.st_gccode == chanValue)
                      .speciality;

              specData = specialityOUT;
              specialityOUT.removeRange(0, specialityOUT.length);

              for (var i = 0; i < specialityData.length; i++) {
                specData.add(new speciality(
                    specialityData[i]['st_gccode'], specialityData[i]['name']));
              }
              print("jjjjjjjjjjjj");
              print(districtsOUT.length);

              setState(() {
                specialTypechanged = chanValue;
                specialityChanged = null;
              });
            },
            items: _SpecialType_data.map((specialType va2) {
              return new DropdownMenuItem<int>(
                  value: va2.st_gccode,
                  child: new Text(
                    va2.name,
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  ));
            }).toList()));

    //*******************************************************************

    //    Districts

    //*******************************************************************

    final Specialitydrop = Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: new DropdownButton<int>(
          style: TextStyle(
              fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.green),
          iconSize: 50.0,
          hint: Text('ALL',
              maxLines: 2,
              style: TextStyle(color: Colors.green, fontSize: 17.0)),
          value: specialityChanged,
          onChanged: (int chaonValue) {
            print("*******************");
            print(chaonValue);
            setState(() {
              specialityChanged = chaonValue;
//              districtchanged = null;
            });
          },
          items: specialityOUT.map((speciality vall2) {
            return new DropdownMenuItem<int>(
                value: vall2.st_gccode,
                child: new Text(vall2.name,
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0)));
          }).toList()),
    );

    return new Scaffold(
      appBar: topBar,
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 0.0),
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: AssetImage("assets/background_al.png"), fit: BoxFit.cover),
        ),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            GovernText,
            governeomentdrop,
            DistrictsText,
            Districtdrop,
            ServiceTypeText,
            SpecialTypes,
            SpecialtyText,
            Specialitydrop,
            Center(
              child: RaisedButton(
                colorBrightness: Brightness.light,
                child: Text('Search'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchLists(government_id,
                            district_id, service_id, speciality_id)),
                  );
                },
              ),
            )
          ],
        ),
      )),
      drawer: drawer(context),
      bottomNavigationBar: new Container(
        color: Colors.white,
        height: 50.0,
        alignment: Alignment.center,
        child: new BottomAppBar(
          child: new Row(
            // alignment: MainAxisAlignment.spaceAround,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {},
              ),
              new IconButton(
                icon: Icon(
                  Icons.near_me,
                ),
                onPressed: null,
              ),
              new IconButton(
                  icon: Icon(
                    Icons.star,
                  ),
                  onPressed: null),
              new IconButton(
                icon: Icon(Icons.do_not_disturb_on),
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MemberApproval())),
              ),
              new IconButton(
                icon: Icon(
                  Icons.info_outline,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Approval()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
