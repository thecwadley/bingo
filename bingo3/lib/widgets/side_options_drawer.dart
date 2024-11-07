import 'dart:ui';

import 'package:bingo3/screens/bingo_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bingo_provider.dart';
import '../providers/leaderboard_provider.dart';
import '../screens/auth_page.dart';
import '../screens/manage_leaderboards_page.dart';
import '../services/auth_service.dart';
import 'knock_code_display.dart';

class SideOptionsDrawer extends StatelessWidget {
  const SideOptionsDrawer({
    super.key,
    required this.isLocalGame,
    required this.isSignedIn,
    required this.knockCode,
  });

  final bool isLocalGame;
  final bool? isSignedIn;
  final List<int> knockCode;
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            title: const Text('Play Bingo'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const BingoPage()));
            },
          ),
          ListTile(
            title: const Text('Pair Roku TV'),
            onTap: () {
              context.read<BingoProvider>().startConnection();
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(minutes: 3),
                    backgroundColor: Colors.black,
                    content: KnockCodeDisplay(knockCode: knockCode),
                  )
              );
            },
          ),
          if (!isLocalGame) ListTile(
            title: const Text('Unpair Roku TV'),
            onTap: () {
              context.read<BingoProvider>().stopConnection();
            },
          ),
          if (isSignedIn == true) ListTile(
            title: const Text('Manage Leaderboards'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const ManageLeaderboardsPage()));
            },
          ),
          if (isSignedIn == true) ListTile(
            title: const Text('Take Attendance'),
            onTap: () {},
          ),
          if (isSignedIn == true) ListTile(
            title: const Text('Add a Bingo'),
            onTap: () {},
          ),
          if (isSignedIn == true) ListTile(
            title: const Text('Sign Out'),
            onTap: () {
              context.read<LeaderboardProvider>().setSignedIn(signedInMode: null);
              AuthService().signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const AuthPage()));
            },
          ),
          if (isSignedIn != true) ListTile(
            title: const Text('Sign In'),
            onTap: () {
              context.read<LeaderboardProvider>().setSignedIn(signedInMode: null);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const AuthPage()));
            },
          ),
        ],
      ),
    );
  }
}