import 'card_value.dart';

enum Suit { diamonds, clubs, hearts, spades }

class Card {
  Suit suit;
  CardValue value;

  Card(this.suit, this.value);

  @override
  String toString() {
    return "$suit $value";
  }
}
