import 'card_value.dart';
import 'color_output.dart';

enum Suit {
  diamonds,
  clubs,
  hearts,
  spades;

  @override
  String toString() {
    return switch (this) {
      Suit.diamonds => yellowColorString("♦"),
      Suit.clubs => greenColorString("♣"),
      Suit.hearts => redColorString("♥"),
      Suit.spades => blueColorString("♠")
    };
  }
}

class Card {
  Suit suit;
  CardValue value;

  Card(this.suit, this.value);

  @override
  String toString() => "$value$suit";

  int sumToHandWeight(int handWeight) => value.sumToHandWeight(handWeight);
}
