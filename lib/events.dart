import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  final Event _calendarEvent;
  final DeviceCalendarPlugin _deviceCalendarPlugin;

  final Function(Event) _onTapped;
  final VoidCallback _onLoadingStarted;
  final Function(bool) _onDeleteFinished;

  final double _eventFieldNameWidth = 75.0;

  EventItem(this._calendarEvent, this._deviceCalendarPlugin,
      this._onLoadingStarted, this._onDeleteFinished, this._onTapped);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        _onTapped(_calendarEvent);
      },
      child: new Card(
        color: Colors.transparent,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: new Image.asset('assets/logo.png',
              width: 45,
              height: 45,),
            ),
            new ListTile(
                title: new Text(_calendarEvent.title ?? '',
                    style: new TextStyle(color: Colors.white)),
                subtitle: new Text(_calendarEvent.description ?? '',
                    style: new TextStyle(color: Colors.white))),
            new Container(
              padding: new EdgeInsets.symmetric(horizontal: 16.0),
              child: new Column(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.topLeft,
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          width: _eventFieldNameWidth,
                          child: new Text('Starts',
                              style: new TextStyle(color: Colors.white)),
                        ),
                        new Text(
                            _calendarEvent == null
                                ? ''
                                : new DateFormat.yMd()
                                    .add_jm()
                                    .format(_calendarEvent.start),
                            style: new TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.symmetric(vertical: 5.0),
                  ),
                  new Align(
                    alignment: Alignment.topLeft,
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          width: _eventFieldNameWidth,
                          child: new Text('Ends',
                              style: new TextStyle(color: Colors.white)),
                        ),
                        new Text(
                            _calendarEvent.end == null
                                ? ''
                                : new DateFormat.yMd()
                                    .add_jm()
                                    .format(_calendarEvent.end),
                            style: new TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  new SizedBox(
                    height: 10.0,
                  ),
                  new Align(
                    alignment: Alignment.topLeft,
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          width: _eventFieldNameWidth,
                          child: new Text('All day?',
                              style: new TextStyle(color: Colors.white)),
                        ),
                        new Text(
                            _calendarEvent.allDay != null &&
                                    _calendarEvent.allDay
                                ? 'Yes'
                                : 'No',
                            style: new TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                  new SizedBox(
                    height: 10.0,
                  ),
                  new Align(
                    alignment: Alignment.topLeft,
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          width: _eventFieldNameWidth,
                          child: new Text('Location',
                              style: new TextStyle(color: Colors.white)),
                        ),
                        new Expanded(
                          child: new Text(_calendarEvent?.location ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                  new SizedBox(
                    height: 10.0,
                  ),
                  new Align(
                    alignment: Alignment.topLeft,
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          width: _eventFieldNameWidth,
                          child: new Text('Attendees',
                              style: new TextStyle(color: Colors.white)),
                        ),
                        new Expanded(
                          child: new Text(
                              _calendarEvent?.attendees
                                      ?.where(
                                          (a) => a.name?.isNotEmpty ?? false)
                                      ?.map((a) => a.name)
                                      ?.join(', ') ??
                                  '',
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new ButtonTheme.bar(
                child: new ButtonBar(
              children: <Widget>[
                new IconButton(
                  onPressed: () {
                    _onTapped(_calendarEvent);
                  },
                  icon: new Icon(Icons.edit,color: Colors.white,),
                ),
                new IconButton(
                  onPressed: () async {
                    await showDialog<Null>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return new AlertDialog(
                            title: new Text(
                                'Are you sure you want to delete this event?'),
                            actions: <Widget>[
                              new FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: new Text('Cancel'),
                              ),
                              new FlatButton(
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                  _onLoadingStarted();
                                  final deleteResult =
                                      await _deviceCalendarPlugin.deleteEvent(
                                          _calendarEvent.calendarId,
                                          _calendarEvent.eventId);
                                  _onDeleteFinished(deleteResult.isSuccess &&
                                      deleteResult.data);
                                },
                                child: new Text('Ok'),
                              ),
                            ],
                          );
                        });
                  },
                  icon: new Icon(Icons.delete,color: Colors.white,),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
