abstract class CardValue {
  int sumToHandWeight(int handWeight);
}

class CardValuePip extends CardValue {
  int value;

  CardValuePip(this.value);

  @override
  String toString() {
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
  String toString() {
    return name;
  }

  @override
  int sumToHandWeight(int handWeight) {
    return handWeight + 10;
  }
}

class CardValueAce extends CardValue {
  @override
  String toString() {
    return "A";
  }

  @override
  int sumToHandWeight(int handWeight) {
    return handWeight < 21 ? handWeight + 11 : handWeight + 1;
  }
}
