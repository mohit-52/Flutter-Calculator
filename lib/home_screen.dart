import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'components/my_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var output = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        output.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        MyButton(
                            title: "A/C",
                            onPressed: () {
                              userInput = '';
                              output = '';
                              setState(() {});
                            }),
                        MyButton(
                            title: "+/-",
                            onPressed: () {
                              userInput += '+/-';
                              setState(() {});
                            }),
                        MyButton(
                            title: "%",
                            onPressed: () {
                              userInput += '%';
                              setState(() {});
                            }),
                        MyButton(
                            title: "/",
                            bgColor: Color(0xffffa00a),
                            onPressed: () {
                              userInput += '/';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: "7",
                            onPressed: () {
                              userInput += '7';
                              setState(() {});
                            }),
                        MyButton(
                            title: "8",
                            onPressed: () {
                              userInput += '8';
                              setState(() {});
                            }),
                        MyButton(
                            title: "0",
                            onPressed: () {
                              userInput += '0';
                              setState(() {});
                            }),
                        MyButton(
                            title: "x",
                            bgColor: Color(0xffffa00a),
                            onPressed: () {
                              userInput += 'x';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: "4",
                            onPressed: () {
                              userInput += '4';
                              setState(() {});
                            }),
                        MyButton(
                            title: "5",
                            onPressed: () {
                              userInput += '5';
                              setState(() {});
                            }),
                        MyButton(
                            title: "6",
                            onPressed: () {
                              userInput += '6';
                              setState(() {});
                            }),
                        MyButton(
                            title: "-",
                            bgColor: Color(0xffffa00a),
                            onPressed: () {
                              userInput += '-';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: "1",
                            onPressed: () {
                              userInput += '1';
                              setState(() {});
                            }),
                        MyButton(
                            title: "2",
                            onPressed: () {
                              userInput += '2';
                              setState(() {});
                            }),
                        MyButton(
                            title: "3",
                            onPressed: () {
                              userInput += '3';
                              setState(() {});
                            }),
                        MyButton(
                            title: "+",
                            bgColor: Color(0xffffa00a),
                            onPressed: () {
                              userInput += '+';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: "0",
                            onPressed: () {
                              userInput += '0';
                              setState(() {});
                            }),
                        MyButton(
                            title: ".",
                            onPressed: () {
                              userInput += '.';
                              setState(() {});
                            }),
                        MyButton(
                            title: "DEL",
                            onPressed: () {
                              userInput = userInput.substring(0, userInput.length-1);
                              setState(() {});
                            }),
                        MyButton(
                            title: "=",
                            bgColor: Color(0xffffa00a),
                            onPressed: () {
                              onEqualPress();
                              setState(() {});
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onEqualPress(){
    
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    output = eval.toString();

  }
}
