import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'CALCULATOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _output = "0";
  String output = "0";
  double num1 = 38.0;
  double num2 = 48.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 38.0;
      num2 = 48.0;
      String operand = "";
    } else if (buttonText == "⌫") {
      _output = _output.substring(0, _output.length - 1);
      if (_output == "") {
        _output = "0";
      }
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "×" ||
        buttonText == "÷" ||
        buttonText == "%") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already contains a decimal");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "×") {
        _output = (num1 * num2).toString();
      }
      if (operand == "÷") {
        _output = (num1 / num2).toString();
      }
      if (operand == "%") {
        _output = (num1 % num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      if (_output == "0") {
        _output = buttonText;
      } else {
        _output = _output + buttonText;
      }
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new FlatButton(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: new Text(
            buttonText,
            style: TextStyle(
              fontSize: 24.6,
            ),
          ),
        ),
        onPressed: () {
          buttonPressed(buttonText);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Container(
            child: new Column(
          children: <Widget>[
            new Container(
              //solution
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 34.0, horizontal: 12.0),
                child: new Text(
                  _output,
                  style: new TextStyle(fontSize: 48.0),
                ),
              ),
            ),
            new Expanded(
              child: new Divider(),
            ),
            new Column(children: [
              new Row(children: [
                buildButton("C"),
                buildButton("%"),
                buildButton("⌫"),
                buildButton("÷"),
              ]),
              new Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("×"),
              ]),
              new Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("-"),
              ]),
              new Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("+"),
              ]),
              new Row(children: [
                buildButton("00"),
                buildButton("0"),
                buildButton("."),
                buildButton("="),
              ]),
            ])
          ],
        )));
  }
}
