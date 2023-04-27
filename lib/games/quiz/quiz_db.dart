import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Question {
  final String question, rightAnswer;
  final List<String> choices;
  final int number;
  Question({
    required this.question,
    required this.rightAnswer,
    required this.choices,
    required this.number,
  });
}

class QuizData {
  static late Database _questions;

  //! **********/
  //!        ***/
  //! GETTER ***/
  //!        ***/
  //! **********/


  static Future<Database> getProgress() async {
    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, "questions.db");
    var exist = await databaseExists(dbPath);
    if (!exist) {
      ByteData data = await rootBundle.load("assets/data/questions.db");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes);
    }
    return await openDatabase(dbPath);
  }

  static Future<List<Question>> getQuestions(int continentNumber) async {
    _questions = await getProgress();
    List<Map<String, dynamic>> questions =
        await _questions.rawQuery('SELECT * FROM quiz WHERE theme = $continentNumber');
    return List.generate(questions.length, (index) {
      return Question(
        question: questions[index]['question'],
        rightAnswer: questions[index]['rightAns'],
        choices: [
          questions[index]['rightAns'],
          questions[index]['choice1'],
          questions[index]['choice2'],
          questions[index]['choice3'],
        ],
        number: questions[index]['number'],
      );
    });
  }

}
