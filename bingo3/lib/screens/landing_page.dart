import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/leaderboard_provider.dart';
import 'auth_page.dart';
import 'bingo_page.dart';

// For identifying if the user needs to log in first
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final signedInMode = context.watch<LeaderboardProvider>().signedInMode;
    return StreamBuilder<User?>( // https://codewithandrea.com/articles/simple-authentication-flow-with-flutter/
      stream: FirebaseAuth.instance
          .authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user != null) {
            context.read<LeaderboardProvider>().setSignedIn(
              signedInMode: true,
              userEmail: user.email,
              refresh: false,
            );
          }
          if (user == null && signedInMode == null) return const AuthPage();
          return const BingoPage();
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}