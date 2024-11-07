import 'package:bingo3/services/bingo_service.dart';
import 'package:flutter/foundation.dart';

import '../models/bingo_game.dart';

class BingoProvider with ChangeNotifier {
  BingoGame _bingoGame = BingoGame.newInstance();

  String get prev0 => _bingoGame.prev0;
  String get prev1 => _bingoGame.prev1;
  String get prev2 => _bingoGame.prev2;
  bool get lostConnection => _bingoGame.pairing && _bingoGame.connected; // These are not
  bool get isLocalGame => !_bingoGame.pairing && !_bingoGame.connected; // opposites.
  List<int> get knockCode => _bingoGame.knockCode;

  /// starts a new game from the beginning and updates the db if necessary
  void resetGame() {
    _bingoGame = _bingoGame.resetGame();
    // if both pairing and connected are true, this means we are waiting for
    // the secondary device to give us up-to-date data (have a connected TV, but
    // are attempting to reconnect with it) and should not override it.
    if (_bingoGame.pairing ^ _bingoGame.connected) {
      BingoService.updateDB(_bingoGame, true);
    }
    notifyListeners();
  }

  /// used to increment (or decrement the current number by 1. Also updates the
  /// db if necessary.
  void incrementNumber(bool increment) {
    int newIndex = _bingoGame.index + (increment ? 1 : -1);
    // verify that we are not trying to go to far forward or backward
    if (!_bingoGame.indexIsValid(newIndex)) return;
    _bingoGame = _bingoGame.copyWith(index: newIndex);
    // see resetGame comment for if statement reasoning.
    if (_bingoGame.pairing ^ _bingoGame.connected) {
      BingoService.updateDB(_bingoGame,true);
    }
    notifyListeners();
  }

  /// Callback for when the db detects an update to our bingo game from the
  /// secondary device.
  void onBingoGame(BingoGame bingoGame) {
    _bingoGame = bingoGame;
    notifyListeners();
  }

  /// turns off pairing/connected and also deletes game instance in db.
  void stopConnection() {
    _bingoGame = _bingoGame.copyWith(pairing: false, connected: false);
    BingoService.stopGame(_bingoGame);
    notifyListeners();
  }

  /// enables pairing and creates game instance in db.
  void startConnection() {
    _bingoGame = _bingoGame.copyWith(pairing: true, connected: false, priority: 0);
    BingoService.startGame(_bingoGame, onBingoGame);
    notifyListeners();
  }

  /// deletes game instance in db (if exists). If no connection has been made
  /// since pairing initiated, turns off pairing. Otherwise, leaves
  /// pairing/connected settings as they are.
  void pauseConnection() {
    if (_bingoGame.pairing && !_bingoGame.connected) {
      stopConnection();
    } else if (_bingoGame.connected) {
      BingoService.stopGame(_bingoGame);
    }
    notifyListeners();
  }

  /// if was previously connected to secondary device, re-enables pairing and
  /// gives data priority to that secondary device in the re-created database information.
  void resumeConnection() {
    if (_bingoGame.connected) {
      _bingoGame = _bingoGame.copyWith(priority: 1, pairing: true);
      BingoService.startGame(_bingoGame, onBingoGame);
    }
    notifyListeners();
  }
}