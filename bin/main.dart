import 'dart:io';
import 'card.dart';
import 'deck.dart';
import 'person.dart';
import 'color_output.dart';

void main() {
  var blackjack = Balckjack();
  blackjack.start();
}

class Balckjack {
  void start() {
    var deck = Deck();

    var gambler = Gambler();
    var dealer = Dealer();

    gambler.take(deck: deck);
    gambler.take(deck: deck);

    dealer.take(deck: deck);
    dealer.take(deck: deck);

    while (true) {
      _printHands(dealer, gambler);

      if (gambler.handWeight() > 21 || dealer.handWeight() == 21) {
        print(redColorString("Дилер победил"));
        break;
      }

      if (dealer.handWeight() > 21) {
        print(greenColorString("Игрок победил"));
        break;
      }

      _gamblersMove(dealer, gambler, deck);

      dealer.showingCards = true;

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
        print(greenColorString("Игрок победил"));
      } else {
        print(blueColorString("Ничья"));
      }

      break;
    }

    print("---------");
    print("");

    if (_restart()) {
      start();
    }
  }

  bool _restart() {
    print("Играть еще? (y/n)");

    final input = stdin.readLineSync();
    print("---------");
    print("");

    if (input == "y") {
      return true;
    } else if (input == "n") {
      return false;
    } else {
      print("Неправильный ввод.");
      return _restart();
    }
  }

  void _gamblersMove(Dealer dealer, Gambler gambler, Deck deck) {
    print("Ход Игрока (1 - Взять, 2 - Пас):");

    final input = stdin.readLineSync();
    print("---------");
    print("");

    if (input == "1") {
      gambler.take(deck: deck);
      _printHands(dealer, gambler);

      if (deck.isEmpty) {
        return;
      }

      return _gamblersMove(dealer, gambler, deck);
    } else if (input == "2") {
      return;
    } else {
      print("Неправильный ввод.");
      return _gamblersMove(dealer, gambler, deck);
    }
  }

  void _dealersMove(Dealer dealer, Gambler gambler, Deck deck) {
    if (deck.isEmpty) {
      return;
    }

    if (dealer.handWeight() > 19) {
      return;
    } else {
      if (dealer.handWeight() < gambler.handWeight()) {
        dealer.take(deck: deck);
        _dealersMove(dealer, gambler, deck);
      } else {
        return;
      }
    }
  }

  void _printHands(Dealer dealer, Gambler gambler) {
    print("""
Дилер: ${dealer.handDescription()}
Игрок: ${gambler.handDescription()}
---------
    """);
  }
}
