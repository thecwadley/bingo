import 'package:bingo2/models/player.dart';
import 'package:bingo2/models/win.dart';
import 'package:flutter/foundation.dart';

import 'caller.dart';

class Leaderboard {
  final Caller? _owner;
  final List<Caller> _hasAccess;
  final List<Player> _players;

  Caller? get owner => _owner;
  List<Caller> get hasAccess => _hasAccess;
  List<Player> get players => _players;

  Leaderboard({
    Caller? owner,
    List<Caller>? hasAccess,
    List<Player>? players,
  }) : _owner = owner,
    _hasAccess = hasAccess ?? [],
    _players = players ?? [];

  copyWith({
    Caller? owner,
    List<Caller>? hasAccess,
    List<Player>? players,
  }) {
    return Leaderboard(
      owner: owner ?? _owner,
      hasAccess: hasAccess ?? _hasAccess,
      players: players ?? _players,
    );
  }

  @override
  // TODO: implement hashCode
  int get hashCode => Object.hash(_owner, _hasAccess, _players);

  @override
  bool operator ==(Object other) =>
      other is Leaderboard
          && other.owner == _owner
          && listEquals(other.hasAccess, _hasAccess)
          && listEquals(other.players, _players);

  List<Player> searchPlayers(String search) {
    List<Player> results = [];
    for (Player player in _players) {
      if (player.nameContains(search)) results.add(player);
    }
    return results;
  }

  Leaderboard copyWithNewWin(Player player, Win win) {
    List<Player> players = _players;
    if (players.contains(player)) players.remove(player);
    player = player.copyWithNewWin(win);
    players.add(player);
    return copyWith(players: players);
  }

  Leaderboard copyWithAttendance(List<Player> present) {
    List<Player> players = _players;
    DateTime today = DateTime.now();
    for (Player player in present) {
      if (_players.contains(player)) {
        players.remove(player);
      }
      players.add(player.copyWithNewAttendance(today));
    }
    return copyWith(players: players);
  }
}