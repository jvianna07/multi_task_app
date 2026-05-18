import 'package:intl/intl.dart';

class ExchangeRateModel {
  final String result;
  final String baseCode;
  final String lastUpdate;
  final Map<String, double> rates;
  

  ExchangeRateModel({
    required this.result,
    required this.baseCode,
    required this.rates,
    required this.lastUpdate,
  });

  // Converte o JSON (Map<String, dynamic>) para o objeto Dart
  factory ExchangeRateModel.fromJson(Map<String, dynamic> json) {
    // Mapeia e garante que todos os valores do rates sejam double
    final ratesMap = json['rates'] as Map<String, dynamic>;
    final Map<String, double> convertedRates = ratesMap.map(
      (key, value) => MapEntry(key, (value as num).toDouble()),
    );


    // 2. Captura a string complexa da API
    String rawDate = json['time_last_update_utc'] ?? '';
    String formattedDate = 'Data indisponível';
    
    if (rawDate.isNotEmpty) {
      try {
        // Lê o formato original em inglês enviado pela API
        DateFormat inputFormat = DateFormat("EEE, dd MMM yyyy HH:mm:ss Z", "en_US");
        DateTime parsedDate = inputFormat.parse(rawDate);
        
        // Transforma estritamente no padrão dia-mês-ano (dd-MM-yyyy)
        formattedDate = DateFormat("dd-MM-yyyy").format(parsedDate);
      } catch (e) {
        // Fallback caso o formato mude inesperadamente
        formattedDate = rawDate; 
      }
    }
    return ExchangeRateModel(
      result: json['result'] as String,
      baseCode: json['base_code'] as String,
      rates: convertedRates,
      lastUpdate: formattedDate,
    );
  }

  // Método utilitário para buscar uma taxa específica com segurança
  double? getRate(String currencyCode) => rates[currencyCode.toUpperCase()];
}
