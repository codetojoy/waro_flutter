import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import './card.dart';

/*
  TODO: stuck on async for ApiStrategy
  work-in-progress
*/

class ApiStrategy {
  Future<Card> selectCard(List<Card> cards, int prizeCard, int maxCard) {
    var cardFuture = fetchCard();
    return null;
  }

  Future<Card> fetchCard() async {
      final host = 'localhost:8080';
  final context = '/waro/strategy';
  var prizeCard = 10;
  var mode = 'max';
  var maxCard = 12;
  var cards = ['4', '6'];
  var queryParams = {
    'prize_card': '$prizeCard',
    'mode': '$mode',
    'max_card': '$maxCard',
    'cards': cards,
  };
  print('TRACER cp 1 begin');
  var url = Uri.http(host, context, queryParams);
  final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Card.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
