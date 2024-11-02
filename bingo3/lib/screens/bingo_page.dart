import 'dart:io';
import 'dart:ui';

import 'package:bingo3/providers/bingo_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BingoPage extends StatefulWidget {
  const BingoPage({super.key});

  @override
  State<BingoPage> createState() => _BingoPageState();
}

class _BingoPageState extends State<BingoPage> with WidgetsBindingObserver {
  IconData intToArrowIcon(int code) {
    switch (code) {
      case 0: return Icons.arrow_back_rounded;
      case 1: return Icons.arrow_upward_rounded;
      case 2: return Icons.arrow_forward_rounded;
      default: return Icons.arrow_downward_rounded;
    }
  }

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
    final knockCode = context.watch<BingoProvider>().knockCode;

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const NetworkImage("https://static3.depositphotos.com/1005547/235/i/450/depositphotos_2357114-stock-photo-bingo-ball-background.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                ),
                color: Colors.blue,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: const Text(
                  "Bingo Manager",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Play Round'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Pair Roku TV'),
              onTap: () {
                context.read<BingoProvider>().startConnection();
                Navigator.pop(context);
                showKnockCode(context, knockCode);
              },
            ),
            if (!isLocalGame) ListTile(
              title: const Text('Unpair Roku TV'),
              onTap: () {
                context.read<BingoProvider>().stopConnection();
              },
            ),
            ListTile(
              title: const Text('Manage Leaderboards'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Take Attendance'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Add a Bingo'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Sign Out'),
              onTap: () {},
            ),
          ],
        ),
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
                            print(knockCode);
                            showKnockCode(context, knockCode);
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

  void showKnockCode(BuildContext context, List<int> knockCode) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(minutes: 3),
          backgroundColor: Colors.black,
          content: Center(
            child: SizedBox(
              height: 200, // Set the height for the horizontal list
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0,0,0,20.0),
                    child: Text(
                      "(1) Open the PlayBingo app on your Roku TV.\n(2) Press the menu/star (*) button on your Roku remote.\n(3) Enter the following combination using the arrow keys:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int code in knockCode) Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(
                          intToArrowIcon(code),
                          size: 20, // Set icon size
                          color: Colors.white, // You can customize the color
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}