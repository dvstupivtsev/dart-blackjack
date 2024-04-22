import 'dart:io';
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

      gambler.move(dealer, deck, printHands: _printHands);

      dealer.showingCards = true;

      _printHands(dealer, gambler);

      if (gambler.handWeight() > 21) {
        print(redColorString("Дилер победил"));
        break;
      }

      dealer.move(gambler, deck);

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

  void _printHands(Dealer dealer, Gambler gambler) {
    print("""
Дилер: ${dealer.handDescription}
Игрок: ${gambler.handDescription}
---------
    """);
  }
}
