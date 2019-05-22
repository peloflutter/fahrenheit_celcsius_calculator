import 'package:flutter/material.dart';

// ToDo: Eingabe nur für numerische Werte erlauben !!!

// ToDo: Double-Werte nur auf 2 Stellen nach dem Komma anzeigen !!!

// ToDo: Wechesel zwischen Landscape- und Portrait-Modus crashed !!!

class FahrenheitCelciusCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FahrenheitCelciusCalculator();
}

class _FahrenheitCelciusCalculator extends State<FahrenheitCelciusCalculator> {
  // String _input;
  String _displayFahrenheitLong;
  String _displayCelciusLong;
  String _displayFahrenheitShort;
  String _displayCelciusShort;

  num _degreeInput;
  num _degreeFahrenheit;
  num _degreeCelcius;

  RegExp _exp;

  TextEditingController _controller;

  _FahrenheitCelciusCalculator() {
    debugPrint("c'tor _FahrenheitCelciusCalculator");
    // _input = '';
    _displayFahrenheitLong = '';
    _displayCelciusLong = '';
    _displayFahrenheitShort = '';
    _displayCelciusShort = '';

    // just for testing
    _degreeInput = 0.0;
    _degreeFahrenheit = 13.5;
    _degreeCelcius = 44.65;

    String pattern = r'^[0-9]*$';
    _exp = RegExp(pattern);

    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Row row = Row(children: <Widget>[
      Expanded(
          child: TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(hintText: 'Value'),
              controller: _controller
              // onChanged: (s) {},
              )),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        SizedBox(
            height: 24.0,
            width: 24.0,
            child: new IconButton(
              padding: new EdgeInsets.all(0.0),
              // color: ThemeData.p,
              icon: new Icon(Icons.arrow_drop_up, size: 24.0),
              onPressed: _increment,
            )),
        SizedBox(
            height: 24.0,
            width: 24.0,
            child: new IconButton(
              padding: new EdgeInsets.all(0.0),
              // color: ThemeData.p,
              icon: new Icon(Icons.arrow_drop_down, size: 24.0),
              onPressed: _decrement,
            ))
      ]),
    ]);

    return Scaffold(
        appBar: new AppBar(
          title: new Text('Fahrenheit Celcius Calculator'),
        ),
        body: Container(
            margin: EdgeInsets.all(10.0),
            // child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text('Eingabe Grad:',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 20.0))),
                  row,
                  Padding(padding: EdgeInsets.all(10.0)),
                  RaisedButton(
                    onPressed: _onPressed,
                    child: Text('Calculate'),
                  ),
                  Padding(padding: EdgeInsets.all(2.0)),
                  RaisedButton(
                    onPressed: _onReset,
                    child: Text('Reset'),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Row(children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(5.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(_displayFahrenheitLong,
                                      style: TextStyle(fontSize: 16.0))),
                              Padding(padding: EdgeInsets.all(10.0)),
                              Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(_displayCelciusLong,
                                      style: TextStyle(fontSize: 16.0)))
                            ])),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(_displayFahrenheitShort,
                                  style: TextStyle(fontSize: 16.0))),
                          Padding(padding: EdgeInsets.all(10.0)),
                          Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(_displayCelciusShort,
                                  style: TextStyle(fontSize: 16.0))),
                        ])),
                  ])
                ])));
  }

  void _increment() {
    debugPrint('... _increment');
    _degreeInput++;
  }

  void _decrement() {
    debugPrint('... _decrement');
    _degreeInput--;
  }

  void _onPressed() {
    debugPrint('... _onPressed');

    String input = _controller.text;

    if (input == '') {
      _doCalculation(20.0);
    } else if (!_exp.hasMatch(input)) {
      _showDialog();
      _doReset();
    } else {
      _doCalculation(double.parse(input));
    }
  }

  void _onReset() {
    debugPrint('... _onReset');
    _doReset();
  }

  // helper methods
  void _doReset() {
    _controller.text = '';

    setState(() {
      _degreeInput = 0.0;

      _displayFahrenheitLong = '';
      _displayCelciusLong = '';
      _displayFahrenheitShort = '';
      _displayCelciusShort = '';
    });
  }

  void _doCalculation(num value) {
    _degreeInput = value;
    _degreeFahrenheit = _fahrenheitToCelcius(_degreeInput);
    _degreeCelcius = _celciusToFahrenheit(_degreeInput);

    setState(() {
      _displayFahrenheitLong = '$_degreeInput °F in Celcius:';
      _displayCelciusLong = '$_degreeInput °F in Fahrenheit:';
      _displayFahrenheitShort = '$_degreeFahrenheit °F';
      _displayCelciusShort = '$_degreeCelcius °C';
    });
  }

  // conversion Fahrenheit => Celcius and vice versa
  num _fahrenheitToCelcius(num fahrenheit) => (fahrenheit - 32) * 5 / 9;
  num _celciusToFahrenheit(num celcius) => celcius * 9 / 5 + 32;

  // dialog helper method
  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: new Text("Wrong Input"),
              content: new Text("Please enter a valid integer!"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ]);
        });
  }
}
