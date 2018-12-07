// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'dart:async';
// import 'package:device_calendar/device_calendar.dart';
// import 'package:intl/intl.dart';

// class PillReminder extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Pill reminder',
//       debugShowCheckedModeBanner: false,
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: new Pill(),
//     );
//   }
// }

// class Pill extends StatefulWidget {
// final Calendar _calendar;
//   final Event _event;
//   Pill(this._calendar,this._event);
//   @override
//   _PillState createState() => new _PillState(_calendar,_event);
// }

// class _PillState extends State<Pill> {
//   final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   final Calendar _calendar;
//   Event _event;
//   DeviceCalendarPlugin _deviceCalendarPlugin;
//   DateTime _startDate;
//   TimeOfDay _startTime;
//   DateTime _endDate;
//   TimeOfDay _endTime;
//   bool _autovalidate = false;

//   _PillState(this._calendar, this._event) {
//     _deviceCalendarPlugin = new DeviceCalendarPlugin();
//     if (this._event == null) {
//       _startDate = new DateTime.now();
//       _endDate = new DateTime.now().add(new Duration(hours: 1));
//       _event = new Event(this._calendar.id, start: _startDate, end: _endDate);
//     } else {
//       _startDate = _event.start;
//       _endDate = _event.end;
//     }

//     _startTime =
//         new TimeOfDay(hour: _startDate.hour, minute: _startDate.minute);
//     _endTime = new TimeOfDay(hour: _endDate.hour, minute: _endDate.minute);
//   }

//   final medicineId = TextEditingController();
//   final medicineTitle = TextEditingController();
//   final medicineDescription = TextEditingController();
//   final medicineStart = TextEditingController();
//   final medicineEnd = TextEditingController();

//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//   @override
//   void initState() {
//     super.initState();
//     //_retrieveCalendars();

//     flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//     var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
//     var iOS = new IOSInitializationSettings();
//     var initSetttings = new InitializationSettings(android, iOS);
//     flutterLocalNotificationsPlugin.initialize(initSetttings);
//   }

//   Future onSelectNotification(String payload) {
//     debugPrint("payload : $payload");
//     showDialog(
//       context: context,
//       builder: (_) => new AlertDialog(
//             title: new Text('Notification'),
//             content: new Text('$payload'),
//           ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final reminderId = Container(
//       decoration: BoxDecoration(
//           border: Border.all(color: Colors.white),
//           borderRadius: BorderRadius.circular(30)),
//       child: new TextFormField(
//         keyboardType: TextInputType.text,
//         autofocus: false,
//         controller: medicineId,
//         style: new TextStyle(color: Colors.white, fontSize: 20.0),
//         decoration: InputDecoration(
//           hintText: 'Medicine Id',
//           hintStyle: TextStyle(color: Colors.white),
//           contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//           border: OutlineInputBorder(
//               borderSide: BorderSide(width: 10, color: Colors.white),
//               borderRadius: BorderRadius.circular(10)),
//         ),
//       ),
//     );

//     final medicineName = Container(
//       decoration: BoxDecoration(
//           border: Border.all(color: Colors.white),
//           borderRadius: BorderRadius.circular(30)),
//       child: new TextFormField(
//         keyboardType: TextInputType.text,
//         autofocus: false,
//         controller: medicineTitle,
//         style: new TextStyle(color: Colors.white, fontSize: 20.0),
//         decoration: InputDecoration(
//           hintText: 'Medicine name',
//           hintStyle: TextStyle(color: Colors.white),
//           contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//           border: OutlineInputBorder(
//               borderSide: BorderSide(width: 10, color: Colors.white),
//               borderRadius: BorderRadius.circular(10)),
//         ),
//       ),
//     );
//     final medicineDescripe = Container(
//       decoration: BoxDecoration(
//           border: Border.all(color: Colors.white),
//           borderRadius: BorderRadius.circular(30)),
//       child: new TextFormField(
//         keyboardType: TextInputType.text,
//         autofocus: false,
//         controller: medicineDescription,
//         style: new TextStyle(color: Colors.white, fontSize: 20.0),
//         decoration: InputDecoration(
//           hintText: 'Description',
//           hintStyle: TextStyle(color: Colors.white),
//           contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//           border: OutlineInputBorder(
//               borderSide: BorderSide(width: 10, color: Colors.white),
//               borderRadius: BorderRadius.circular(10)),
//         ),
//       ),
//     );

