import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'YOUR-API-KEY-HERE';

class CoinData {
  Future getCoinData() async{
    String requestURL= '$coinAPIURL/BTC/USD?apiKey=$apiKey';
    http.Response response = await http.get(Uri.parse(requestURL));

    if(response.statusCode == 200){
      var decodedData= jsonDecode(response.body);
      var lastPrice= decodedData['rate'];
      return lastPrice;
    }else{
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }

}