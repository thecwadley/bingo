import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/bingo_game.dart';
import 'package:firebase_database/firebase_database.dart';

class BingoService {
  /// starts and sets an instance in the database, and assigns a callback for
  /// changes to the database.
  static Future<void> startGame(BingoGame bingoGame, void Function(BingoGame bingoGame) updateBingoGame) async {
    final ref = FirebaseDatabase.instance.ref("games/${bingoGame.knockCode.join()}");
    updateDB(bingoGame, true);
    ref.onValue.listen((DatabaseEvent event) {
      onUpdate(event, updateBingoGame);
    });
  }

  /// removes a game instance from the database.
  static Future<void> stopGame(BingoGame bingoGame) async {
    final ref = FirebaseDatabase.instance.ref("games/${bingoGame.knockCode.join()}");
    ref.remove();
  }

  /// updates the data for a game instance in the database. does not save numbers
  /// list if removeNumbers is set to true (if game should depend on seed. most
  /// of the time should be true)
  static void updateDB(BingoGame bingoGame, bool removeNumbers) {
    if (bingoGame.pairing || bingoGame.connected) {
      final ref = FirebaseDatabase.instance.ref("games/${bingoGame.knockCode.join()}");
      Map<String, dynamic> bingoGameAsMap = bingoGame.toMap();
      if (bingoGameAsMap.containsKey("numbers") && removeNumbers) {
        bingoGameAsMap.remove("numbers");
      }
      ref.set(bingoGameAsMap).then((_) {
        // TODO: currently nothing needed to do on success. Should probably change later.
      }).catchError((error) {
        if (kDebugMode) {
          print(error);
        }
      });
    }
  }

  /// When data is updated, converts data to BingoGame and calls callback.
  static void onUpdate(DatabaseEvent event, void Function(BingoGame bingoGame) updateBingoGame) {
    if (event.snapshot.value == null) return;
    BingoGame bingoGame = BingoGame.fromJson(jsonEncode(event.snapshot.value));
    updateBingoGame(bingoGame);
  }
}