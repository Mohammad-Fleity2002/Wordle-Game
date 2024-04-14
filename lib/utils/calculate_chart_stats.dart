import 'package:shared_preferences/shared_preferences.dart';

setChartStats({required int currentRow}) async {
  List<int> distribution = [0, 0, 0, 0, 0, 0];
  List<String> distributionString = [];

  final stats = await getStats();
  print("stats line 8 calculate_chart_stats: $stats");

  if (stats != null) {
    distribution = stats;
  }

  for (int i = 0; i < 6; i++) {
    if (currentRow - 1 == i) {
      distribution[i]++;
    }
  }

  for (var e in distribution) {
    distributionString.add(e.toString());
  }

  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('row', currentRow);
  print("distributionString: $distributionString");
  prefs.setStringList('chart', distributionString);
}

Future<List<int>?> getStats() async {
  final prefs = await SharedPreferences.getInstance();
  final stats = prefs.getStringList('chart');
  print("stats: $stats");
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