import 'person.dart';
import 'color_output.dart';

enum GameResult { gamblerWon, dealerWon, draw, continueGame }

(GameResult, String?) calculateGameResult(Gambler gambler, Dealer dealer) {
  if (gambler.handWeight() > 21) {
    return (GameResult.dealerWon, redColorString("Dealer won"));
  } else if (dealer.handWeight() == 21) {
    return (GameResult.dealerWon, redColorString("Dealer won"));
  } else if (dealer.handWeight() > 21) {
    return (GameResult.gamblerWon, redColorString("Gambler won"));
  } else {
    return (GameResult.continueGame, null);
  }
}
