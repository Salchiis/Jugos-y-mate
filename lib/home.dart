import 'package:flutter/material.dart';
import 'package:flutter_mentor_quiz_app_tut/answer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;

  void _questionAnswered(bool answerScore) {
    setState(() {
      // answer was selected
      answerWasSelected = true;
      // check if answer was correct
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }
      // adding to the score tracker on top
      _scoreTracker.add(
        answerScore
            ? Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : Icon(
                Icons.clear,
                color: Colors.red,
              ),
      );
      //when the quiz ends
      if (_questionIndex + 1 == _questions.length) {
        endOfQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
    // what happens at the end of the quiz
    if (_questionIndex >= _questions.length) {
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _scoreTracker = [];
      endOfQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'JAVA Programing quizz',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                if (_scoreTracker.length == 0)
                  SizedBox(
                    height: 25.0,
                  ),
                if (_scoreTracker.length > 0) ..._scoreTracker
              ],
            ),
            Container(
              width: double.infinity,
              height: 130.0,
              margin: EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  _questions[_questionIndex]['question'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ...(_questions[_questionIndex]['answers']
                    as List<Map<String, Object>>)
                .map(
              (answer) => Answer(
                answerText: answer['answerText'],
                answerColor: answerWasSelected
                    ? answer['score']
                        ? Colors.green
                        : Colors.red
                    : null,
                answerTap: () {
                  // if answer was already selected then nothing happens onTap
                  if (answerWasSelected) {
                    return;
                  }
                  //answer is being selected
                  _questionAnswered(answer['score']);
                },
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 40.0),
              ),
              onPressed: () {
                if (!answerWasSelected) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Please select an answer before going to the next question'),
                  ));
                  return;
                }
                _nextQuestion();
              },
              child: Text(endOfQuiz ? 'Restart Quiz' : 'Next Question'),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                '${_totalScore.toString()}/${_questions.length}',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final _questions = const [
  {
    'question': 'Which of the following is not a unary operator?',
    'answers': [
      {'answerText': 'Assigment', 'score': true},
      {'answerText': 'Decrement.', 'score': false},
      {'answerText': 'Bitwise complement.', 'score': false},
    ],
  },
  {
    'question': 'It is the Java keyword that creates inheritance.',
    'answers': [
      {'answerText': 'Enlarge', 'score': false},
      {'answerText': 'Inherits', 'score': false},
      {'answerText': 'Extends', 'score': true},
    ],
  },
  {
    'question': 'Which symbol is used to denote a multi-line comment?',
    'answers': [
      {'answerText': '//', 'score': false},
      {'answerText': '*/ */', 'score': false},
      {'answerText': '<-- -->', 'score': true},
    ],
  },
  {
    'question':
        'It is a form of Java program that runs locally on the command line.',
    'answers': [
      {'answerText': 'Applets', 'score': false},
      {'answerText': 'Application', 'score': true},
      {'answerText': 'Midlets', 'score': false},
    ],
  },
  {
    'question': 'It is the code/s inside a pair of curly braces.',
    'answers': [
      {'answerText': 'Block', 'score': true},
      {'answerText': 'Brick', 'score': false},
      {'answerText': 'Function', 'score': false},
    ],
  },
  {
    'question':
        'Which of the following is an invalid variable declaration in Java?',
    'answers': [
      {'answerText': 'Char CivilStatus =', 'score': true},
      {'answerText': 'Double Salary =0.0;', 'score': false},
      {'answerText': 'Int NumberOfStudents = 250;', 'score': false},
    ],
  },
  {
    'question': 'If A=10, then after B=++A, the value of B is _______.',
    'answers': [
      {'answerText': '11', 'score': true},
      {'answerText': '10', 'score': false},
      {'answerText': '13', 'score': false},
    ],
  },
  {
    'question': 'It is the length of the data type short.',
    'answers': [
      {'answerText': '32 bits', 'score': false},
      {'answerText': '8 bits', 'score': false},
      {'answerText': '16 bits', 'score': true},
    ],
  },
  {
    'question':
        'It defines the common variables and methods of a set of objects.',
    'answers': [
      {'answerText': 'Objects', 'score': false},
      {'answerText': 'Function', 'score': false},
      {'answerText': 'Class', 'score': true},
    ],
  },
];
