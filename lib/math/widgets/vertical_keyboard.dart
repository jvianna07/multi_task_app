import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';
import 'package:imc_calculator/utils/constants.dart';
import 'package:imc_calculator/math/widgets/buttons.dart';

class VericalKeyboard extends StatefulWidget {
  const VericalKeyboard({super.key});

  @override
  State<VericalKeyboard> createState() => _VericalKeyboardState();
}

class _VericalKeyboardState extends State<VericalKeyboard> {
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
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorBtn(
                onResetBtn,
                'DEL',
                btnColor: Colors.red,
                btnWwidth: screenSize.width * 0.91 / 4 * 2,
              ),
              CalculatorBtn(
                onBackspaceBtn,
                '<-',
                btnIcon: Icons.backspace,
                btnColor: const Color.fromARGB(255, 113, 137, 149),
              ),
              CalculatorBtn(
                onClickBtn,
                '÷',
                btnColor: StaticBtnColors().btnOrange,
              ),
            ],

          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorBtn(onClickBtn, '7'),
              CalculatorBtn(onClickBtn, '8'),
              CalculatorBtn(onClickBtn, '9'),
              CalculatorBtn(
                onClickBtn,
                'x',
                btnColor: StaticBtnColors().btnOrange,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorBtn(onClickBtn, '4'),
              CalculatorBtn(onClickBtn, '5'),
              CalculatorBtn(onClickBtn, '6'),
              CalculatorBtn(
                onClickBtn,
                '-',
                btnColor: StaticBtnColors().btnOrange,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorBtn(onClickBtn, '1'),
              CalculatorBtn(onClickBtn, '2'),
              CalculatorBtn(onClickBtn, '3'),
              CalculatorBtn(
                onClickBtn,
                '+',
                btnColor: StaticBtnColors().btnOrange,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorBtn(onClickBtn, '.'),
              CalculatorBtn(onClickBtn, '0'),
              CalculatorBtn(
                onCalculateBtn,
                '=',
                btnColor: StaticBtnColors().btnOrange,
                btnWwidth: screenSize.width * 0.91 / 4 * 2,
              ),
            ],
          ),
        ],
      );
    }
  }

