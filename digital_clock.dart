// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Morse code clock

import 'dart:async';

import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

enum _Element {
  background,
  text,
  shape,
}

final _lightTheme = {
  _Element.background: Colors.grey[50],
  _Element.text: Colors.black87,
  _Element.shape: Colors.black87,
};

final _darkTheme = {
  _Element.background: Colors.black87,
  _Element.text: Colors.grey[50],
  _Element.shape: Colors.grey[50],
};

class DigitalClock extends StatefulWidget {
  const DigitalClock(this.model);

  final ClockModel model;

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(DigitalClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      // Update once per minute. If you want to update every second, use the
      // following code.
      _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
      // Update once per second, but make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      // _timer = Timer(
      //   Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
      //   _updateTime,
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).brightness == Brightness.light
        ? _lightTheme
        : _darkTheme;
    final hour1 = (_dateTime.hour ~/ 10);
    final hour2 = (_dateTime.hour % 10);
    final minute1 = (_dateTime.minute ~/ 10);
    final minute2 = (_dateTime.minute % 10);
    final fontSize = MediaQuery.of(context).size.width / 25;
    final defaultStyle = TextStyle(
      color: colors[_Element.text],
      fontFamily: 'PT Mono',
      fontSize: fontSize,
    );

    return Container(
      color: colors[_Element.background],
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 20,
          horizontal: MediaQuery.of(context).size.width / 40),
      child: Center(
        child: DefaultTextStyle(
          style: defaultStyle,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ClockRow(number: hour1),
              ClockRow(number: hour2),
              ClockRow(number: minute1),
              ClockRow(number: minute2)
            ],
          ),
        ),
      ),
    );
  }
}

class ClockRow extends StatelessWidget {
  final int number;
  const ClockRow({Key key, this.number}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (this.number == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 48,
              //color: Colors.blue,
              child: Text(number.toString(), textAlign: TextAlign.center)),
          Dot(),
          Dash(),
          Dash(),
          Dash(),
          Dash(),
        ],
      );
    } else if (this.number == 2) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 48,
              child: Text(number.toString(), textAlign: TextAlign.center)),
          Dot(),
          Dot(),
          Dash(),
          Dash(),
          Dash(),
        ],
      );
    } else if (this.number == 3) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 48,
              child: Text(number.toString(), textAlign: TextAlign.center)),
          Dot(),
          Dot(),
          Dot(),
          Dash(),
          Dash(),
        ],
      );
    } else if (this.number == 4) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 48,
              child: Text(number.toString(), textAlign: TextAlign.center)),
          Dot(),
          Dot(),
          Dot(),
          Dot(),
          Dash(),
        ],
      );
    } else if (this.number == 5) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 48,
              child: Text(number.toString(), textAlign: TextAlign.center)),
          Dot(),
          Dot(),
          Dot(),
          Dot(),
          Dot(),
        ],
      );
    } else if (this.number == 6) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 48,
              child: Text(number.toString(), textAlign: TextAlign.center)),
          Dash(),
          Dot(),
          Dot(),
          Dot(),
          Dot(),
        ],
      );
    } else if (this.number == 7) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 48,
              child: Text(number.toString(), textAlign: TextAlign.center)),
          Dash(),
          Dash(),
          Dot(),
          Dot(),
          Dot(),
        ],
      );
    } else if (this.number == 8) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 48,
              child: Text(number.toString(), textAlign: TextAlign.center)),
          Dash(),
          Dash(),
          Dash(),
          Dot(),
          Dot(),
        ],
      );
    } else if (this.number == 9) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 48,
              child: Text(number.toString(), textAlign: TextAlign.center)),
          Dash(),
          Dash(),
          Dash(),
          Dash(),
          Dot(),
        ],
      );
    } else if (this.number == 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 48,
              child: Text(number.toString(), textAlign: TextAlign.center)),
          Dash(),
          Dash(),
          Dash(),
          Dash(),
          Dash(),
        ],
      );
    }
  }
}

class Dash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).brightness == Brightness.light
        ? _lightTheme
        : _darkTheme;
    return Container(
      width: MediaQuery.of(context).size.width / 30 * 3,
      height: MediaQuery.of(context).size.width / 30,
      decoration: BoxDecoration(
          color: colors[_Element.shape], shape: BoxShape.rectangle),
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 60,
          horizontal: MediaQuery.of(context).size.width / 60),
    );
  }
}

class Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).brightness == Brightness.light
        ? _lightTheme
        : _darkTheme;
    return Container(
      width: MediaQuery.of(context).size.width / 30,
      height: MediaQuery.of(context).size.width / 30,
      decoration:
          BoxDecoration(color: colors[_Element.shape], shape: BoxShape.circle),
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 60,
          horizontal: MediaQuery.of(context).size.width / 60),
    );
  }
}
