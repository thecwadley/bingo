import 'package:flutter/material.dart';

import '../models/leaderboard.dart';
import '../models/player.dart';
import '../models/win.dart';

class LeaderboardPage extends StatefulWidget {
  final Leaderboard leaderboard;

  LeaderboardPage({required this.leaderboard});

  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  String? expandedPlayerName;

  @override
  Widget build(BuildContext context) {
    // Sort players by number of wins
    List<Player> sortedPlayers = List.from(widget.leaderboard.players)
      ..sort((a, b) => b.wins.length.compareTo(a.wins.length));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.leaderboard.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: sortedPlayers.length,
              itemBuilder: (context, index) {
                final player = sortedPlayers[index];
                final isExpanded = expandedPlayerName == player.name;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(player.name),
                      trailing: Text("${player.wins.length} Wins"),
                      onTap: () {
                        setState(() {
                          expandedPlayerName = isExpanded ? null : player.name;
                        });
                      },
                    ),
                    if (isExpanded) _buildWinList(player.wins),
                    Divider(color: Colors.grey),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Take Attendance"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Record Bingo Win"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWinList(List<Win> wins) {
    // Sort wins by date and group by date
    wins.sort((a, b) => a.date.compareTo(b.date));
    Map<DateTime, List<Win>> winsByDate = {};

    for (var win in wins) {
      final date = DateTime(win.date.year, win.date.month, win.date.day);
      if (!winsByDate.containsKey(date)) {
        winsByDate[date] = [];
      }
      winsByDate[date]!.add(win);
    }

    return Padding(
      padding: const EdgeInsets.only(left: 48.0, right: 16.0),
      child: Column(
        children: winsByDate.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: Colors.grey),
              ...entry.value.map((win) {
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  title: Text("${win.date.toLocal()}".split(' ')[0]),
                  trailing: Text(win.winType ?? ""),
                );
              }).toList(),
            ],
          );
        }).toList(),
      ),
    );
  }
}
