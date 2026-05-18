import 'package:flutter/material.dart';
import 'package:multi_task_app/utils/constants.dart';
import 'package:multi_task_app/imc/utils/imc_calculator.dart';
import 'package:multi_task_app/imc/utils/form_validators.dart';
import 'package:multi_task_app/imc/widgets/imc_results.dart';

class ImcScreen extends StatefulWidget {
  const ImcScreen({super.key});

  @override
  State<ImcScreen> createState() => _ImcScreenState();
}

class _ImcScreenState extends State<ImcScreen> {
  // variables 
  final _formKey = GlobalKey<FormState>();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  double results = 0;
  bool _showImcResults = false;
  late FocusNode cursorPosition;

  // funtions 
  @override
  void initState() {
    super.initState();
    cursorPosition = FocusNode();
  }

  @override
  void dispose() {
    cursorPosition.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    print(screenSize);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 12,
              children: [
                // AREA DE RESULTADOS
                if (_showImcResults == true) ImcResults(imcResult: results),
        
                // LEGENDA
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: screenSize.width>600? screenSize.width*.9/3:screenSize.width*.8/3,
                      height: 30,
                      decoration: BoxDecoration(
                        color: StaticImcColors().imcColorYellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(child: Text('Abaixo do peso')),
                    ),
                    Container(
                      width: screenSize.width>600? screenSize.width*.9/3:screenSize.width*.8/3,
                      height: 30,
                      decoration: BoxDecoration(
                        color: StaticImcColors().imcColorGreen,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(child: Text('Saudável'),),
                    ),
                    Container(
                      width: screenSize.width>600? screenSize.width*.9/3:screenSize.width*.8/3,
                      height: 30,
                      decoration: BoxDecoration(
                        color: StaticImcColors().imcColorRed,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(child: Text('Sobrepeso')),
                    ),
                  ],
                ),
        
                // INSIRA O PESO
                TextFormField(
                  validator: FormValidators.validForm,
                  controller: pesoController,
                  focusNode: cursorPosition,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'peso (kg)',
                  ),
                ),
        
                // INSIRA A ALTURA
                TextFormField(
                  validator: FormValidators.validForm,
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'altura (m)',
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 189, 238, 233)),
                    minimumSize: WidgetStatePropertyAll(
                      Size(double.infinity, 40),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var peso = double.tryParse(pesoController.text.replaceAll(',', '.').replaceAll(' ', ''));
                      var altura = double.tryParse(alturaController.text.replaceAll(',', '.').replaceAll(' ', ''));
        
                      setState(() {
                        _showImcResults = true;
                        results = ImcCalculator.calcular(peso!, altura!);
                        pesoController.clear();
                        alturaController.clear();
                        cursorPosition.requestFocus();
                      });
                    }
                  },
                  child: Text('Calcular'),
                ),
                Image.network(StaticImagesURL().imcImageURL),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
