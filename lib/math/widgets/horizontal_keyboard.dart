import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';
import 'package:multi_task_app/utils/constants.dart';
import 'package:multi_task_app/math/widgets/buttons.dart';

class HorizontalKeyboard extends StatefulWidget {
  const HorizontalKeyboard({super.key});

  @override
  State<HorizontalKeyboard> createState() => _HorizontalKeyboardState();
}

class _HorizontalKeyboardState extends State<HorizontalKeyboard> {
  final evaluator = const ExpressionEvaluator();

  String mathExpression = '';

  void onClickBtn(String value) {
    setState(() {
      mathExpression += value;
    });
  }

  void onResetBtn(String value) {
    if (value == 'AC' || value == 'DEL') {
      setState(() {
        mathExpression = '';
      });
    }
  }

  void onBackspaceBtn(String value) {
    if (value == '<-') {
      setState(() {
        if (mathExpression.length > 1) {
          mathExpression = mathExpression.substring(
            0,
            mathExpression.length - 1,
          );
        } else {
          mathExpression = '';
        }
      });
    }
  }

  void onCalculateBtn(String value) {
    mathExpression = mathExpression.replaceAll('÷', '/').replaceAll('x', '*');
    setState(() {
      final exp = Expression.parse(mathExpression);
      mathExpression = evaluator.eval(exp, {}).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Pegar tamanho da tela para distribuir os botoes de forma proporcional
    var screenSize = MediaQuery.of(context).size;
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          
          Container(
            // width: 30,
            // height: 130,
            child: Column(
              children: [

                Row(children: [
                   CalculatorBtn(
                onResetBtn,
                'DEL',
                btnColor: Colors.red, 
                btnHeight: screenSize.height*0.35/4*2,
                btnWwidth: screenSize.width * 0.6 /4

              ),
             

                ],),
SizedBox(height: 8,),
                Row(children: [
      
              CalculatorBtn(
                onBackspaceBtn,
                '<-',
                btnIcon: Icons.backspace,
                btnColor:  Colors.teal, 
                btnHeight: screenSize.height*0.41/4*2,
                btnWwidth: screenSize.width * 0.6 /4
              ),
              

                ],)
                
              ],
            )
            ),

          Container(
            child: Column(
              children: [
                Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorBtn(onClickBtn, '7', btnWwidth: screenSize.width * 0.5 /5),
              CalculatorBtn(onClickBtn, '8', btnWwidth: screenSize.width * 0.5 /5),
              CalculatorBtn(onClickBtn, '9', btnWwidth: screenSize.width * 0.5 /5),
              CalculatorBtn(
                onClickBtn,
                'x',
                btnColor: StaticBtnColors().btnOrange, btnWwidth: screenSize.width * 0.5 /5
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorBtn(onClickBtn, '4', btnWwidth: screenSize.width * 0.5 /5),
              CalculatorBtn(onClickBtn, '5', btnWwidth: screenSize.width * 0.5 /5),
              CalculatorBtn(onClickBtn, '6', btnWwidth: screenSize.width * 0.5 /5),
              CalculatorBtn(
                onClickBtn,
                '-',
                btnColor: StaticBtnColors().btnOrange, btnWwidth: screenSize.width * 0.5 /5
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorBtn(onClickBtn, '1', btnWwidth: screenSize.width * 0.5 /5),
              CalculatorBtn(onClickBtn, '2', btnWwidth: screenSize.width * 0.5 /5),
              CalculatorBtn(onClickBtn, '3', btnWwidth: screenSize.width * 0.5 /5),
              CalculatorBtn(
                onClickBtn,
                '+',
                btnColor: StaticBtnColors().btnOrange, btnWwidth: screenSize.width * 0.5 /5
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorBtn(onClickBtn, '.', btnWwidth: screenSize.width * 0.5 /5),
              CalculatorBtn(onClickBtn, '0', btnWwidth: screenSize.width * 0.5 /5),
              CalculatorBtn(
                onCalculateBtn,
                '=',
                btnColor: StaticBtnColors().btnOrange, btnWwidth: screenSize.width * 0.5 /5
              ),
              CalculatorBtn(
                onClickBtn,
                '÷',
                btnColor: StaticBtnColors().btnOrange, btnWwidth: screenSize.width * 0.5 /5
              ),
            ],
          ),

              ],
            ),
            ),

          // Container(
          //   width: 30,
          //   height: 130,
          //   child: Column(
          //     children: [

          //     ],
          //   ),
          //   ),


        ],);
    }
  }

