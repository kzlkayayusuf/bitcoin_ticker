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

//const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const bitcoinAverageURL='https://apiv2.bitcoinaverage.com/indices/global/ticker';
const apiKey = 'YOUR-API-KEY-HERE';

class CoinData {
  Future getCoinData(String? selectedCurrency) async{
    //String requestURL= '$coinAPIURL/BTC/USD?apiKey=$apiKey';
    String requestURL= '$bitcoinAverageURL/BTC$selectedCurrency';
    http.Response response = await http.get(Uri.parse(requestURL));

    if(response.statusCode == 200){
      var decodedData= jsonDecode(response.body);
      //var lastPrice= decodedData['rate'];
      double lastPrice = decodedData['last'];
      return lastPrice.toStringAsFixed(0);
    }else{
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }

}