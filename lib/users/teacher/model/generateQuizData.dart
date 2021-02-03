import 'dart:math';

import 'package:IntelliEd/users/teacher/model/teacher.dart';

generateQuizData() {
  List<List<Map>> data = [];

  // Randomize Collaborative
  List<Map<String, String>> collaborative = [];
  int randomStartForCollaborative = Random().nextInt(4);

  for (int i = randomStartForCollaborative; i < 4; i++) {
    int rnd = Random().nextInt(quizData['collaborative']['$i'].length);
    collaborative.add(
      {
        'marks': i.toString(),
        'option': quizData['collaborative']['$i'][rnd],
      },
    );
  }
  if (randomStartForCollaborative != 0) {
    for (int i = 0; i < randomStartForCollaborative; i++) {
      int rnd = Random().nextInt(quizData['collaborative']['$i'].length);
      collaborative.add(
        {
          'marks': i.toString(),
          'option': quizData['collaborative']['$i'][rnd],
        },
      );
    }
  }

  // Randomize Respect
  List<Map<String, String>> respect = [];
  int randomStartForRespect = Random().nextInt(4);

  for (int i = randomStartForRespect; i < 4; i++) {
    int rnd = Random().nextInt(quizData['respect']['$i'].length);
    respect.add({
      'marks': i.toString(),
      'option': quizData['respect']['$i'][rnd],
    });
  }
  if (randomStartForRespect != 0) {
    for (int i = 0; i < randomStartForRespect; i++) {
      int rnd = Random().nextInt(quizData['respect']['$i'].length);
      respect.add({
        'marks': i.toString(),
        'option': quizData['respect']['$i'][rnd],
      });
    }
  }

  // Randomize Initiative
  List<Map<String, String>> initiative = [];
  int randomStartForInitiative = Random().nextInt(4);

  for (int i = randomStartForInitiative; i < 4; i++) {
    int rnd = Random().nextInt(quizData['initiative']['$i'].length);
    initiative.add({
      'marks': i.toString(),
      'option': quizData['initiative']['$i'][rnd],
    });
  }
  if (randomStartForInitiative != 0) {
    for (int i = 0; i < randomStartForInitiative; i++) {
      int rnd = Random().nextInt(quizData['initiative']['$i'].length);
      initiative.add({
        'marks': i.toString(),
        'option': quizData['initiative']['$i'][rnd],
      });
    }
  }

  // Randomize workHabits
  List<Map<String, String>> workHabits = [];
  int randomStartForWorkHabits = Random().nextInt(4);

  for (int i = randomStartForWorkHabits; i < 4; i++) {
    int rnd = Random().nextInt(quizData['initiative']['$i'].length);
    workHabits.add({
      'marks': i.toString(),
      'option': quizData['initiative']['$i'][rnd],
    });
  }
  if (randomStartForWorkHabits != 0) {
    for (int i = 0; i < randomStartForWorkHabits; i++) {
      int rnd = Random().nextInt(quizData['initiative']['$i'].length);
      workHabits.add({
        'marks': i.toString(),
        'option': quizData['initiative']['$i'][rnd],
      });
    }
  }

  data = [
    collaborative,
    respect,
    initiative,
    workHabits,
  ];
  return data;
}
