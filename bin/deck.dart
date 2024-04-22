import 'card.dart';
import 'card_value.dart';

class Deck {
  final List<Card> _cards = [];

  bool get isEmpty => _cards.isEmpty;

  Deck() {
    for (var suit in Suit.values) {
      for (var i = 2; i <= 10; i++) {
        _cards.add(Card(suit, CardValuePip(i)));
      }

      _cards.add(Card(suit, CardValueFace.jack));
      _cards.add(Card(suit, CardValueFace.quin));
      _cards.add(Card(suit, CardValueFace.king));

      _cards.add(Card(suit, CardValueAce()));
    }

    _cards.shuffle();
  }

  Card? take() => _cards.isNotEmpty ? _cards.removeLast() : null;
}
