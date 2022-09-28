import 'package:flutter/material.dart';
import 'package:quizo/utilities/colors.dart';
import 'package:quizo/utilities/device_size.dart';
import 'package:quizo/utilities/my_own_widget.dart';
import 'package:quizo/utilities/theme.dart';

class QuizoMainScreen extends StatelessWidget {
  const QuizoMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);

    return Scaffold(
      backgroundColor: backGroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Takes twice space compared to others
            Expanded(
              flex: 2,
              child: Container(),
            ),
            // Image Contaniner
            Image.asset(
              'images/question.png',
              width: 200,
            ),
            // The Space between Image and title
            const SizedBox(
              height: 15,
            ),
            headlineLarge('پرسیار و وەڵام', checkHeight(context, 0.045), textInActiveColor),
            // Space between text and image and button
            Expanded(child: Container()),
            // The button using a container and gesture detector
            buttonRounded(
              title: 'دەسپێكردن',
              color: buttonActiveColor,
              onTap: () {
                Navigator.pushNamed(context, '/questionScreen');
              },
            ),
            // Space between button and bottom of the container
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
