import 'package:calculator/widgets/btn.dart';
import 'package:calculator/widgets/eql_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String values, result;
  Color background = Color(0xFFF5F7F9);
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark));
    values = "0";
    result = "";
    super.initState();
  }

  void setVal(String val) {
    setState(() {
      if (values == "0")
        values = val;
      else
        values += val;
    });
  }

  void clear() {
    setState(() {
      values = "0";
      result = "";
    });
  }

  void delete() {
    setState(() {
      values = (values.length > 1 && values != "0")
          ? values.substring(0, values.length - 1)
          : "0";
    });
  }

  void calculate() {
    try {
      Parser parser = new Parser();
      ContextModel cm = new ContextModel();
      Expression exp = parser.parse(values);
      setState(() {
        result = exp.evaluate(EvaluationType.REAL, cm).toString();
      });
    } catch (e) {
      setState(() {
        result = "Syntax Error !";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              ' Calculator',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 45,
              width: 45,
              margin: EdgeInsets.only(right: 15),
              child: Image(
                image: AssetImage('images/logo.png'),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10,right : 10,top: values.length >= 34 ? 0 : 90),
              child: Text(
                values,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Ans : ",
                        textAlign: TextAlign.right,
                        style:
                            TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                    Text(
                        result.length > 15
                            ? result.substring(0, 15) +
                                "\n" +
                                result.substring(15, result.length)
                            : result,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                )),
            SizedBox(height: 10.0),
            Divider(
              color: Colors.redAccent,
            ),
            SizedBox(height: 20.0),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
                Widget>[
              Btn(text: 'AC', background: Colors.lightBlue[400], onPress: clear),
              Btn(
                  icon: Icon(
                    Icons.backspace,
                    color: Colors.white,
                    size: 30,
                  ),
                  background: Colors.redAccent,
                  onPress: delete),
              Btn(text: '%', background: background, onPress: () => setVal("%")),
              Btn(text: '/', background: background, onPress: () => setVal("/")),
            ]),
            SizedBox(height: 5),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Btn(
                    text: '7',
                    onPress: () => setVal("7"),
                    background: background,
                  ),
                  Btn(
                    text: '8',
                    onPress: () => setVal("8"),
                    background: background,
                  ),
                  Btn(
                    text: '9',
                    onPress: () => setVal("9"),
                    background: background,
                  ),
                  Btn(
                      text: 'x',
                      background: background,
                      onPress: () => setVal("*")),
                ]),
            SizedBox(height: 5.0),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Btn(
                    text: '4',
                    onPress: () => setVal("4"),
                    background: background,
                  ),
                  Btn(
                    text: '5',
                    onPress: () => setVal("5"),
                    background: background,
                  ),
                  Btn(
                    text: '6',
                    onPress: () => setVal("6"),
                    background: background,
                  ),
                  Btn(
                      text: '-',
                      background: background,
                      onPress: () => setVal("-")),
                ]),
            SizedBox(height: 5.0),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Btn(
                    text: '1',
                    onPress: () => setVal("1"),
                    background: background,
                  ),
                  Btn(
                    text: '2',
                    onPress: () => setVal("2"),
                    background: background,
                  ),
                  Btn(
                    text: '3',
                    onPress: () => setVal("3"),
                    background: background,
                  ),
                  Btn(
                      text: '+',
                      background: background,
                      onPress: () => setVal("+")),
                ]),
            SizedBox(height: 5.0),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Btn(
                    text: '0',
                    onPress: () => setVal("0"),
                    background: background,
                  ),
                  Btn(
                    text: '.',
                    onPress: () => setVal("."),
                    background: background,
                  ),
                  EqlBtn(onPress: calculate)
                ]),
            SizedBox(height: 20.0),
          ],
        ),
        ],
      ),
    );
  }
}
