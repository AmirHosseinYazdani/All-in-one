import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

const NomicsAPIURL = 'https://api.nomics.com/v1/currencies/ticker?key=';
const apiKeyNomics = 'c8d23d15b136f57c536f4894bd838657';

class NetworkHelper {
  NetworkHelper({required this.cryptoSymbol, required this.currencySymbol});

  final String? cryptoSymbol, currencySymbol;

  Future<dynamic> getCurrenciesData() async {
    String requestURLNomics = NomicsAPIURL +
        apiKeyNomics +
        '&ids=$cryptoSymbol&interval=1d,30d&convert=$currencySymbol&per-page=100&page=1';
    print(requestURLNomics);
    Response response = await get(Uri.parse(requestURLNomics));
    if (response.statusCode == 200) {
      print(response);
      return jsonDecode(response.body);
    } else {
      print('response.statusCode is : ' + response.statusCode.toString());
      return null;
    }
  }
}
