import 'dart:io';
import 'dart:math';
import 'game_shape.dart';

void main() {
  List<String> words = ['flutter', 'dart', 'html'];
  print("Welcome to Game Guess A Programming Word:");
  Random r1 = Random();
  String selectedWord = words[r1.nextInt(words.length - 1)];
  List<String> lettersNumber = [];
  for (var wordSplit in selectedWord.split('')) {
    lettersNumber.add('_');
  }
  int attempts = 6;
  int shapeIndex = 0;
  while (attempts != 0) {
    print('You are have ${attempts} attempts \n${lettersNumber}');
    print("Enter Guessed Letter:");
    String guessedLatter = stdin.readLineSync()!;
    for (int i = 0; i < selectedWord.length; i++) {
      if (selectedWord[i] == guessedLatter) {
        print('Correct Guessed Letter');
        lettersNumber[i] = guessedLatter;
      }
    }
    if (selectedWord.split('').contains(guessedLatter) == false) {
      print('Wrong Guessed Letter');
      attempts--;
      shapeIndex++;
      print(shape.hangmanStages[shapeIndex]);
    }
    if (selectedWord
        .split('')
        .every((letter) => lettersNumber.contains(letter))) {
      print('You Are Win');
      print('Word is ${selectedWord}');
      break;
    }
    if (attempts == 0 || shapeIndex == 6) {
      print('You Are Loss');
      print('Word is ${selectedWord}');
      break;
    }
  }
}
