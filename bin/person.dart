import 'card.dart';

abstract class Person {
  List<Card> hand = [];

  void take(List<Card> fromDeck) {
    hand.add(fromDeck.removeLast());
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

  String handWeightDescription() {
    return handWeight().toString();
  }
}

class Gambler extends Person {}

class Dealer extends Person {
  var showingCards = false;

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

  @override
  String handWeightDescription() {
    if (showingCards) {
      return super.handWeightDescription();
    } else {
      var openCardWeight = hand.first.sumToHandWeight(0);
      if (openCardWeight >= 10) {
        return super.handWeightDescription();
      } else {
        return openCardWeight.toString();
      }
    }
  }
}
