import 'package:bingo3/models/win.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'player.mapper.dart';

@MappableClass()
class Player with PlayerMappable {
  final String name;
  final List<String> aliases;
  final List<DateTime> attended;
  final List<Win> wins;

  Player({
    required this.name,
    required this.aliases,
    required this.attended,
    required this.wins,
  });

  // links deserialization factories from the generated [BingoGameMapper] class
  static final fromMap = PlayerMapper.fromMap;
  static final fromJson = PlayerMapper.fromJson;
}