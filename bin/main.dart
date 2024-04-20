import 'dart:io';
import 'card_value.dart';
import 'card.dart';
import 'person.dart';
import 'color_output.dart';

void main() {
  var blackjack = Balckjack();
  blackjack.start();
}

class Balckjack {
  void start() {
    List<Card> deck = _createDeck();
    deck.shuffle();

    var gambler = Gambler();
    var dealer = Dealer();

    gambler.take(deck);
    gambler.take(deck);

    dealer.take(deck);
    dealer.take(deck);

    while (true) {
      _printHands(dealer, gambler);

      dealer.showingCards = true;

      if (gambler.handWeight() > 21 || dealer.handWeight() == 21) {
        print(redColorString("Дилер победил"));
        break;
      }

      if (dealer.handWeight() > 21) {
        print(greenColorString("Игрок победил"));
        break;
      }

      _gamblersMove(dealer, gambler, deck);

      _printHands(dealer, gambler);

      if (gambler.handWeight() > 21) {
        print(redColorString("Дилер победил"));
        break;
      }

      _dealersMove(dealer, gambler, deck);

      _printHands(dealer, gambler);

      if (dealer.handWeight() > 21) {
        print(greenColorString("Игрок победил"));
      } else if (dealer.handWeight() > gambler.handWeight()) {
        print(redColorString("Дилер победил"));
      } else if (dealer.handWeight() < gambler.handWeight()) {
        print(redColorString("Дилер победил"));
      } else {
        print(blueColorString("Ничья"));
      }

      print("---------");

      break;
    }

    if (_restart()) {
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

  void _gamblersMove(Dealer dealer, Gambler gambler, List<Card> deck) {
    print('Ход Игрока (1 - Взять, 2 - Пас):');

    final input = stdin.readLineSync();

    if (input == '1') {
      gambler.take(deck);
      _printHands(dealer, gambler);

      if (deck.isEmpty) {
        return;
      }

      return _gamblersMove(dealer, gambler, deck);
    } else if (input == '2') {
      return;
    } else {
      print('Неправильный ввод.');
      return _gamblersMove(dealer, gambler, deck);
    }
  }

  void _dealersMove(Dealer dealer, Gambler gambler, List<Card> deck) {
    if (deck.isEmpty) {
      return;
    }

    if (dealer.handWeight() >= 21) {
      return;
    } else {
      if (dealer.handWeight() < gambler.handWeight()) {
        dealer.take(deck);
      } else {
        return;
      }
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

  void _printHands(Dealer dealer, Gambler gambler) {
    print("""
Дилер: ${dealer.handDescription()}
Игрок: ${gambler.handDescription()}
---------
    """);
  }
}
