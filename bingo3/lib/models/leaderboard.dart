import 'package:bingo3/models/player.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'leaderboard.mapper.dart';

@MappableClass()
class Leaderboard with LeaderboardMappable {
  final String owner;
  final List<String> hasAccess;
  final List<Player> players;
  String name;

  Leaderboard({
    required this.owner,
    required this.hasAccess,
    required this.players,
    required this.name,
  });

  // links deserialization factories from the generated [BingoGameMapper] class
  static final fromMap = LeaderboardMapper.fromMap;
  static final fromJson = LeaderboardMapper.fromJson;

  get numberOfPeople => players.length;
}