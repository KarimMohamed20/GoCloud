import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:gocloud/model/vendors.dart';

class VendorDetails extends StatefulWidget {
  Vendors vendor;
  String assets;
  VendorDetails(String assets,Vendors vendor) {
    this.vendor=vendor;
    this.assets= assets;
  }
  @override
  _VendorDetailsState createState() => _VendorDetailsState( this.assets,this.vendor);
}
class _VendorDetailsState extends State<VendorDetails>

{
  final topBar = new AppBar(
    backgroundColor: Colors.indigo[700],
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
  Drawer drawer(BuildContext context){
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
            title: Text('LAtest news'),
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

  Vendors vendor;
  String assets;
  _VendorDetailsState( String assets,Vendors vendor) {
    this.vendor=vendor;
    this.assets= assets;
  }

  @override
  Widget build(BuildContext context) {
    final  name =this.vendor.ar_name==null?"":this.vendor.ar_name.toString();
    final  address =this.vendor.address==null?"":this.vendor.address.toString();
    final  phone1 =this.vendor.tel_1==null?"":this.vendor.tel_1.toString();
    final  phone2 =this.vendor.tel_2==null?"":this.vendor.tel_2.toString();
    final  working_hours =this.vendor.workingHours==null?"":this.vendor.workingHours.toString();
    final  website =this.vendor.website==null?"":this.vendor.website.toString();
    final  sp =this.vendor.spName==null?"":this.vendor.spName.toString();
    final  info =this.vendor.info==null?"":this.vendor.info.toString();
    return Scaffold(
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
            child:Center(
              child: Card(

                child: Column(

                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(
                        width: 90.0,
                        height: 80.0,

                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image:  AssetImage("$assets"), ))),
                    new Text( " $name " ,style: TextStyle(color: Colors.blue,fontWeight:ui.FontWeight.bold,fontSize: 18.0)),

                    new Text( " $sp " ,style: TextStyle(color: Colors.blueGrey,fontWeight:ui.FontWeight.bold,fontSize: 15.0),),
                    new Container(
                      margin:EdgeInsets.all(15.0) ,
                    ),
                    new Text( 'PERSONAL INFO',style:  TextStyle(fontSize: 20.0,color: Colors.amber),),
                    new Text( '$address',style:  TextStyle(fontSize: 14.0,color: Colors.black),textAlign: TextAlign.right,),

                    new Text( '$phone1   $phone2',style:  TextStyle(fontSize: 14.0,color: Colors.black),textAlign: TextAlign.right,),

                    new Text( '$working_hours ',style:  TextStyle(fontSize: 14.0,color: Colors.black),textAlign: TextAlign.right,),

                    new Text( '$website ',style:  TextStyle(fontSize: 14.0,color: Colors.black),textAlign: TextAlign.right,),
                    new Text( 'OTHER INFO ',style:  TextStyle(fontSize: 14.0,color: Colors.redAccent),textAlign: TextAlign.right,),
                    new Container(
                      margin:EdgeInsets.all(10.0) ,
                    ),
                    new Text( '$info ',style:  TextStyle(fontSize: 14.0,color: Colors.redAccent),textAlign: TextAlign.right,),


                    ButtonTheme.bar( // make buttons use the appropriate styles for cards
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('RATE'),
                            onPressed: () {
/* ... */
                            },
                          ),
                          FlatButton(
                            child: const Text('LOCATION'),
                            onPressed: () {
/* ... */
                            },
                          ),
                          FlatButton(
                            child: const Text('ADD FAVORITE'),
                            onPressed: () {
/* ... */
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
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
                onPressed: null,
              ),
              new IconButton(
                icon: Icon(
                  Icons.info_outline,
                ),
                onPressed: (){
                  Navigator.of(context).pushNamed("/RequestApproval");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}


