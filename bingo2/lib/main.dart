import 'package:bingo2/firebase/bingo_repository_old.dart';
import 'package:bingo2/landing_page.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase/firebase_options.dart';

import 'bingo_page.dart';
import 'login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( // Manual initialization for windows
    options: const FirebaseOptions(
      apiKey: "AIzaSyC3L_KCHm96PzEpAos5L5fteqwiKZyW6IQ",
      appId: "1:1010019863680:web:e52a8d9f3d9fddcdec2a65",
      messagingSenderId: "1010019863680",
      projectId: "bingo-75d49",
    ),
  );

  runApp(
    MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => BingoService(),
        child: const LandingPage(),
      )
    ),
  );
}