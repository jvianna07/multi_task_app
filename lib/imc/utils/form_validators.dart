class FormValidators {
  static String? validForm(String? inputText) {
    // Verifica primeiro se o texto de entrada está nulo ou vazio
    if (inputText == null || inputText.trim().isEmpty) {
      return 'Please fill with a valid number';
    }

    // Limpa o texto e tenta converter para número
    final cleanText = inputText.replaceAll(',', '.').replaceAll(' ', '');
    final value = double.tryParse(cleanText);

    // Se falhar na conversão (ex: "56b"), o value será null
    if (value == null) {
      return 'Please fill with a valid number';
    }

    return null; 
  }
}

