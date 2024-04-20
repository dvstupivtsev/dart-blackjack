import 'dart:io';
import 'card_value.dart';
import 'card.dart';
import 'person.dart';
import 'result.dart';

void main() {
  var blackjack = Balckjack();
  blackjack.start();
}

class Balckjack {
  void start() {
    var restartGame = false;

    while (true) {
      List<Card> deck = _createDeck();
      deck.shuffle();

      var gambler = Gambler();
      var dealer = Dealer();

      gambler.take(deck);
      gambler.take(deck);

      dealer.take(deck);
      dealer.take(deck);

      print("""
Дилер: ${dealer.handDescription()}
Игрок: ${gambler.handDescription()}
---------
    """);

      var (result, resultDesc) = calculateGameResult(gambler, dealer);
      if (resultDesc != null) {
        print("$resultDesc");
      }

      if (result != GameResult.continueGame) {
        restartGame = _restart();
        break;
      }
    }

    if (restartGame) {
      start();
    }
  }

  bool _restart() {
    print('Играть еще? (y/n)');

    final input = stdin.readLineSync();

    if (input == 'y') {
      return true;
    } else if (input == 'n') {
      return false;
    } else {
      print('Неправильный ввод.');
      return _restart();
    }
  }

  List<Card> _createDeck() {
    List<Card> deck = [];

    for (var suit in Suit.values) {
      for (var i = 2; i <= 10; i++) {
        deck.add(Card(suit, CardValuePip(i)));
      }

      deck.add(Card(suit, CardValueFace.jack));
      deck.add(Card(suit, CardValueFace.quin));
      deck.add(Card(suit, CardValueFace.king));

      deck.add(Card(suit, CardValueAce()));
    }

    return deck;
  }
}
