// import 'package:expressions/expressions.dart';
enum Estados { q0Initial, q1Final, q2Reject }

class Calculadora {
  

  final List<String> symbols = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  final List<String> operands = ['+', '-', '/','*'] ;

  Estados processEntry(String mathExpression) {
    Estados atualState = Estados.q0Initial;

    for (var symbol in mathExpression.split('')) {
      switch (atualState) {
      case Estados.q0Initial:
        if (symbols.contains(symbol)) {
          atualState = Estados.q1Final;
        } else if (operands.contains(symbol)) { 
          atualState = Estados.q2Reject;     
        } else {
          atualState = Estados.q2Reject;
        }
        break;

      case Estados.q1Final:
        if (symbols.contains(symbol)) {
          atualState = Estados.q1Final;
        } else if (operands.contains(symbol)) {
          atualState = Estados.q0Initial;     
        } else {
          atualState = Estados.q2Reject;
        }
        break;

      case Estados.q2Reject:
        break; 
    }
    }
    return atualState;
  }
}
void main() {
  // var calc = Calculadora();

  
  // print("Teste '5+2': ${calc.processEntry("5+2")}"); // Estados.q1Final

  // print("Teste '9-': ${calc.processEntry("9-")}");   // Estados.q0Initial

  // print("Teste '-22+4-0': ${calc.processEntry("-22+4-0")}");     // Estados.q2Reject

  //  print("Teste '22+4-0': ${calc.processEntry("22+4-0")}");     // Estados.q2Reject
  //  print("Teste '/22+4-0': ${calc.processEntry("/22+4-0")}");     // Estados.q2Reject
   
  // final expression = Expression.parse('22+4-0');
  // final evaluator = const ExpressionEvaluator();

  //  print("Calcular '22+4-0': ${ evaluator.eval(expression, {})}");  

  //  final expression = Expression.parse("5 + 2");
  
  
//   final result = evaluator.eval(expression, {});
//   print(result);
}

