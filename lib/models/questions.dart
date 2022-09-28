class Question {
  Question(
      {required this.questionNumber,
      required this.questionText,
      required this.options,
      required this.correctAnswer});

  final String questionNumber;
  final String questionText;
  final List<String> options;
  final String correctAnswer;
}
