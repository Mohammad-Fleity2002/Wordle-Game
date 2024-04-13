import 'package:flutter/material.dart';

import '../Constants/anser_stages.dart';
import '../Data/keys_map.dart';
import '../Models/tile_model.dart';

class Controller extends ChangeNotifier{
  bool checkLine = false,
      backOrEnterTapped = false,
      gameWon = false,
      gameCompleted = false,
      notEnoughLetters = false;
  String correctWord = "";
  int currentTile = 0, currentRow = 0;
  List<TileModel> tilesEntered = [];

  setCorrectWord({required String word}) => correctWord = word;
  setKeyTapped({
    required String value
  }){
    if (value=="ENTER"){
      backOrEnterTapped = true;
      if (currentTile == 5 * (currentRow + 1)) {
        checkWord();
      } else {
        notEnoughLetters = true;
      }
    }else if (value=="BACK"){
      backOrEnterTapped = true;
      notEnoughLetters = false;
      if (currentTile > 5 * (currentRow + 1) - 5) {
        currentTile--;
        tilesEntered.removeLast();
      }
    }else{
      backOrEnterTapped = false;
      notEnoughLetters = false;
      if (currentTile < 5 * (currentRow + 1)) {
        tilesEntered.add(
            TileModel(letter: value, answerStage: AnswerStage.notAnswered));
        currentTile++;
      }    }
    // print("current tile $currentTile");
    notifyListeners();
  }
  checkWord() {
    List<String> guessed = [], remainingCorrect = [];
    String guessedWord = "";

    for (int i = currentRow * 5; i < (currentRow * 5) + 5; i++) {
      guessed.add(tilesEntered[i].letter);
    }
    // fetch the list gust which the till this time
    // entered letters

    guessedWord = guessed.join();
    remainingCorrect = correctWord.characters.toList();
    // to now what is the remaining correct letters

    if (guessedWord == correctWord) {
      // print("right word");
      for (int i = currentRow * 5; i < (currentRow * 5) + 5; i++) {
        tilesEntered[i].answerStage = AnswerStage.correct;
        keysMap.update(tilesEntered[i].letter, (value) => AnswerStage.correct);
        print(keysMap[tilesEntered[i].letter]);
        // gameWon = true;
        // gameCompleted = true;
      }
    } else {
      // print("wrong word");
      for (int i = 0; i < 5; i++) {
        if (guessedWord[i] == correctWord[i]) {
          remainingCorrect.remove(guessedWord[i]);
          tilesEntered[i + (currentRow * 5)].answerStage = AnswerStage.correct;
          keysMap.update(guessedWord[i], (value) => AnswerStage.correct);
          print(keysMap[guessedWord[i]]);
        }
      }
      // what are the right letters guessed
      for (int i = 0; i < remainingCorrect.length; i++) {
        // for all remaining letters
        for (int j = 0; j < 5; j++) {
          // does it mach any of the provided letter on the right place
          if (remainingCorrect[i] == tilesEntered[j + (currentRow * 5)].letter) {
            if (tilesEntered[j + (currentRow * 5)].answerStage != AnswerStage.correct) {
              // don't turn green tiles (correct letter) to yellow (contains)
              tilesEntered[j + (currentRow * 5)].answerStage =
                  AnswerStage.contains;

            }
            final resultKey = keysMap.entries.where((element) => element.key == tilesEntered[j + (currentRow * 5)].letter);

            if (resultKey.single.value != AnswerStage.correct) {
              keysMap.update(resultKey.single.key, (value) => AnswerStage.contains);
              print(keysMap[resultKey.single.key]);

            }
          }
        }
      }
      // update incorrect answered letters
      for (int i = currentRow * 5; i < (currentRow * 5) + 5; i++) {
        if (tilesEntered[i].answerStage == AnswerStage.notAnswered) {
          tilesEntered[i].answerStage = AnswerStage.incorrect;

          final results = keysMap.entries.where((element) => element.key == tilesEntered[i].letter);
          if (results.single.value == AnswerStage.notAnswered) {
            // update the keyboard also
            keysMap.update(tilesEntered[i].letter, (value) => AnswerStage.incorrect);
            print(keysMap[tilesEntered[i].letter]);

          }
        }
      }
    }
    checkLine = true;
    currentRow++;

    if (currentRow == 6) {
      gameCompleted = true;
    }

    // if (gameCompleted) {
    //   calculateStats(gameWon: gameWon);
    //   if (gameWon) {
    //     setChartStats(currentRow: currentRow);
    //   }
    // }

    notifyListeners();
  }
}