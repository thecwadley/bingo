import 'package:flutter/material.dart';

class KnockCodeDisplay extends StatelessWidget {
  const KnockCodeDisplay({
    super.key,
    required this.knockCode,
  });

  final List<int> knockCode;

  IconData intToArrowIcon(int code) {
    switch (code) {
      case 0: return Icons.arrow_back_rounded;
      case 1: return Icons.arrow_upward_rounded;
      case 2: return Icons.arrow_forward_rounded;
      default: return Icons.arrow_downward_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
                    //intToArrowIcon(code),
                    size: 20, // Set icon size
                    color: Colors.white, // You can customize the color
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}