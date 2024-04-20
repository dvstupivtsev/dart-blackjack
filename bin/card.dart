import 'card_value.dart';

enum Suit {
  diamonds,
  clubs,
  hearts,
  spades;

  @override
  String toString() {
    return switch (this) {
      Suit.diamonds => redColorString("♦"),
      Suit.clubs => greenColorString("♣"),
      Suit.hearts => redColorString("♥"),
      Suit.spades => greenColorString("♠")
    };
  }

  String redColorString(String string) {
    return "\x1B[31m$string\x1B[0m";
  }

  String greenColorString(String string) {
    return "\x1B[32m$string\x1B[0m";
  }
}

class Card {
  Suit suit;
  CardValue value;

  Card(this.suit, this.value);

  @override
  String toString() {
    return "$suit$value";
  }

  int sumToHand(int hand) {
    return value.sumToHand(hand);
  }
}
