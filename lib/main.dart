import 'package:flutter/material.dart';
import 'package:imc_calculator/imc/imc_screen.dart';
import 'package:imc_calculator/math/math_calculator_screen.dart';
import 'package:imc_calculator/currency/currency_converter_screen.dart';

void main() {
  runApp(const MainApp());
}
 
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi-task app',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Multi-task App'),
            backgroundColor: const Color.fromARGB(255, 189, 238, 233),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(text: 'IMC'),
                Tab(text: 'Currency'),
                Tab(text: 'Math'),
                // Tab(text: 'IMC', icon: Icon(Icons.scale)),
                // Tab(text: 'Currency', icon: Icon(Icons.currency_exchange)),
                // Tab(text: 'Math', icon: Icon(Icons.calculate)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ImcScreen(),
              CurrencyConverterScreen(),
              MathCalculatorScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
