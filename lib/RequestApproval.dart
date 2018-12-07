import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';



class Approval extends StatefulWidget {
  @override
  _ApprovalState createState() => new _ApprovalState();
}

class _ApprovalState extends State<Approval> {
  bool uploading = false;
  bool finish = false;
  String _path = '...';
  String _fileName = '...';
  FileType _pickingType;

  void _openFileExplorer() async {
    try {
      _path = await FilePicker.getFilePath(type: FileType.IMAGE);
    } on PlatformException catch (e) {
      print(e.toString());
    }

    if (!mounted) return;

    setState(() {
      _fileName = _path != null ? _path.split('/').last : '...';
    });
    print('Done');
  }

  String _value = '';
  List<String> _values = new List<String>();

  TextEditingController commentController = TextEditingController();
  int radioValue = 0;
  void handleRadioValueChanges(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _values.addAll(['Test1', 'Test2', 'Test3']);
    _value = _values.elementAt(0);
  }

  void _onChanged(String value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Request New Approval'),
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Color.fromRGBO(25, 27, 76, 1),
      ),
      body: SingleChildScrollView(
        child: new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background_al.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: new Column(
            children: <Widget>[
             
              // Approval Type
              
              Padding(
                padding: EdgeInsets.all(20),
              ),
              // Approval Type
              Container(
                child: new Text(
                  'Approval Type',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.start,
                ),
                margin: EdgeInsets.only(right: 240),
              ),
              new Padding(
                padding: EdgeInsets.all(10),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    ' Medical Services',
                    style: new TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  new Radio<int>(
                    value: 0,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanges,
                    activeColor: Colors.white,
                  ),
                  new Text(
                    ' Drugs',
                    style: new TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  new Radio<int>(
                    value: 1,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanges,
                    activeColor: Colors.white,
                  ),
                  new Text(
                    ' Operations',
                    style: new TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  new Radio<int>(
                    value: 2,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanges,
                    activeColor: Colors.white,
                  ),
                ],
              ),

              // Drop
              new Padding(
                padding: EdgeInsets.all(6),
              ),


              // Drop
//                new Padding(
//                  padding: EdgeInsets.all(15),
//                ),

              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20.0, top: 20.0),
                child: new Text(
                  "Providers",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white
                  ),
                  child: new DropdownButton(
                    isExpanded: true,
                    style: TextStyle(color: Colors.black),
                    value: _value,
                    items: _values.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: new Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: new Text(
                                '$value',
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (dynamic value) {
                      _onChanged(value);
                    },
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 15.0, top: 20.0,),
                    height: 200.0,
                    width: 290.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white),
                    child: new TextField(
                      textAlign: TextAlign.start,
                      controller: commentController,
                      decoration: InputDecoration(
                        hintText: 'Comment',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 6.0, top: 5.0),
                      ),
                    ),
                  ),
                  new CircleAvatar(
                    backgroundColor: Colors.greenAccent[700],
                    child: IconButton(
                      icon: new Icon(
                        Icons.link,
                        color: Colors.white,
                        size: 22,
                      ),
                      onPressed: () {
                        _openFileExplorer();
                      },
                    ),
                    radius: 25,
                  ),
                ],
              ),

              Builder(
                builder: (context) => Padding(
                      padding:
                          EdgeInsets.only(left: 16.0, right: 16.0, top: 25.0,bottom: 60.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.green.shade400,
                        elevation: 5.0,
                        child: MaterialButton(
                          minWidth: 200.0,
                          height: 42.0,
                          onPressed: () {
                            Upload(new File(_path));
                          },

                          child: Text('Send Request',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Upload(File imageFile) async {
    setState(() {
      finish = false;
      uploading = true;
    });
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();

    var uri = Uri.parse(
        "http://apicloudservices.azurewebsites.net/RequestApprovals/Post");

    var request = new http.MultipartRequest("post", uri);
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));

    Map<String, String> other = new HashMap();

    other['payer'] = '7';
    other['password'] = 'omega';
    other['employee_code'] = '200400082';
    other['Sa_Customer'] = '1011';
    other['sa_Vcode'] = '160000002';
    other['type'] = 'Public';
    other['Notes'] = 'Comment';

//    request.fields.addAll(other);
    request.files.add(multipartFile);
    print(request.toString());
    print(request.fields.toString());

    request.send().then((response) {
      if (response.statusCode == 200) {
        print("Uploaded!");
        response.stream.transform(utf8.decoder).listen((value) {
          print(value);
        });
        setState(() {
          finish = true;
          uploading = false;
        });
      }
    });
  }
}