//     final medicineDateStart = Container(
//       decoration: BoxDecoration(
//           border: Border.all(color: Colors.white),
//           borderRadius: BorderRadius.circular(30)),
//       child: new DateTimePickerFormField(
//           format: dateFormat,
//           decoration: InputDecoration(
//             hintText: 'Reminder Start Date',
//             hintStyle: TextStyle(color: Colors.white),
//             contentPadding: EdgeInsets.fromLTRB(25.0, 10.0, 20.0, 10.0),
//             border: OutlineInputBorder(
//                 borderSide: BorderSide(width: 10, color: Colors.white),
//                 borderRadius: BorderRadius.circular(30)),
//           ),
//           controller: medicineStart,
//           style: new TextStyle(color: Colors.white, fontSize: 20.0),
//           dateOnly: true,
//           onChanged: (dt) => setState(() => dateStart = dt)),
//     );

//     final reminderDateEnd = Container(
//       decoration: BoxDecoration(
//           border: Border.all(color: Colors.white),
//           borderRadius: BorderRadius.circular(30)),
//       child: new DateTimePickerFormField(
//           format: dateFormat,
//           decoration: InputDecoration(
//             hintText: 'Reminder End Date',
//             hintStyle: TextStyle(color: Colors.white),
//             contentPadding: EdgeInsets.fromLTRB(25.0, 10.0, 20.0, 10.0),
//             border: OutlineInputBorder(
//                 borderSide: BorderSide(width: 10, color: Colors.white),
//                 borderRadius: BorderRadius.circular(30)),
//           ),
//           controller: medicineEnd,
//           style: new TextStyle(color: Colors.white, fontSize: 20.0),
//           dateOnly: true,
//           onChanged: (dt) => setState(() => dateEnd = dt)),
//     );

//     final addReminder = Builder(
//       builder: (context) => Padding(
//             padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 25.0),
//             child: Material(
//               borderRadius: BorderRadius.circular(10.0),
//               color: Colors.green.shade400,
//               elevation: 5.0,
//               child: MaterialButton(
//                 minWidth: 200.0,
//                 height: 42.0,
//                 onPressed: () {
//                   sendEvent(medicineId.text, medicineTitle.text,
//                       medicineDescription.text, dateStart, dateEnd);
//                 },
//                 child: Center(
//                     child: new Text('Add Reminder',
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold))),
//               ),
//             ),
//           ),
//     );
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Pill reminder"),
//           backgroundColor: Colors.indigo[900],
//         ),
//         body: Center(
//             child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           padding: EdgeInsets.only(top: 30.0),
//           decoration: new BoxDecoration(
//             image: new DecorationImage(
//               image: new AssetImage("assets/background_al.png"),
//               fit: BoxFit.cover,
//             ),
//           ),

// child: ListView(
//   shrinkWrap: true,
//   padding: EdgeInsets.only(left: 24.0, right: 24.0),
//   children: <Widget>[
//     Container(
//       child: ListView(
//         shrinkWrap: true,
//         padding: EdgeInsets.only(left: 24.0, right: 24.0),
//         children: <Widget>[
//           SizedBox(height: 20.0),
//           reminderId,
//           SizedBox(height: 20.0),
//           medicineName,
//           SizedBox(height: 20.0),
//           medicineDescripe,
//           SizedBox(height: 20.0),
//           medicineDateStart,
//           SizedBox(height: 20.0),
//           reminderDateEnd,
//           SizedBox(height: 10.0),
//           addReminder
//         ],
//       ),
//     ),
//   ],
// ),
//       )));
// }

// showNotification() async {
//   print("dcjscg");
//   var time = new Time(1, 50, 0);

//   var android = new AndroidNotificationDetails(
//       'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
//       priority: Priority.High, importance: Importance.Max);
//   var iOS = new IOSNotificationDetails();
//   var platform = new NotificationDetails(android, iOS);
//   await flutterLocalNotificationsPlugin.showDailyAtTime(0, 'show daily title',
//       'Daily notification shown at approximately}', time, platform);
// }
//}
//   void _retrieveCalendars() async {
//     try {
//       var permissionsGranted = await _deviceCalendarPlugin.hasPermissions();
//       if (permissionsGranted.isSuccess && !permissionsGranted.data) {
//         permissionsGranted = await _deviceCalendarPlugin.requestPermissions();
//         if (!permissionsGranted.isSuccess || !permissionsGranted.data) {
//           return;
//         }
//       }

