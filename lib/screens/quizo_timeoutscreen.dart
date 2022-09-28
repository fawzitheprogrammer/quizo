import 'package:flutter/material.dart';
import 'package:quizo/utilities/colors.dart';
import 'package:quizo/utilities/device_size.dart';
import 'package:quizo/utilities/my_own_widget.dart';
import 'package:quizo/utilities/theme.dart';

class QuizoTimeoutScreen extends StatelessWidget {
  const QuizoTimeoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Icon(
              Icons.timer_off_rounded,
              color: errorColor.withOpacity(0.9),
              size: 100,
            ),
            headlineLarge(
                'كات تەواو بوو', checkHeight(context, 0.045), textInActiveColor),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            buttonRounded(
              title: 'دووبارە كردنەوە',
              color: buttonActiveColor,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/questionScreen', (route) => false);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/mainScreen', (route) => false);
              },
              child: bodyTextLight(
                  'ماڵەوە', checkHeight(context, 0.024), Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
