import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter_1_1/API_Connections/api_connection.dart';
import 'package:test_flutter_1_1/utils/level_update.dart';

calculateStats({required bool gameWon}) async {
  int gamesPlayed = 0,
      gamesWon = 0,
      winPercentage = 0,
      currentSteak = 0,
      maxStreak = 0,
      level=0;

  final stats = await getStats();
  if (stats != null) {
    gamesPlayed = (stats[0]);
    gamesWon = (stats[1]);
    winPercentage = (stats[2]);
    currentSteak = (stats[3]);
    maxStreak = (stats[4]);
    level = (stats[5]);
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
if((winPercentage/5).toInt()>16&&level<5 &&gamesWon%5==0){
  level++;
  setCode();
}
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList('stats', [
    gamesPlayed.toString(),
    gamesWon.toString(),
    winPercentage.toString(),
    currentSteak.toString(),
    maxStreak.toString(),
    level.toString()
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
  // print("stats line 50 calculate_stats $stats");
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