import 'dart:async';
import 'dart:convert';
import 'package:gocloud/ApiUrls.dart';
import 'package:gocloud/MapsPage.dart';
import 'package:gocloud/VendorDetails.dart';
import 'package:gocloud/model/vendor.dart';
import 'package:gocloud/model/vendors.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchLists extends StatefulWidget {
//  4 parameters
  int government_id;
  int district_id;
  int service_id;
  int speciality_id;

  //  4 parameters
  SearchLists(
      int government_id, int district_id, int service_id, int speciality_id) {
    this.government_id = government_id;
    this.district_id = district_id;
    this.service_id = service_id;
    this.speciality_id = speciality_id;
  }
  @override
  _VendorState createState() =>
      new _VendorState(government_id, district_id, service_id, speciality_id);
}

class _VendorState extends State<SearchLists> {
  List<dynamic> userMap;
  var Param = {"is_nbe": "1", "payer": "7"};

  String ParamMap;
  int government_id;
  int district_id;
  int service_id;
  int speciality_id;
  _VendorState(
      int government_id, int district_id, int service_id, int speciality_id) {
    this.government_id = government_id;
    this.district_id = district_id;
    this.service_id = service_id;
    this.speciality_id = speciality_id;
    ParamMap = ' "is_nbe": "1", "payer": "7" ';
    if (government_id != 0) {
      ParamMap = ParamMap + ' , "government_id":' + government_id.toString();
    }
    ParamMap = '{' + ParamMap + '}';
  }
//Map valueMap =ParamMap;
  TextEditingController controller = new TextEditingController();
  final String url = ApiURLs.GetSearch;
//  final notes11;
  Vendors vendors;
//  var d = new DATA();
//  DatabaseHelper data;
  List<Vendor> Paramvendors = new List<Vendor>();
  Future<Null> getUserDetails() async {
    String p =
        government_id != 0 ? '"' + government_id.toString() + '"' : '"0"';
    String p2 = district_id != 0 ? '"' + district_id.toString() + '"' : '"0"';
    String p3 = service_id != 0 ? '"' + service_id.toString() + '"' : '"0"';
    String p4 =
        speciality_id != 0 ? '"' + speciality_id.toString() + '"' : '"0"';
    final response = await http.post(url, body: {
      "is_nbe": "1",
      "payer": "7",
      "government_id": p,
      "district_id": p2,
      "service_id": p3,
      "speciality_id": p4
    });
    userMap = jsonDecode(response.body);
    print(userMap);
    setState(() {
      for (Map user in userMap) {
        _userDetails.add(Vendors.fromJson(user));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

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
            title: Text('Log out'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Vendors'),
        backgroundColor: Color.fromRGBO(25, 27, 76, 1.0),
        elevation: 0.0,
        
      ),
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: AssetImage("assets/background_al.png"), fit: BoxFit.cover),
        ),
        child: _searchResult.length != 0 || controller.text.isNotEmpty
            ? new ListView.builder(
                itemCount: _searchResult.length,
                itemBuilder: (context, i) {
                  return new Card(
                    child: new ListTile(
//                    leading: new CircleAvatar(backgroundImage: new NetworkImage(_searchResult[i].service_name,),),
                      title: new Text(_searchResult[i].spName),
                    ),
                    margin: const EdgeInsets.all(0.0),
                  );
                },
              )
            : new ListView.builder(
                itemCount: _userDetails == null ? 0 : _userDetails.length,
                itemBuilder: (context, index) {
                  String assets = "assets/facility.png";
                  if (_userDetails[index]
                      .service_name
                      .toString()
                      .contains("معامل")) {
                    assets = "assets/Lab.png";
                  }
                  if (_userDetails[index].id.toString().contains("Dr")) {
                    assets = "assets/doctor.png";
                  }
                  return new Card(
                    child: new ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VendorDetails(
                                    "$assets", _userDetails[index])),
                          );
                        },
                        trailing: new IconButton(
                          icon: Icon(Icons.map,color: Color.fromRGBO(25, 27, 76, 1),),
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=> MapsPage(
                              lat: userMap[index]['lat'],
                              lng: userMap[index]['longt'],
                              hospitalName: userMap[index]['name'],
                              sectionName: userMap[index]['specialty_name'],
                              )
                          ));
                        },
                        ),
                        leading: new Container(
                            width: 70.0,
                            height: 60.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("$assets")))),

//                    leading: new CircleAvatar(backgroundImage: new NetworkImage(_userDetails[index].service_name,),),
                        title: new Text(_userDetails[index].ar_name == null
                            ? " "
                            : _userDetails[index].ar_name),
                        subtitle: new Text(_userDetails[index].spName == null
                            ? " "
                            : _userDetails[index].spName)),
                    margin: const EdgeInsets.all(8.0),
                    color: null,
                  );
                },
              ),
      ),
    );
  }

//  onSearchTextChanged(String text) async {
//    _searchResult.clear();
//    if (text.isEmpty) {
//      setState(() {});
//      return;
//    }
//
//    _userDetails.forEach((userDetail) {
//      if (userDetail.firstName.contains(text) || userDetail.lastName.contains(text))
//        _searchResult.add(userDetail);
//    });
//
//    setState(() {});
//  }
}

List<Vendors> _searchResult = [];

List<Vendors> _userDetails = [];
