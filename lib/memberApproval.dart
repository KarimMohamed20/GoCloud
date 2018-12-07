import 'package:flutter/material.dart';
import 'package:gocloud/main.dart';

class MemberApproval extends StatefulWidget {
  @override
  _MemberApprovalState createState() => _MemberApprovalState();
}

class _MemberApprovalState extends State<MemberApproval> {
  //--- Padding using in Text in Border ----//
  double _paddingItem = 12.0;

  double heightBoxDetails = 150.0;
  final Set<int> _saved = new Set<int>();

//--- Radius Using in All Shape ----//
  static const _radiusItem = 60.0;

  //--- Color using for Icon and Code Text ----//
  var color1 = Color(0xFF92c45f);

  //--- Test Model Only Deleted when you code ----//
  List<String> testname = ["Test1", "Test2", "Test3", "Test4", "Test5"];
  List<String> testcode = ["#11213", "#14412", "#42531", "#14134", "#87972"];
  List<String> testnote = [
    "يصرف له",
    "يصرف له",
    "يصرف له",
    "يصرف له",
    "يصرف له"
  ];
  List<String> testdate = [
    "22-10-2018",
    "22-9-2018",
    "22-8-2018",
    "22-7-2018",
    "22-1-2018"
  ];
  //--- AppBar Declaration  ----//
  final appBar = new AppBar(
      backgroundColor: Color.fromRGBO(25, 27, 76, 1),
      centerTitle: true,
      elevation: 1.0,
      title: Text(mainList[23]));

  @override
  Widget build(BuildContext context) {
    double _fullWidth = MediaQuery.of(context).size.width;
    double _fullHeight = MediaQuery.of(context).size.height;
    return new Scaffold(
        appBar: appBar,
        //----------- Container To BackGround -----------//
        body: Container(
          width: _fullWidth,
          height: MediaQuery.of(context).size.height,
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: AssetImage("assets/background_al.png"),
                fit: BoxFit.cover),
          ),
          //----------- Container To Border and Item -----------//
          child: Container(
              width: _fullWidth,
              height: _fullHeight,
              padding: EdgeInsets.all(_paddingItem),
              margin: EdgeInsets.all(20.0),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(70.0),
                border:
                    new Border.all(color: new Color(0xFF9E9E9E), width: 2.0),
              ),
              //----------- ListView Builder To Show ItemList -----------//
              child: ListView.builder(
                  padding: EdgeInsets.all(_paddingItem),
                  itemCount: testcode.length,
                  itemBuilder: (BuildContext context, int position) {
                    bool alredy = _saved.contains(position);

                    return Padding(
                        padding: EdgeInsets.only(bottom: 12.0),
                        child: Stack(
                          overflow: Overflow.clip,
                          children: <Widget>[
                            WidgetShowDetails(
                              height: alredy ? heightBoxDetails : 0.0,
                              width: _fullWidth,
                              color: Color(0xFF1c1c50),
                              note: "${testnote[position]}",
                              approvaldate: "${testdate[position]}",
                            ),
                            Container(
                              width: _fullWidth,
                              height: 85.0,
                              decoration: new BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(_radiusItem),
                                border: new Border.all(
                                    color: Colors.white, width: 1.0),
                              ),
                              child: Row(
                                children: <Widget>[
                                  //----------- Icons Item -----------//
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: _fullHeight,
                                        width: _fullWidth,
                                        child: Center(
                                          child: Image.asset(
                                            "assets/card_holder.png",
                                            width: 45.0,
                                            height: 45.0,
                                          ),
                                        ),
                                        decoration: new BoxDecoration(
                                          color: color1,
                                          borderRadius: new BorderRadius.only(
                                            topLeft: const Radius.circular(
                                                _radiusItem),
                                            bottomLeft: const Radius.circular(
                                                _radiusItem),
                                          ),
                                        ),
                                      )),
                                  //----------- Text V_Name Items -----------//
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: _fullWidth,
                                                padding: EdgeInsets.all(10.0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                      "V_Name:${testname[position]}"),
                                                ),
                                                decoration: new BoxDecoration(
                                                    color: alredy
                                                        ? color1
                                                        : Colors.white,
                                                    borderRadius:
                                                        new BorderRadius.only(
                                                            topRight: const Radius
                                                                    .circular(
                                                                _radiusItem))),
                                              )),
                                          //----------- Text Code Item and View -----------//
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: _fullWidth,
                                              padding: EdgeInsets.all(10.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                        "Code:${testcode[position]}"),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 10.0),
                                                        child: InkWell(
                                                            child: Icon(
                                                              Icons
                                                                  .remove_red_eye,
                                                              color: alredy
                                                                  ? color1
                                                                  : Colors
                                                                      .white,
                                                            ),
                                                            onTap: () {
                                                              showDetails(
                                                                  position);
                                                              if (alredy) {
                                                                _saved.remove(
                                                                    position);
                                                              } else {
                                                                _saved.add(
                                                                    position);
                                                              }
                                                            })),
                                                  ],
                                                ),
                                              ),
                                              decoration: new BoxDecoration(
                                                  color: alredy
                                                      ? Colors.white
                                                      : color1,
                                                  borderRadius: new BorderRadius
                                                          .only(
                                                      bottomRight:
                                                          const Radius.circular(
                                                              _radiusItem))),
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            )
                          ],
                        ));
                  })),
        ));
  }

  showDetails(position) {
    setState(() {
      print("Show ($position)");
    });
  }
}

class WidgetShowDetails extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final TextStyle _style = TextStyle(
      color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w400);
  final String note;
  final String approvaldate;
  final EdgeInsets _paddingItem = EdgeInsets.only(left: 20.0, top: 5.0);
  WidgetShowDetails(
      {Key key,
      this.width = 0.0,
      this.height = 0.0,
      this.color,
      this.note = "",
      this.approvaldate = ""})
      : assert(width != null),
        assert(height != null),
        assert(note != null),
        assert(approvaldate != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 45.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.only(
              bottomRight: const Radius.circular(60.0),
              bottomLeft: const Radius.circular(60.0)),
        ),
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 60.0)),
            Padding(
                padding: _paddingItem,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Note : $note",
                    style: _style,
                  ),
                )),
            Padding(
                padding: _paddingItem,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Approval validity date : $approvaldate",
                    style: _style,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
