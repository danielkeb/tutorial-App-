import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == 'Clear') {
      output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/') {
      num1 = double.parse(output);
      operand = buttonText;
      output = "";
    } else if (buttonText == ".") {
      if (output.contains(".")) {
        return;
      } else {
        output = output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        output = (num1 + num2).toString();
      }
      if (operand == "-") {
        output = (num1 - num2).toString();
      }
      if (operand == "*") {
        output = (num1 * num2).toString();
      }
      if (operand == "/") {
        output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      output = output + buttonText;
    }
    setState(() {});
  }

  Widget buildButton(String buttonText) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              alignment: Alignment.bottomRight,
              child: Text(
                output,
                style: const TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          Row(
            children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("/")
            ],
          ),
          Row(
            children: [
              buildButton("6"),
              buildButton("5"),
              buildButton("4"),
              buildButton("*")
            ],
          ),
          Row(
            children: [
              buildButton("3"),
              buildButton("2"),
              buildButton("1"),
              buildButton("-")
            ],
          ),
          Row(
            children: [
              buildButton("."),
              buildButton("0"),
              buildButton("Clear"),
              buildButton("+"),
            ],
          ),
          Row(
            children: [
              buildButton("="),
            ],
          ),
        ],
      ),
    );
  }
}
