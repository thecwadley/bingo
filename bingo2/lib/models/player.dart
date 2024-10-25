import 'package:bingo2/models/win.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class Player {
  final String _name;
  final List<String> _aliases;
  final List<DateTime> _attended;
  final List<Win> _wins;
  final String _uuid;

  String get name => _name;
  List<String> get aliases => _aliases;
  List<DateTime> get attended => _attended;
  List<Win> get wins => _wins;
  String get uuid => _uuid;

  Player({
    required String name,
    List<String>? aliases,
    List<DateTime>? attended,
    List<Win>? wins,
    String? uuid,
  }) : _name = name,
    _aliases = aliases ?? [],
    _attended = attended ?? [],
    _wins = wins ?? [],
    _uuid = uuid ?? const Uuid().v4();

  Player copyWith({
    String? name,
    List<String>? aliases,
    List<DateTime>? attended,
    List<Win>? wins,
  }) {
    return Player(
      name: name ?? _name,
      aliases: aliases ?? _aliases,
      attended: attended ?? _attended,
      wins: wins ?? _wins,
    );
  }

  Player copyWithNewAttendance(DateTime dateTime) {
    List<DateTime> attended = _attended;
    attended.add(dateTime);
    return copyWith(attended: attended);
  }

  @override
  // TODO: implement hashCode
  int get hashCode => Object.hash(_name, _aliases, _attended, _wins);

  @override
  bool operator ==(Object other) =>
      other is Player
          && other.name == _name
          && listEquals(other.aliases, _aliases)
          && listEquals(other.attended, _attended)
          && listEquals(other.wins, _wins);

  bool nameContains(String search) {
    for (String alias in _aliases) {
      if (alias.contains(search)) return true;
    }
    return _name.contains(search);
  }

  Player copyWithNewWin(Win win) {
    List<Win> wins = _wins;
    wins.add(win);
    return copyWith(wins: wins);
  }
}