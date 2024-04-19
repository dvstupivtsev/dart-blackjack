import 'dart:io';
import 'card_value.dart';
import 'card.dart';

void main() {
  List<Card> deck = randomDeck();

  print(deck);
}

List<Card> randomDeck() {
  List<Card> deck = [];

  for (var suit in Suit.values) {
    for (var i = 2; i <= 10; i++) {
      deck.add(Card(suit, CardValuePip(i)));
    }

    deck.add(Card(suit, CardValueFace.jack));
    deck.add(Card(suit, CardValueFace.quin));
    deck.add(Card(suit, CardValueFace.king));

    deck.add(Card(suit, CardValueAce()));
  }

  deck.shuffle();

  return deck;
}
