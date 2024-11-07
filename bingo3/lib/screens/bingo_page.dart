import 'package:bingo3/providers/bingo_provider.dart';
import 'package:bingo3/providers/leaderboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/knock_code_display.dart';
import '../widgets/side_options_drawer.dart';

class BingoPage extends StatefulWidget {
  const BingoPage({super.key});

  @override
  State<BingoPage> createState() => _BingoPageState();
}

class _BingoPageState extends State<BingoPage> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (AppLifecycleState.inactive == state) {
      context.read<BingoProvider>().pauseConnection();
    } else if (AppLifecycleState.resumed == state) {
      context.read<BingoProvider>().resumeConnection();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prev0 = context.watch<BingoProvider>().prev0;
    final prev1 = context.watch<BingoProvider>().prev1;
    final prev2 = context.watch<BingoProvider>().prev2;
    final lostConnection = context.watch<BingoProvider>().lostConnection;
    final isLocalGame = context.watch<BingoProvider>().isLocalGame;
    final isSignedIn = context.watch<LeaderboardProvider>().signedInMode;
    final knockCode = context.watch<BingoProvider>().knockCode;

    return Scaffold(
      appBar: AppBar(),
      drawer: SideOptionsDrawer(
        isLocalGame: isLocalGame,
        isSignedIn: isSignedIn,
        knockCode: knockCode,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!lostConnection) ... [
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  context.read<BingoProvider>().incrementNumber(true);
                },
                child: SizedBox.expand(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        prev2,
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        prev1,
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        prev0,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<BingoProvider>().incrementNumber(false);
                    },
                    child: const Text("Past Numbers"),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<BingoProvider>().resetGame();
                      },
                      child: const Text("Restart"),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<BingoProvider>().incrementNumber(true);
                    },
                    child: const Text("Next Number"),
                  ),
                ],
              ),
            ),
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: Colors.black,
                    size: 40,
                  ),
                  Text(
                    "Record a win",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ] else Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    child: Text("Attempting to reach TV..."),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<BingoProvider>().stopConnection();
                          },
                          child: const Text("Unpair"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<BingoProvider>().stopConnection();
                            context.read<BingoProvider>().startConnection();
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: const Duration(minutes: 3),
                                  backgroundColor: Colors.black,
                                  content: KnockCodeDisplay(knockCode: knockCode,),
                                )
                            );
                          },
                          child: const Text("Re-Pair"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}