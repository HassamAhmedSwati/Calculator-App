import 'package:calculator/components/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.secondaryLabel,
      appBar: AppBar(
        backgroundColor: CupertinoColors.secondaryLabel,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10,top: 10,),
            child: Icon(Icons.more_vert_outlined,color: Colors.white,),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        child: Text(
                          userInput.toString(),
                          style: TextStyle(fontSize: 40, color: Colors.white,),
                        ),
                        alignment: Alignment.bottomRight ,
                      ),
                      SizedBox(height: 5,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          answer.toString(),
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        MyButton(
                          tital: 'AC',
                          onpress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                            ;
                          },
                        ),
                        MyButton(
                          tital: '+/-',
                          onpress: () {
                            userInput += '+/-';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          tital: '%',
                          onpress: () {
                            userInput += '%';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          tital: '/',
                          color: Color(0xffffa00a),
                          onpress: () {
                            userInput += '/';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          tital: '7',
                          onpress: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          tital: '8',
                          onpress: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          tital: '9',
                          onpress: () {
                            userInput += '9';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          tital: 'x',
                          color: Color(0xffffa00a),
                          onpress: () {
                            userInput += 'x';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          tital: '4',
                          onpress: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          tital: '5',
                          onpress: () {
                            userInput += '5';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          tital: '6',
                          onpress: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          tital: '-',
                          color: Color(0xffffa00a),
                          onpress: () {
                            userInput += '-';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          tital: '1',
                          onpress: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          tital: '2',
                          onpress: () {
                            userInput += '2';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          tital: '3',
                          onpress: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          tital: '+',
                          color: Color(0xffffa00a),
                          onpress: () {
                            userInput += '+';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          tital: '0',
                          onpress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          tital: '.',
                          onpress: () {
                            userInput += '.';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          tital: 'DEL',
                          onpress: () {
                            userInput = userInput.substring(0,userInput.length-1);
                            setState(() {});
                          },
                        ),
                        MyButton(
                          tital: '=',
                          color: Color(0xffffa00a),
                          onpress: () {
                            equalpress();
                            setState(() {
                              
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
  void equalpress(){
    String finalUserInput = userInput.replaceAll('x', '*');
    Parser P = Parser();
    Expression expression = P.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
