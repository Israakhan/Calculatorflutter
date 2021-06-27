import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";

  Widget btn(var textt) {
    return SizedBox(
      width: 100,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            result = result + textt;
          });
        },
        child: Text(textt),
      ),
    );
    /*style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
          padding: MaterialStateProperty.all(EdgeInsets.all(50)),
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
    );*/
  }

  clearr() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: btn("1"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: btn("2"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: btn("3"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: btn("4"),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: btn("5"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: btn("6"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: btn("7"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: btn("8"),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
                width: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: btn("9"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: btn("0"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: btn("+"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: btn("-"),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: btn("*"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: btn("/"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: clearr,
                        child: Text("clear"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: output,
                        child: Text("="),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
