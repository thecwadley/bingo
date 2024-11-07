import 'package:bingo3/providers/bingo_provider.dart';
import 'package:bingo3/providers/leaderboard_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/landing_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp( // Manual initialization for windows
      name: "bingo v3",
      options: const FirebaseOptions(
        apiKey: "AIzaSyC3L_KCHm96PzEpAos5L5fteqwiKZyW6IQ",
        appId: "1:1010019863680:web:361804577eec4ffeec2a65",
        messagingSenderId: "1010019863680",
        projectId: "bingo-75d49",
      ),
    );
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BingoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LeaderboardProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Bingo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LandingPage(),
      ),
    ),
  );
}