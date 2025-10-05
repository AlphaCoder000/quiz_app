import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: QuizApp());
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
      'question':
          'What command is used to run a flutter app on an emulator device?',
      'options': [
        'flutter build',
        'flutter start',
        'flutter run',
        'flutter launch',
      ],
      'correctAns': 2,
    },
    {
      'question': 'Who is considered the founder of World Wide Web?',
      'options': ['Steve Jobs', 'Tim Berners-Lee', 'Bill gates', 'Larry page'],
      'correctAns': 1,
    },
    {
      'question':
          'Which of the following is NOT a clound computig service model?',
      'options': [
        'IaaS(Infrastructure as a Service)',
        'PasS(Platform as a Service)',
        'DaaS(device as a Service )',
        'SaaS(Software as a Service)',
      ],
      'correctAns': 2,
    },
    {
      'question':
          'Which widget inn flutter is used to create scrollable lists of items?',
      'options': ['ListView', 'Column', 'Stack', 'Row'],
      'correctAns': 0,
    },
    {
      'question': 'Which company developed the Android operating system?',
      'options': ['Google', 'Microsoft', 'Android Inc.', 'IBM'],
      'correctAns': 2,
    },
  ];

  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  bool isQuestionPage = true;
  int total = 0;

  WidgetStatePropertyAll<Color?> checkAnswer(int answerIndex) {
    if (selectedAnswerIndex != -1) {
      if (answerIndex == allQuestions[currentQuestionIndex]['correctAns']) {
        if (selectedAnswerIndex == answerIndex) {
          total += 1;
        }
        return WidgetStatePropertyAll(Colors.green);
      } else if (selectedAnswerIndex == answerIndex) {
        return WidgetStatePropertyAll(Colors.red);
      } else {
        return WidgetStatePropertyAll(null);
      }
    } else {
      return WidgetStatePropertyAll(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return quizAppPage();
  }

  Scaffold quizAppPage() {
    if (isQuestionPage == true) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w900,
              color: Colors.amber,
              fontStyle: FontStyle.italic,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),

        body: Column(
          children: [
            const SizedBox(height: 10),

            Row(
              children: [
                const SizedBox(width: 120),
                Text(
                  "Question : ${currentQuestionIndex + 1}/${allQuestions.length}",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Center(
              child: SizedBox(
                height: 150,
                width: 380,
                child: Text(
                  allQuestions[currentQuestionIndex]['question'],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(0)),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 0;
                    setState(() {});
                  }
                },

                child: Text(
                  allQuestions[currentQuestionIndex]['options'][0],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(1)),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 1;
                    setState(() {});
                  }
                },

                child: Text(
                  allQuestions[currentQuestionIndex]['options'][1],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(2)),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 2;
                    setState(() {});
                  }
                },

                child: Text(
                  allQuestions[currentQuestionIndex]['options'][2],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(3)),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    selectedAnswerIndex = 3;
                    setState(() {});
                  }
                },

                child: Text(
                  allQuestions[currentQuestionIndex]['options'][3],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
            ),

            const SizedBox(height: 15),
          ],
        ),

        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                
                  if (currentQuestionIndex < allQuestions.length - 1) {
                    currentQuestionIndex--;
                    selectedAnswerIndex = -1;
                  } else {
                    isQuestionPage = false;
                  }
                  setState(() {});
                
              },
              backgroundColor: Colors.blue,
              child: const Text(
                "Prev",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),


            FloatingActionButton(
              onPressed: () {
                if (selectedAnswerIndex != -1) {
                  if (currentQuestionIndex < allQuestions.length - 1) {
                    currentQuestionIndex++;
                    selectedAnswerIndex = -1;
                  } else {
                    isQuestionPage = false;
                  }
                  setState(() {});
                }
              },
              backgroundColor: Colors.blue,
              child: const Text(
                "Next",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            onPressed: () {
              setState(() {
                currentQuestionIndex = 0;
                isQuestionPage = true;
              });
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          centerTitle: true,
          title: Text("Result Screen", style: TextStyle(fontSize: 30)),
        ),
        body: Column(
          children: [
            Image.network(
              "https://i.etsystatic.com/28440235/r/il/6c457c/4272169523/il_1080xN.4272169523_owix.jpg",
              width: 400,
              height: 600,
            ),
            SizedBox(height: 20),
            Text(
              "Congragulations",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            Text(
              "Score: $total/${allQuestions.length}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      );
    }
  }
}
