import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gocloud/AboutModel.dart';
import 'package:gocloud/ApiUrls.dart';
import 'package:gocloud/main.dart';
import 'package:http/http.dart' as http;

class About extends StatelessWidget {
  final Future<AboutModel> about;

   About({Key key, this.about}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(mainList[8]),
          backgroundColor: Color.fromRGBO(25, 27, 76, 1),
        ),
        body: Center(
          child: FutureBuilder<AboutModel>(
            future: about,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
                    child: Material(
                        borderRadius: BorderRadius.circular(30.0),
                        shadowColor: Colors.lightBlueAccent.shade100,
                        elevation: 5.0,
                        child:  Text(snapshot.data.infoAR),
                    ));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return CircularProgressIndicator();
            },
          ),
        ),
    );
  }
}
Future<AboutModel> fetchAbout() async {
  var url = ApiURLs.About;
  final response =  await http.post(url,
      body: {
        "code": "1",
        "payer":"7",
      });

  if (response.statusCode == 200) {
    print(response.statusCode);
    // If the call to the server was successful, parse the JSON
    return AboutModel.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load data');
  }
}
