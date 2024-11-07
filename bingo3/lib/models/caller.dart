import 'package:dart_mappable/dart_mappable.dart';

part 'caller.mapper.dart';

@MappableClass()
class Caller with CallerMappable {
  final String email;
  final List<String> leaderboards;

  Caller({
    required this.email,
    required this.leaderboards,
  });

  // links deserialization factories from the generated [BingoGameMapper] class
  static final fromMap = CallerMapper.fromMap;
  static final fromJson = CallerMapper.fromJson;
}