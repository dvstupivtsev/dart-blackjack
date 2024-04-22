abstract class CardValue {
  int sumToHandWeight(int handWeight);
}

class CardValuePip extends CardValue {
  int value;

  CardValuePip(this.value);

  @override
  String toString() => value.toString();

  @override
  int sumToHandWeight(int handWeight) => handWeight + value;
}

class CardValueFace extends CardValue {
  static var jack = CardValueFace("J");
  static var quin = CardValueFace("Q");
  static var king = CardValueFace("K");

  String name;

  CardValueFace(this.name);

  @override
  String toString() => name;

  @override
  int sumToHandWeight(int handWeight) => handWeight + 10;
}

class CardValueAce extends CardValue {
  @override
  String toString() => "A";

  @override
  int sumToHandWeight(int handWeight) =>
      handWeight < 21 ? handWeight + 11 : handWeight + 1;
}
