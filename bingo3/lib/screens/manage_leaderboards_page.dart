import 'package:bingo3/models/player.dart';
import 'package:bingo3/models/win.dart';
import 'package:bingo3/screens/leaderboard_page.dart';
import 'package:bingo3/widgets/side_options_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/leaderboard.dart';
import '../providers/bingo_provider.dart';
import '../providers/leaderboard_provider.dart';

class ManageLeaderboardsPage extends StatefulWidget {
  const ManageLeaderboardsPage({super.key});

  @override
  ManageLeaderboardsPageState createState() => ManageLeaderboardsPageState();
}

class ManageLeaderboardsPageState extends State<ManageLeaderboardsPage> {
  void _showDeleteConfirmationDialog({
    required BuildContext context,
    required Leaderboard leaderboard,
    required String callerEmail,
    required VoidCallback onDeleteConfirm,
    required void Function(String newEmail) onTransferConfirm,
  })
  {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete Leaderboard"),
          content: Text("Are you sure you want to remove '${leaderboard.name}' "
              "from your leaderboards? ${(callerEmail != leaderboard.owner) ? "Others"
              " will still be able to view this board." : "You are the owner, so "
              "nobody else will be able to view this board."}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text("Cancel"),
            ),
            if (callerEmail == leaderboard.owner) TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                _showTransferOwnerDialog(
                  context: context,
                  leaderboard: leaderboard,
                  onTransferConfirm: onTransferConfirm,
                );
              },
              child: const Text("Transfer Ownership"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                onDeleteConfirm(); // Call the onConfirm callback if confirmed
              },
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showTransferOwnerDialog({
    required BuildContext context,
    required Leaderboard leaderboard,
    required void Function(String newEmail) onTransferConfirm,
  })
  {
    String newEmail = "";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Transfer leaderboard to:"),
          content: TextField(
            decoration: const InputDecoration(labelText: "User email"),
            onChanged: (value) {
              newEmail = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (newEmail.isNotEmpty) {
                  onTransferConfirm(newEmail);
                }
              },
              child: const Text("Transfer"),
            ),
          ],
        );
      },
    );
  }

  void _showAddLeaderboardDialog({
    required String callerEmail,
    required void Function(String newName) onAddConfirm,
  })
  {
    String newName = "";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Create New Leaderboard"),
          content: TextField(
            decoration: const InputDecoration(labelText: "Leaderboard Name"),
            onChanged: (value) {
              newName = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (newName.isNotEmpty) {
                  onAddConfirm(newName);
                }
              },
              child: const Text("Create"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String callerEmail = context.watch<LeaderboardProvider>().userEmail ?? "";
    List<Leaderboard> leaderboards = context.watch<LeaderboardProvider>().leaderboards;

    final isLocalGame = context.watch<BingoProvider>().isLocalGame;
    final isSignedIn = context.watch<LeaderboardProvider>().signedInMode;
    final knockCode = context.watch<BingoProvider>().knockCode;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Leaderboards"),
      ),
      drawer: SideOptionsDrawer(
        isLocalGame: isLocalGame,
        isSignedIn: isSignedIn,
        knockCode: knockCode,
      ),
      body: leaderboards.isEmpty
          ? const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Nothing to see here! Let's try creating a leaderboard.",
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      )
          : ListView.builder(
        itemCount: leaderboards.length,
        itemBuilder: (context, index) {
          final leaderboard = leaderboards[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>
                      LeaderboardPage(leaderboard: leaderboard)));
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(leaderboard.name),
                subtitle: Text("${leaderboard.numberOfPeople} Players"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _showDeleteConfirmationDialog(
                      context: context,
                      leaderboard: leaderboard,
                      callerEmail: callerEmail,
                      onDeleteConfirm: () {
                        context.read<LeaderboardProvider>()
                            .removeLeaderboard(leaderboard);
                      },
                      onTransferConfirm: (String newEmail) {
                        context.read<LeaderboardProvider>()
                            .transferLeaderboard(leaderboard, newEmail);
                      },
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddLeaderboardDialog(
            callerEmail: callerEmail,
            onAddConfirm: (String newName) {
              context.read<LeaderboardProvider>().addLeaderboard(callerEmail, newName);
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
