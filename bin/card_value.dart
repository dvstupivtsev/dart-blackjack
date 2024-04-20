abstract class CardValue {
  String description();
  int sumToHandWeight(int handWeight);

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
  int sumToHandWeight(int handWeight) {
    return handWeight + value;
  }
}

class CardValueFace extends CardValue {
  static var jack = CardValueFace("J");
  static var quin = CardValueFace("Q");
  static var king = CardValueFace("K");

  String name;

  CardValueFace(this.name);

  @override
  String description() {
    return name;
  }

  @override
  int sumToHandWeight(int handWeight) {
    return handWeight + 10;
  }
}

class CardValueAce extends CardValue {
  @override
  String description() {
    return "A";
  }

  @override
  int sumToHandWeight(int handWeight) {
    return handWeight < 21 ? handWeight + 11 : handWeight + 1;
  }
}
