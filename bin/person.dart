import 'card.dart';

abstract class Person {
  List<Card> hand;

  Person(this.hand);

  void take();
  void pass();
}

class Gambler extends Person {
  Gambler(super.hand);

  void take() {}

  void pass() {}
}

class Dealer extends Person {
  Dealer(super.hand);

  void take() {}

  void pass() {}
}
