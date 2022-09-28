import 'package:flutter/material.dart';
import 'package:quizo/utilities/device_size.dart';
import 'package:quizo/utilities/theme.dart';

Widget buttonRounded(
    {required String title, required VoidCallback onTap, required color}) {
  return StatefulBuilder(
    builder: ((context, setState) => GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              alignment: Alignment.center,
              width: checkWidth(context, 0.45),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(50),
              ),
              child: bodyTextLight(
                  title, checkHeight(context, 0.024), Colors.white),
            ),
          ),
        )),
  );
}

