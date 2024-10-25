import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class Caller {
  final String _uid;
  final String _email;
  final List<String> _leaderboards;

  String get uid => _uid;
  String get email => _email;
  List<String> get leaderboards => _leaderboards;

  Caller({
    String? uid,
    String? email,
    List<String>? leaderboards,
  }) : _uid = uid ?? const Uuid().v4(),
    _email = email ?? "",
    _leaderboards = leaderboards ?? [];

  copyWith({
    String? uid,
    String? email,
    List<String>? leaderboards,
  }) {
    return Caller(
      uid: uid ?? _uid,
      email: email ?? _email,
      leaderboards: leaderboards ?? _leaderboards,
    );
  }

  @override
  // TODO: implement hashCode
  int get hashCode => Object.hash(_uid, _email, leaderboards);

  @override
  bool operator ==(Object other) =>
      other is Caller
          && other.uid == _uid
          && other.email == email
          && listEquals(other.leaderboards, _leaderboards);
}