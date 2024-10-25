import 'package:flutter/foundation.dart';

enum WinType {
  vertical,
  horizontal,
  diagonal,
  fourCorners,
  blackout,
}

class Win {
  final DateTime _date;
  final WinType? _winType;
  final List<int>? _bingoSquares;

  DateTime get date => _date;
  WinType? get winType => _winType;
  List<int>? get bingoSquares => _bingoSquares;




  Win({
    DateTime? date,
    WinType? winType,
    List<int>? bingoSquares,
  }) : _date = date ?? DateTime.now(),
    _winType = winType,
    _bingoSquares = bingoSquares;

  copyWith({
    DateTime? date,
    WinType? winType,
    List<int>? bingoSquares,
  }) {
    return Win(
      date: date ?? _date,
      winType: winType ?? _winType,
      bingoSquares: bingoSquares ?? _bingoSquares,
    );
  }

  @override
  // TODO: implement hashCode
  int get hashCode => Object.hash(_date, _winType, _bingoSquares);

  @override
  bool operator ==(Object other) =>
      other is Win
          && other.date == _date
          && other.winType == _winType
          && listEquals(other.bingoSquares, _bingoSquares);
}