import 'package:shared_preferences/shared_preferences.dart';

calculateStats({required bool gameWon}) async {
  int gamesPlayed = 0,
      gamesWon = 0,
      winPercentage = 0,
      currentSteak = 0,
      maxStreak = 0;

  final stats = await getStats();
  if (stats != null) {
    gamesPlayed = (stats[0]);
    gamesWon = (stats[1]);
    winPercentage = (stats[2]);
    currentSteak = (stats[3]);
    maxStreak = (stats[4]);
  }

  gamesPlayed++;

  if (gameWon) {
    gamesWon++;
    currentSteak++;
  } else {
    currentSteak = 0;
  }
  if (currentSteak > maxStreak) {
    maxStreak = currentSteak;
  }

  winPercentage = ((gamesWon / gamesPlayed) * 100).toInt();

  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList('stats', [
    gamesPlayed.toString(),
    gamesWon.toString(),
    winPercentage.toString(),
    currentSteak.toString(),
    maxStreak.toString()
  ]);
  print("gamesPlayed:${gamesPlayed.toString()}");
  print("gamesWon${gamesWon.toString()}");
  print("winPercentage${winPercentage.toString()}");
  print("currentSteak${currentSteak.toString()}");
  print("maxStreak${maxStreak.toString()}");
}

Future<List<int>?> getStats() async {
  final prefs = await SharedPreferences.getInstance();
  final stats = prefs.getStringList('stats');
  print("stats line 50 calculate_stats $stats");
  if (stats != null) {
    List<int> result = [];
    for (var e in stats) {
      result.add(int.parse(e));
    }
    return result;
  } else {
    return null;
  }
}