import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:quizo/models/question_list.dart';
import 'package:quizo/utilities/colors.dart';
import 'package:quizo/utilities/my_own_widget.dart';
import 'package:quizo/utilities/theme.dart';
import '../utilities/device_size.dart';

// Question Model object
QuestionModel questionModel = QuestionModel();

class QuzioQuestoionScreen extends StatefulWidget {
  const QuzioQuestoionScreen({Key? key}) : super(key: key);

  @override
  State<QuzioQuestoionScreen> createState() => _QuzioQuestoionScreenState();
}

class _QuzioQuestoionScreenState extends State<QuzioQuestoionScreen> {
  // User time variable
  double _tickerLength = 30;
  // Timer indicator that increases
  double _tickerLengthController = 0.0;
  // Timer class object
  Timer? _timer;
  // Selected item indicator
  int? tappedIndex;
  // User answer
  String? userAnswer;
  // User score list
  List<Icon> userScoreTracker = [];
  // User score
  int userScore = 0;

  // Timer that controlls users time
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        // as long as _tickerLength is greater than 0
        // _tickerLength will decrease by one repeatedlly
        if (_tickerLength > 0) {
          _tickerLength--;
          // the value of slider that increases on each second
          // decreased of user time
          _tickerLengthController += 0.0333;
        } else {
          // when [_tickerLength] is equal to 0
          // this code gets executed to
          // cancel the timer not to loop
          // and then display timeout screen
          _timer!.cancel();
          Navigator.pushNamedAndRemoveUntil(
              context, '/timeoutscreeen', (route) => false);
        }
      });
    });
  }

  // Checks if the user is finished or not
  void checkIfUserIsFinished(String userChoice) {
    setState(() {
      if (questionModel.isUserFinished() == true) {
        _timer!.cancel();
        checkAnswer(userChoice);
        showDialog(
            context: context,
            builder: (context) {
              return buildDialog();
            });
      } else {
        checkAnswer(userChoice);
        questionModel.goToNextQuestion();
      }
    });
  }

  // Checks user selected answer
  // and comparing to correctAnswer
  void checkAnswer(String userChoice) {
    // Fetching correct answers
    String correctAnswer = questionModel.getCorrectAnswer();
    // Comparing userChoice to correct answer
    if (userChoice == correctAnswer) {
      // Increase userScore by 1 if true
      userScore++;
      // Add an icon check if true
      userScoreTracker.add(const Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      // Add an icon cross if false
      userScoreTracker.add(const Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
  }

  // As soon as user enters questions screen
  // the time gets started
  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  // Disposing _timer to avoid memory leaking
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Time indicator widget at the top
            buildTimeIndicator(),
            // Question text like number of question and the question
            buildQuestionText(),
            // Options
            buildOptions()
          ],
        ),
      ),
    );
  }

  Widget buildOptions() {
    return SizedBox(
      height: checkHeight(context, 0.45),
      child: Column(
        children: [
          Column(
            children: List.generate(
              questionModel.getQuestionOptions().length,
              (index) => GestureDetector(
                onTap: () {
                  tappedIndex = index;
                  userAnswer = questionModel.getQuestionOptions()[index];
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: checkWidth(context, 0.025),
                    vertical: checkHeight(context, 0.01),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: checkHeight(context, 0.09),
                    decoration: BoxDecoration(
                      color: questionCardColor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1.5, color: textInActiveColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: index == tappedIndex
                                  ? buttonActiveColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                              border: index == tappedIndex
                                  ? null
                                  : Border.all(
                                      width: 1.5, color: textInActiveColor),
                            ),
                            child: Icon(
                              Icons.check,
                              size: checkHeight(context, 0.020),
                              color: index == tappedIndex
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                          ),
                          bodyTextMedium(
                              questionModel.getQuestionOptions()[index],
                              checkHeight(context, 0.022),
                              Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(child: Container()),
          // Button Next
          buttonRounded(
            title: !questionModel.isUserFinished() ? 'دواتر' : 'ئەنجام',
            color: buttonActiveColor,
            onTap: () {
              if (tappedIndex != null) {
                checkIfUserIsFinished(userAnswer!);
                tappedIndex = null;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red[50],
                    duration: const Duration(seconds: 1),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        bodyTextLight('تكایە یەكێك لە وەڵامەكان هەڵبژێرە', 14.0,
                            Colors.redAccent),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.radio_button_off,
                          color: Colors.redAccent,
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: userScoreTracker,
            ),
          )
        ],
      ),
    );
  }

  Widget buildTimeIndicator() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: SizedBox(
        height: checkHeight(context, 0.04),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(55),
                child: LinearProgressIndicator(
                  value: _tickerLengthController,
                  backgroundColor: Colors.grey,
                  color: _tickerLength <= 5
                      ? Colors.redAccent
                      : Colors.greenAccent,
                  minHeight: checkHeight(context, 0.035),
                ),
              ),
            ),
            Center(
              child: bodyTextLight(_tickerLength.toStringAsFixed(0),
                  checkHeight(context, 0.024), Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget buildQuestionText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: bodyTextLight(questionModel.getQuestionNumber(),
                  checkHeight(context, 0.0230), textInActiveColor),
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 1,
              color: textInActiveColor,
            ),
            const SizedBox(
              height: 5,
            ),
            bodyTextMedium(questionModel.getQuestionText(),
                checkHeight(context, 0.028), Colors.white)
          ],
        ),
      ),
    );
  }

  Widget buildDialog() {
    return Scaffold(
      backgroundColor: backGroundColor.withOpacity(0.3),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: checkWidth(context, 0.02)),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: checkHeight(context, 0.5),
              width: checkWidth(context, 0.8),
              color: buttonActiveColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  bodyTextLight(
                    'لە كۆی ${questionModel.totalNumberOfQuestion} پرسیار',
                    checkHeight(context, 0.024),
                    Colors.grey,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  headlineLarge(
                    '$userScore',
                    checkHeight(context, 0.12),
                    Colors.white,
                  ),
                  bodyTextLight(
                    'ڕاست بوو',
                    checkHeight(context, 0.024),
                    Colors.grey,
                  ),
                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: checkWidth(context, 0.02),
                      ),
                      TextButton(
                        onPressed: () {
                          questionModel.reset();
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/mainScreen', (route) => false);
                        },
                        child: bodyTextLight('ماڵەوە',
                            checkHeight(context, 0.024), Colors.white),
                      ),
                      buttonRounded(
                        title: 'دووبارە كردنەوە',
                        color: const Color(0xFF4764E0),
                        onTap: () {
                          questionModel.reset();
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/questionScreen', (route) => false);
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
