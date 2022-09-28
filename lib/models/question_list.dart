import 'package:flutter/material.dart';
import 'package:quizo/models/questions.dart';
import 'package:quizo/utilities/my_own_widget.dart';

class QuestionModel {
  int _currentIndex = 0;

  final List<Question> _listOfQuestion = [
    Question(
        questionNumber: 'پرسیاری یەكەم',
        questionText: 'فلاتەر لە  لایەن كام كۆمپانیا دروست كراوە ؟',
        options: ['ئەمازۆن', 'ئەپڵ', 'گوگڵ'],
        correctAnswer: 'گوگڵ'),
    Question(
        questionNumber: 'پرسیاری دووەم',
        questionText: 'فەیسبووك لە  لایەن كام كۆمپانیا دروست كراوە ؟',
        options: ['مێتا', 'ئەپڵ', 'گوگڵ'],
        correctAnswer: 'مێتا'),
    Question(
        questionNumber: 'پرسیاری سێیەم',
        questionText: 'تێسلا لە  لایەن كام لەمانەی خوارەوە دروست كراوە ؟',
        options: ['ستیڤ جۆبز', 'ئیڵۆن مەسك', 'بێڵ گەیتس'],
        correctAnswer: 'ئیڵۆن مەسك'),
    Question(
        questionNumber: 'پرسیاری چوارەم',
        questionText: 'فەیسبووك لە  لایەن كام لەمانەی خوارەوە دروست كراوە ؟',
        options: ['مارك زەكربێرگ', 'ستیڤ جۆبز', 'بێڵ گەیتس'],
        correctAnswer: 'مارك زەكربێرگ'),
  ];

  // Checks if there are more question to bring or not
  void goToNextQuestion() {
    if (_currentIndex < _listOfQuestion.length - 1) {
      _currentIndex++;
    }
  }

  /// GET QUESTION TEXTS TO THE UI
  String getQuestionNumber() {
    return _listOfQuestion[_currentIndex].questionNumber;
  }

  String getQuestionText() {
    return _listOfQuestion[_currentIndex].questionText;
  }

  String getCorrectAnswer() {
    return _listOfQuestion[_currentIndex].correctAnswer;
  }

  List<String> getQuestionOptions() {
    return _listOfQuestion[_currentIndex].options;
  }

  bool isUserFinished() {
    if (_currentIndex >= _listOfQuestion.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _currentIndex = 0;
  }

  int get totalNumberOfQuestion => _listOfQuestion.length;
}
