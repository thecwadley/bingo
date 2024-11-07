import 'package:flutter/cupertino.dart';

import '../models/leaderboard.dart';
import '../models/player.dart';
import '../models/win.dart';

class LeaderboardProvider with ChangeNotifier {
  bool? signedInMode;
  List<Leaderboard> leaderboards = [
    Leaderboard(
      owner: "test2@example.com",
      hasAccess: [],
      players: [
        Player(
          name: "ellie",
          aliases: ["el"],
          attended: [],
          wins: [
            Win(
              date: DateTime(2024, 11, 3),
              winType: "Vertical",
            ),
            Win(
              date: DateTime(2024, 11, 3),
              winType: "Blackout",
            ),
            Win(
              date: DateTime(2024, 11, 2),
              winType: "Horizontal",
            ),
          ],
        ),
        Player(
          name: "stephen",
          aliases: ["steve", "idio"],
          attended: [],
          wins: [
            Win(
              date: DateTime(2024, 10, 10),
              winType: "Blackout",
            ),
            Win(
              date: DateTime(2024, 11, 3),
              winType: "Vertical",
            ),
            Win(
              date: DateTime(2024, 11, 2),
              winType: "Horizontal",
            ),
            Win(
              date: DateTime(2024, 11, 2),
              winType: "Diagonal",
            ),
          ],
        ),
        Player(
          name: "carlos",
          aliases: ["carl"],
          attended: [],
          wins: [],
        ),
      ],
      name: "example leaderboard",
    )
  ];
  String? userEmail;

  /// toggles between guest mode, user mode, or null sign-in status.
  /// signedInMode = false indicates guest mode. true indicates user mode.
  /// If not signedInMode != true, user is unable to access leaderboards.
  void setSignedIn({bool? signedInMode, String? userEmail, bool refresh = true}) {
    this.signedInMode = signedInMode;
    this.userEmail = userEmail;
    if (refresh) notifyListeners();
  }

  /// allows user to create new leaderboard
  void addLeaderboard(String owner, String name) {
    if (signedInMode == true) {
      leaderboards.add(
        Leaderboard(
          owner: owner,
          hasAccess: [],
          players: [],
          name: name,
        ),
      );
    }
    notifyListeners();
  }

  /// removes leaderboard. Either deletes it, if user is owner, or unshares
  /// leaderboard with user.
  void removeLeaderboard(Leaderboard leaderboard) {
    if (signedInMode == true) {
      leaderboards.remove(leaderboard);
      notifyListeners();
    }
  }

  void transferLeaderboard(Leaderboard leaderboard, String newEmail) {
    if (signedInMode == true) {
      leaderboards.remove(leaderboard);
      leaderboard = leaderboard.copyWith(owner: newEmail);
      leaderboards.add(leaderboard);
      notifyListeners();
      // TODO: add check for if new email is a valid user in the database
    }
  }
}