import 'package:flutter/material.dart';
import 'package:imc_calculator/utils/constants.dart';

class CalculatorBtn extends StatelessWidget {
  final String btnValue;
  final Color? btnColor;
  final double? btnHeight;
  final double? btnWwidth;
  final IconData? btnIcon; // Icon é opcional
  final Function(String) onClickBtn;

  const CalculatorBtn(
    this.onClickBtn, 
    this.btnValue,
    {this.btnIcon,
    this.btnColor,
    this.btnHeight,
    this.btnWwidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Pegar tamanho da tela para distribuir os botoes de forma proporcional
    var screenSize = MediaQuery.of(context).size; 
  
    
    return SizedBox(
      height: btnHeight ?? screenSize.height*0.41/5,
      width: btnWwidth ?? screenSize.width*0.91/4,
      child: ElevatedButton(
        onPressed: () => onClickBtn(btnValue),
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          ),
          backgroundColor: WidgetStatePropertyAll(btnColor ?? StaticBtnColors().btnGray),
        ),
        // Mostra o icone se tiver. Caso nao, mostra o texto
        child: btnIcon != null
            ? Icon(btnIcon, size: 32)
            : Text(
                btnValue,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}

