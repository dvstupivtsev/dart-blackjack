import 'card.dart';

abstract class Person {
  List<Card> hand = [];

  void take(List<Card> fromDeck) {
    hand.add(fromDeck.removeLast());
  }

  void pass() {}

  int handWeight() {
    var weight = 0;
    for (var card in hand) {
      weight = card.sumToHand(weight);
    }

    return weight;
  }

  String handDescription();
  String handWeightDescription();
}

class Gambler extends Person {
  @override
  String handDescription() {
    return hand.join("; ");
  }

  @override
  String handWeightDescription() {
    return handWeight().toString();
  }
}

class Dealer extends Person {
  @override
  String handDescription() {
    var desc = "";

    for (var i = 0; i < hand.length; i++) {
      if (i == 0) {
        desc += hand[0].toString();
      } else {
        desc += "**";
      }

      if (i < hand.length - 1) {
        desc += "; ";
      }
    }

    return desc;
  }

  @override
  String handWeightDescription() {
    return hand.first.sumToHand(0).toString();
  }
}
