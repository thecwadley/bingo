import 'package:dart_mappable/dart_mappable.dart';

part 'win.mapper.dart';

@MappableClass()
class Win with WinMappable {
  final DateTime date;
  final String? winType;
  final List<int>? bingoSquares;
  final int? roundNumber;

  Win({
    required this.date,
    this.winType,
    this.bingoSquares,
    this.roundNumber
  });

  // links deserialization factories from the generated [BingoGameMapper] class
  static final fromMap = WinMapper.fromMap;
  static final fromJson = WinMapper.fromJson;
}