import 'package:flutter/material.dart';

// ToDo: Eingabe nur für numerische Werte erlauben !!!

class FahrenheitCelciusCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FahrenheitCelciusCalculator();
}

class _FahrenheitCelciusCalculator extends State<FahrenheitCelciusCalculator> {
  String _input;
  String _displayFahrenheitLong;
  String _displayCelciusLong;
  String _displayFahrenheitShort;
  String _displayCelciusShort;

  num _degreeInput;
  num _degreeFahrenheit;
  num _degreeCelcius;

  TextEditingController _controller;

  _FahrenheitCelciusCalculator() {
    debugPrint("c'tor _FahrenheitCelciusCalculator");
    _input = '';
    _displayFahrenheitLong = '';
    _displayCelciusLong = '';
    _displayFahrenheitShort = '';
    _displayCelciusShort = '';

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
                                      style: TextStyle(fontSize: 14.0))),
                              Padding(padding: EdgeInsets.all(10.0)),
                              Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(_displayCelciusLong,
                                      style: TextStyle(fontSize: 14.0)))
                            ])),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(_displayFahrenheitShort,
                                  style: TextStyle(fontSize: 20.0))),
                          Padding(padding: EdgeInsets.all(10.0)),
                          Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(_displayCelciusShort,
                                  style: TextStyle(fontSize: 20.0))),
                        ])),
                  ])
                ])));
  }

  void _increment() {
    debugPrint('... _increment');
  }

  void _decrement() {
    debugPrint('... _decrement');
  }

  void _onPressed() {
    debugPrint('... _onPressed');

    String input = _controller.text;

    setState(() {
      // ToDo: Verechnung von Fahrenheit und Celcius
      _degreeInput = int.parse(input);

      _displayFahrenheitLong = 'Boahh, I love $input  Fahrenheit';
      _displayCelciusLong = 'Boahh, I love $input Celcius';
      _displayFahrenheitShort = '$input  Fahrenheit';
      _displayCelciusShort = '$input Celcius';
    });
  }
}
