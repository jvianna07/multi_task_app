import 'dart:convert';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multi_task_app/utils/constants.dart';
import 'package:multi_task_app/currency/utils/exchange_model.dart';
import 'package:transparent_image/transparent_image.dart';


class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  State<CurrencyConverterScreen> createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final String imageURL =
      'https://ps.w.org/x-currency/assets/icon-256x256.gif?rev=3056906';

  late Future<ExchangeRateModel> futureExchange;
  var baseCurrency = 'Dólar';
  var currencyCode = 'USD';

  Future<ExchangeRateModel> fetchExchange() async {
    final response = await http.get(
      Uri.parse('https://open.er-api.com/v6/latest/$currencyCode'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ExchangeRateModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load ExchangeRateModel');
    }
  }

  final List<DropdownMenuItem<String>> currencies = [
    DropdownMenuItem(value: 'Dólar', child: Text('Dólar')),
    DropdownMenuItem(value: 'Euro', child: Text('Euro')),
    DropdownMenuItem(value: 'Real', child: Text('Real')),
    DropdownMenuItem(value: 'Metical', child: Text('Metical')),
    DropdownMenuItem(value: 'Rand', child: Text('Rand')),
  ];

  @override
  void initState() {
    super.initState();
    futureExchange = fetchExchange();
  }

  void _updateData() {
    setState(() {
      futureExchange = fetchExchange();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _updateData,
        child: Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Row(children: [
              Text('Moeda de referência:'),
              SizedBox(width: 20,),
              DropdownButton<String>(
              value: baseCurrency,
              items: currencies,

              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    baseCurrency = newValue;
                    currencyCode = switch (baseCurrency) {
                      'Dólar' => 'USD',
                      'Euro' => 'EUR',
                      'Real' => 'BRL',
                      'Metical' => 'MZN',
                      'Rand' => 'ZAR',
                      _ => 'USD',
                    };
                  });
                  _updateData();
                }
              },
            ),
            ],),

            FutureBuilder<ExchangeRateModel>(
              future: futureExchange, // Deve ser um Future<ExchangeRateModel>
              builder: (BuildContext context, AsyncSnapshot<ExchangeRateModel> snapshot) {
                // 1. Verifica se houve algum erro na requisição HTTP
                if (snapshot.hasError) {
                  return Text('Erro ao carregar dados');
                }

                // 2. Verifica se o Future terminou e possui os dados do modelo
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  // Cria uma variável local e segura com os dados extraídos
                  final exchangeData = snapshot.data!;

                  return Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [

                        ListTile(
                          leading: CountryFlag.fromCountryCode(
    'US',),
                          tileColor: Colors.teal[200],
                          title: Text(
                          'USD: ${exchangeData.getRate('USD') ?? "Não encontrado"}',
                        )),

                        ListTile(
                          // leading: Text('🇪🇺'),
                          leading: CountryFlag.fromCurrencyCode(
    'EUR',),
                          tileColor: Colors.teal[100],
                          title: Text(
                          'EUR: ${exchangeData.getRate('EUR') ?? "Não encontrado"}',
                        ),
                        ),

                        ListTile(
                          leading: CountryFlag.fromCountryCode(
    'BR',),
                          tileColor: Colors.teal[200],
                          title: Text(
                          'BRL: ${exchangeData.getRate('BRL') ?? "Não encontrado"}',
                        ),
                        ),

                        ListTile(
                          leading: CountryFlag.fromCountryCode(
    'MZ',),
                          tileColor: Colors.teal[100],
                          title: Text(
                          'MZN: ${exchangeData.getRate('MZN') ?? "Não encontrado"}',
                        ),
                        ),

                        ListTile(
                          leading: CountryFlag.fromCountryCode(
    'ZA',),
                          tileColor: Colors.teal[200],
                          title: Text(
                          'ZAR: ${exchangeData.getRate('ZAR') ?? "Não encontrado"}',
                        ),
                        ),
                        
                        Text(
                          'Data da última atualização: ${exchangeData.lastUpdate}',
                        ),
                      
                      ],
                    ),
                  );
                }

                // 3. Exibe um indicador visual enquanto o Future está carregando
                return const CircularProgressIndicator();
              },
            ),

            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: StaticImagesURL().currencyImageURL,
            ),
          ],
        ),
      ),
    );
  }
}
