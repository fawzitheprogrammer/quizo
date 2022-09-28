import 'package:flutter/material.dart';
import 'package:quizo/screens/quizo_questionscreen.dart';
import 'package:quizo/screens/quizo_timeoutscreen.dart';
import 'screens/quizo_mainscreen.dart';

void main() {
  runApp(const Quizo());
}

class Quizo extends StatelessWidget {
  const Quizo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const QuizoMainScreen(),
      routes: {
        '/mainScreen': ((context) => const Quizo()),
        '/questionScreen': (context) => const QuzioQuestoionScreen(),
        '/timeoutscreeen': (context) => const QuizoTimeoutScreen()
      },
    );
  }
}
