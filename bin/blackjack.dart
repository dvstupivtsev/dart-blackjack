import 'dart:io';
import 'card_value.dart';
import 'card.dart';
import 'person.dart';

void main() {
  List<Card> deck = createDeck();
  deck.shuffle();

  var gambler = Gambler();
  var dealer = Dealer();

  gambler.take(deck);
  gambler.take(deck);

  dealer.take(deck);
  dealer.take(deck);

  print("Your hand:");
  print(gambler.handDescription());
  print("Shown weight: ${gambler.handWeightDescription()}");

  print("\nDealer hand:");
  print(dealer.handDescription());
  print("Shown weight: ${dealer.handWeightDescription()}");
}

List<Card> createDeck() {
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

  return deck;
}
