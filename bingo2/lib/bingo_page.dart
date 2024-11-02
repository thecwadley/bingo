import 'dart:math';
import 'dart:ui';

import 'package:bingo2/firebase/bingo_repository_old.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BingoPage extends StatefulWidget {
  const BingoPage({super.key});

  @override
  State<BingoPage> createState() => _BingoPageState();
}

class _BingoPageState extends State<BingoPage> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(),
    );
  }
}
