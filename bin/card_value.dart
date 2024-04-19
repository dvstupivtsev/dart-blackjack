abstract class CardValue {
  String description();
  int sumToHand(int hand);

  @override
  String toString() {
    return description();
  }
}

class CardValuePip extends CardValue {
  int value;

  CardValuePip(this.value);

  @override
  String description() {
    return value.toString();
  }

  @override
  int sumToHand(int hand) {
    return hand + value;
  }
}

class CardValueFace extends CardValue {
  static var jack = CardValueFace("Jack");
  static var quin = CardValueFace("Quin");
  static var king = CardValueFace("King");

  String name;

  CardValueFace(this.name);

  @override
  String description() {
    return name;
  }

  @override
  int sumToHand(int hand) {
    return hand + 10;
  }
}

class CardValueAce extends CardValue {
  @override
  String description() {
    return "Ace";
  }

  @override
  int sumToHand(int hand) {
    return hand < 21 ? hand + 11 : hand + 1;
  }
}
