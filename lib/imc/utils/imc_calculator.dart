class ImcCalculator{
  final double peso;
  final double altura;
  ImcCalculator(this.peso, this.altura);

  static double calcular(double peso, double altura){
      return peso/(altura*altura);
  }
  
}