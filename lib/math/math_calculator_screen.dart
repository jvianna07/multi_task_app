import 'package:flutter/material.dart';
import 'package:imc_calculator/math/widgets/horizontal_keyboard.dart';
import 'package:imc_calculator/math/widgets/vertical_keyboard.dart';


class MathCalculatorScreen extends StatefulWidget {
  const MathCalculatorScreen({super.key});

  @override
  State<MathCalculatorScreen> createState() => _MathCalculatorScreenState();
}

class _MathCalculatorScreenState extends State<MathCalculatorScreen> {
    String mathExpression = '';

  @override
  Widget build(BuildContext context) {
    // Pegar tamanho da tela para distribuir os botoes de forma proporcional
   var screenSize = MediaQuery.of(context).size;
      // Widgets pequenos
      return Scaffold(
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(16),
                child: Text(
                  mathExpression ==''?'0':mathExpression,
                  
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),              
              ),
            screenSize.width > screenSize.height? HorizontalKeyboard(): VericalKeyboard(),
             
            ],
          ),
        ),
      ),
    );
  }
}
