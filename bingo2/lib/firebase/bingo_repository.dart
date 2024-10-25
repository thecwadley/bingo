import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

import '../models/bingo.dart';
import 'package:flutter/foundation.dart';

class BingoRepository with ChangeNotifier {
  Bingo _bingo = Bingo();
  DatabaseReference? ref;
  bool _isSyncing = false;
  bool _isLoaded = true;

  String get prev0 => _bingo.prev0;
  String get prev1 => _bingo.prev1;
  String get prev2 => _bingo.prev2;
  bool get isSyncing => _isSyncing;
  bool get isLoaded => _isLoaded && _bingo.playable;

  BingoRepository();

  void hideBingo() {
    print("is syncing: $_isSyncing");
    if (_isSyncing) {
      _bingo = _bingo.markUnplayable();
      _isLoaded = false;
      pauseDatabase();
      notifyListeners();
    }
  }

  void showBingo(List<int> knockCode) {
    if (_isSyncing) {
      resumeDatabase(knockCode);
      updateDatabase("roku");
    }
  }

  void resetBingo() {
    _bingo = Bingo();
    updateDatabase("phone");
    notifyListeners();
  }

  void incrementBingo() {
    _bingo = _bingo.copyWith(_bingo.index + 1);
    updateDatabase("phone");
    notifyListeners();
  }

  void decrementBingo() {
    _bingo = _bingo.copyWith(_bingo.index - 1);
    updateDatabase("phone");
    notifyListeners();
  }

  void _setBingo(int index, List<int>? numbers) {
    if (numbers == null) {
      _bingo = _bingo.copyWith(index);
    } else {
      _bingo = Bingo(
        index: index,
        numbers: numbers,
      );
    }
    updateDatabase("phone");
    notifyListeners();
  }

  void updateDatabase(String priority) async {
    final ref = this.ref;
    if (ref != null) {
      Map<String, dynamic> bingoJson = _bingo.asSimpleJson();
      if (priority == "roku") {
        bingoJson["index"] = -1;
        bingoJson["numbers"] = [-1];
      }
      await ref.set(bingoJson).then((_) {
        print("success");
      }).catchError((error) {
        print(error);
      });
    }
  }

  Future<void> resumeDatabase(List<int> knockCode) async {
    final ref = FirebaseDatabase.instance.ref("games/${knockCode.join()}");
    this.ref = ref;
    ref.onValue.listen((DatabaseEvent event) {
      _isLoaded = true;
      if (event.snapshot.value == null) return;
      Map<String, dynamic>? data = (event.snapshot.value as Map<Object?, Object?>).map(
            (key, value) => MapEntry(key as String, value as dynamic),
      );
      if (data.containsKey("index") && data.containsKey("numbers")) {
        List<int> safeNumbers = [];
        for (dynamic element in data["numbers"]) {
          if (element is int) safeNumbers.add(element);
        }
        _setBingo(data["index"] as int, safeNumbers);
      }
    });
  }

  Future<void> startDatabase(List<int> knockCode) async {
    _isSyncing = true;
    resumeDatabase(knockCode);
    updateDatabase("phone");
    notifyListeners();
  }

  Future<void> pauseDatabase() async {
    if (ref != null) {
      ref!.remove();
      ref = null;
    }
  }

  Future<void> stopDatabase() async {
    _isSyncing = false;
    pauseDatabase();
    notifyListeners();
  }
}