//       final calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
//       setState(() {
//         _calendars = calendarsResult?.data;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future _retrieveCalendarEvents(String calendarId) async {
//     try {
//       final startDate = new DateTime.now().add(new Duration(days: -30));
//       final endDate = new DateTime.now().add(new Duration(days: 30));
//       final retrieveEventsParams =
//       new RetrieveEventsParams(startDate: startDate, endDate: endDate);
//       final eventsResult = await _deviceCalendarPlugin.retrieveEvents(
//           calendarId, retrieveEventsParams);

//       setState(() {
//         _calendarEvents = eventsResult?.data;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
// }
// class EventItem extends StatelessWidget {
//   final Event _calendarEvent;
//   final DeviceCalendarPlugin _deviceCalendarPlugin;

//   final Function onDeleteSucceeded;

//   final double _eventFieldNameWidth = 75.0;

//   EventItem(
//       this._calendarEvent, this._deviceCalendarPlugin, this.onDeleteSucceeded);

//   @override
//   Widget build(BuildContext context) {
//     return new Card(
//       child: new Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           new ListTile(
//               title: new Text(_calendarEvent.title ?? ''),
//               subtitle: new Text(_calendarEvent.description ?? '')),
//           new Container(
//             padding: new EdgeInsets.symmetric(horizontal: 16.0),
//             child: new Column(
//               children: <Widget>[
//                 new Align(
//                   alignment: Alignment.topLeft,
//                   child: new Row(
//                     children: <Widget>[
//                       new Container(
//                         width: _eventFieldNameWidth,
//                         child: new Text('All day?'),
//                       ),
//                       new Text(
//                           _calendarEvent.allDay != null && _calendarEvent.allDay
//                               ? 'Yes'
//                               : 'No'),
//                     ],
//                   ),
//                 ),
//                 new SizedBox(
//                   height: 10.0,
//                 ),
//                 new Align(
//                   alignment: Alignment.topLeft,
//                   child: new Row(
//                     children: <Widget>[
//                       new Container(
//                         width: _eventFieldNameWidth,
//                         child: new Text('Location'),
//                       ),
//                       new Expanded(
//                         child: new Text(
//                           _calendarEvent?.location ?? '',
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 new SizedBox(
//                   height: 10.0,
//                 ),
//                 new Align(
//                   alignment: Alignment.topLeft,
//                   child: new Row(
//                     children: <Widget>[
//                       new Container(
//                         width: _eventFieldNameWidth,
//                         child: new Text('Attendees'),
//                       ),
//                       new Expanded(
//                         child: new Text(
//                           _calendarEvent?.attendees
//                               ?.where((a) => a.name?.isNotEmpty ?? false)
//                               ?.map((a) => a.name)
//                               ?.join(', ') ??
//                               '',
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           new ButtonTheme.bar(
//             child: new ButtonBar(
//               children: <Widget>[
//                 new IconButton(
//                   onPressed: () async {
//                     final deleteResult =
//                     await _deviceCalendarPlugin.deleteEvent(
//                         _calendarEvent.calendarId, _calendarEvent.eventId);
//                     if (deleteResult.isSuccess && deleteResult.data) {
//                       onDeleteSucceeded();
//                     }
//                   },
//                   icon: new Icon(Icons.delete),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:gocloud/datetime.dart';
import 'package:intl/intl.dart';

class CalendarEventPage extends StatefulWidget {
  final Calendar _calendar;
  final Event _event;

  CalendarEventPage(this._calendar, [this._event]);

  @override
  _CalendarEventPageState createState() {
    return new _CalendarEventPageState(_calendar, _event);
  }
}

class _CalendarEventPageState extends State<CalendarEventPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final Calendar _calendar;

  Event _event;
  DeviceCalendarPlugin _deviceCalendarPlugin;

  DateTime _startDate;
  TimeOfDay _startTime;

  DateTime _endDate;
  TimeOfDay _endTime;

  bool _autovalidate = false;

  _CalendarEventPageState(this._calendar, this._event) {
    _deviceCalendarPlugin = new DeviceCalendarPlugin();
    if (this._event == null) {
      _startDate = new DateTime.now();
      _endDate = new DateTime.now().add(new Duration(hours: 1));
      _event = new Event(this._calendar.id, start: _startDate, end: _endDate);
    } else {
      _startDate = _event.start;
      _endDate = _event.end;
    }

    _startTime =
        new TimeOfDay(hour: _startDate.hour, minute: _startDate.minute);
    _endTime = new TimeOfDay(hour: _endDate.hour, minute: _endDate.minute);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: new Text(
            _event.eventId?.isEmpty ?? true
                ? 'Create new event'
                : 'Edit event ${_event.title}',
          ),
          backgroundColor: Color.fromRGBO(25, 27, 76, 1),
        ),
        body: new SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background_al.png'),
                    fit: BoxFit.fill)),
            child: new Column(
              children: <Widget>[
                new Form(
                  autovalidate: _autovalidate,
                  key: _formKey,
                  child: new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Expanded(
                              flex: 1,
                              child: new Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: new TextFormField(
                                  initialValue: _event.title,
                                  decoration: const InputDecoration(
                                      counterStyle:
                                          TextStyle(color: Colors.white),
                                      labelText: 'Medicine Name',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      hintStyle: TextStyle(color: Colors.white),
                                      hintText: '...'),
                                  validator: _validateTitle,
                                  onSaved: (String value) {
                                    _event.title = value;
                                  },
                                ),
                              )),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      new Row(
                        children: <Widget>[
                          new Expanded(
                              flex: 1,
                              child: new Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: new TextFormField(
                                  initialValue: _event.description,
                                  decoration: const InputDecoration(
                                      labelText: 'number of times in day',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      hintStyle: TextStyle(color: Colors.white),
                                      hintText: '...'),
                                  onSaved: (String value) {
                                    _event.description = value;
                                  },
                                ),
                              )),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      Container(
                        color: Colors.white,
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                                flex: 1,
                                child: new Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: new DateTimePicker(
                                        labelText: 'From',
                                        selectedDate: _startDate,
                                        selectedTime: _startTime,
                                        selectDate: (DateTime date) {
                                          setState(() {
                                            _startDate = date;
                                            _event.start = _combineDateWithTime(
                                                _startDate, _startTime);
                                          });
                                        },
                                        selectTime: (TimeOfDay time) {
                                          setState(() {
                                            _startTime = time;
                                            _event.start = _combineDateWithTime(
                                                _startDate, _startTime);
                                          });
                                        })))
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                                flex: 1,
                                child: new Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: new DateTimePicker(
                                        labelText: 'To',
                                        selectedDate: _endDate,
                                        selectedTime: _endTime,
                                        selectDate: (DateTime date) {
                                          setState(() {
                                            _endDate = date;
                                            _event.end = _combineDateWithTime(
                                                _endDate, _endTime);
                                          });
                                        },
                                        selectTime: (TimeOfDay time) {
                                          setState(() {
                                            _endTime = time;
                                            _event.end = _combineDateWithTime(
                                                _endDate, _endTime);
                                          });
                                        })))
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          backgroundColor: Color.fromRGBO(25, 27, 76, 1),
          onPressed: () async {
            final FormState form = _formKey.currentState;
            if (!form.validate()) {
              _autovalidate = true; // Start validating on every change.
              showInSnackBar('Please fix the errors in red before submitting.');
            } else {
              form.save();
              var createEventResult =
                  await _deviceCalendarPlugin.createOrUpdateEvent(_event);
              if (createEventResult.isSuccess) {
                Navigator.pop(context, true);
              } else {
                showInSnackBar(createEventResult.errorMessages.join(' | '));
              }
            }
          },
          child: new Icon(
            Icons.check,
            color: Colors.white,
          ),
        ),
    );
  }

  String _validateTitle(String value) {
    if (value.isEmpty) {
      return 'Name is required.';
    }

    return null;
  }

  DateTime _combineDateWithTime(DateTime date, TimeOfDay time) {
    final dateWithoutTime =
        DateTime.parse(new DateFormat("y-MM-dd 00:00:00").format(_startDate));
    return dateWithoutTime
        .add(new Duration(hours: time.hour, minutes: time.minute));
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }
}
