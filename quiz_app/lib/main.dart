import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  List<Map> allQuestions = [
    {
      "question":
          " Which programming language is used to build Flutter applications?",
      "options": ["Java", "Kotlin", "Dart", "Python"],
      "answerIndex": 2,
    },
    {
      "question": " How many types of widgets are there in Flutter?",
      "options": ["2", "4", "6", "8+"],
      "answerIndex": 0,
    },
    {
      "question":
          " Which function will return the widgets attached to the screen as a root of the widget tree to be rendered on screen?",
      "options": ["main()", "runApp()", "container()", "root()"],
      "answerIndex": 1,
    },
    {
      "question":
          " What widget would you use for repeating content in Flutter??",
      "options": ["ArrayVeiw", "stack", "ExpandedView", "ListVeiw"],
      "answerIndex": 3,
    },
    {
      "question": " Who is the founder of Google?",
      "options": ["Steve Jobs", "Lary Page", "Bill Gates", "ElonMusk"],
      "answerIndex": 1,
    },
  ];
  bool questionScreen = true;
  int questionIndex = 0;
  int selectedAnswerIndex = -1;
  int noOfCorrectAnswers = 0;
  MaterialStateProperty<Color?> checkAnswer(int buttonIndex) {
    if (selectedAnswerIndex != -1) {
      if (buttonIndex == allQuestions[questionIndex]["answerIndex"]) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonIndex == selectedAnswerIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void validateCurrentPage() {
    if (selectedAnswerIndex == -1) {
      return;
    }
    if (selectedAnswerIndex == allQuestions[questionIndex]["answerIndex"]) {
      noOfCorrectAnswers += 1;
    }
    if (selectedAnswerIndex != -1) {
      if (questionIndex == allQuestions.length - 1) {
        setState(() {
          questionScreen = false;
        });
      }
      selectedAnswerIndex = -1;
      setState(() {
        questionIndex += 1;
      });
    }
  }

  Scaffold isQuestionScreen() {
    if (questionScreen == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz_App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(255, 250, 247, 243),
            ),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Container(
          color: Colors.grey,
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "Questions : ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${questionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ]),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 380,
                height: 70,
                child: Text(
                  allQuestions[questionIndex]["question"],
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                width: 190,
                color: Colors.grey,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(0),
                  ),
                  onPressed: () {
                    if (selectedAnswerIndex == -1) {
                      setState(() {
                        selectedAnswerIndex = 0;
                      });
                    }
                  },
                  child: Text(
                    "A.${allQuestions[questionIndex]["options"][0]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: 190,
                color: Colors.grey,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(1),
                  ),
                  onPressed: () {
                    if (selectedAnswerIndex == -1) {
                      setState(() {
                        selectedAnswerIndex = 1;
                      });
                    }
                  },
                  child: Text(
                    "B.${allQuestions[questionIndex]["options"][1]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: 200,
                color: Colors.grey,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(2),
                  ),
                  onPressed: () {
                    if (selectedAnswerIndex == -1) {
                      setState(() {
                        selectedAnswerIndex = 2;
                      });
                    }
                  },
                  child: Text(
                    "C.${allQuestions[questionIndex]["options"][2]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: 190,
                color: Colors.grey,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(3),
                  ),
                  onPressed: () {
                    if (selectedAnswerIndex == -1) {
                      setState(() {
                        selectedAnswerIndex = 3;
                      });
                    }
                  },
                  child: Text(
                    "D.${allQuestions[questionIndex]["options"][3]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            validateCurrentPage();
          },
          backgroundColor: Colors.red,
          child: const Text(
            "  Next  ",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(255, 12, 12, 12),
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Image.network(
              "https://img.freepik.com/premium-vector/winner-trophy-cup-with-ribbon-confetti_51486-122.jpg",
              height: 500,
              width: 400,
            ),
            const Text(
              "Congratulations!!!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "You have completed the Quiz",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Text("$noOfCorrectAnswers/${allQuestions.length}"),
            ElevatedButton(
                onPressed: () {
                  questionIndex = 0;
                  questionScreen = true;
                  noOfCorrectAnswers = 0;
                  selectedAnswerIndex = -1;
                  setState(() {});
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.orange,
                  ),
                ))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
