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
  String name;

  CardValueFace.jack() : name = "J";
  CardValueFace.quin() : name = "Q";
  CardValueFace.king() : name = "K";

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
