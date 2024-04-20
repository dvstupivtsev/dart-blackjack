import 'dart:io';
import 'card.dart';
import 'deck.dart';

abstract class Person {
  List<Card> hand = [];

  void take({required Deck deck}) {
    var card = deck.take();
    if (card != null) {
      hand.add(card);
    }
  }

  int handWeight() {
    var weight = 0;
    for (var card in hand) {
      weight = card.sumToHandWeight(weight);
    }

    return weight;
  }

  String handDescription() {
    return hand.join("; ");
  }
}

class Gambler extends Person {
  void move(Dealer dealer, Deck deck,
      {required Function(Dealer, Gambler) printHands}) {
    print("Ход Игрока (1 - Взять, 2 - Пас):");

    final input = stdin.readLineSync();
    print("---------");
    print("");

    if (input == "1") {
      take(deck: deck);
      printHands(dealer, this);

      if (deck.isEmpty) {
        return;
      }

      return move(dealer, deck, printHands: printHands);
    } else if (input == "2") {
      return;
    } else {
      print("Неправильный ввод.");
      return move(dealer, deck, printHands: printHands);
    }
  }
}

class Dealer extends Person {
  var showingCards = false;

  void move(Gambler gambler, Deck deck) {
    if (deck.isEmpty) {
      return;
    }

    if (handWeight() > 19) {
      return;
    } else {
      if (handWeight() < gambler.handWeight()) {
        take(deck: deck);
        move(gambler, deck);
      } else {
        return;
      }
    }
  }

  @override
  String handDescription() {
    if (showingCards) {
      return super.handDescription();
    } else {
      if (hand.first.sumToHandWeight(0) >= 10) {
        return super.handDescription();
      } else {
        return _partialyHiddenHandDescription();
      }
    }
  }

  String _partialyHiddenHandDescription() {
    var desc = "";
    for (var i = 0; i < hand.length; i++) {
      if (i == 0) {
        desc += hand[0].toString();
      } else {
        desc += "-";
      }

      if (i < hand.length - 1) {
        desc += "; ";
      }
    }

    return desc;
  }
}
