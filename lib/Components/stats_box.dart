import 'package:flutter/material.dart';
import 'package:test_flutter_1_1/Components/stats_chart.dart';
import 'package:test_flutter_1_1/Components/stats_tile.dart';
import 'package:test_flutter_1_1/Constants/anser_stages.dart';
import 'package:test_flutter_1_1/Data/keys_map.dart';
import 'package:test_flutter_1_1/main.dart';
import 'package:test_flutter_1_1/utils/calculate_stats.dart';


class StatsBox extends StatelessWidget {
  const StatsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      insetPadding: EdgeInsets.fromLTRB(size.width * 0.08, size.height * 0.12,
          size.width * 0.08, size.height * 0.12),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IconButton(
              alignment: Alignment.centerRight,
              onPressed: () {
                Navigator.maybePop(context);
              },
              icon: const Icon(Icons.clear)),
          const Expanded(
              child: Text(
                'STATISTICS',
                textAlign: TextAlign.center,
              )),
          Expanded(
            flex: 2,
            child: FutureBuilder(
              future: getStats(),
              builder: (context, snapshot){
                List<String>? resultsString ;
                List<int> results = [0, 0, 0, 0, 0]; // Default values as integers
                    if (snapshot.hasData) {
                      results=snapshot.data as List<int>;
                      // resultsString = snapshot.data?.toList();
                      // for (var e in resultsString!) {
                      //   results.add(int.parse(e));
                      // }// data.add(ChartModel(score: int.parse(e), currentGame: false));

                    }
                    // Convert results to List<String> for display
                    // print(results);
                    // print(resultsString);
                    return Row(
                      children: [
                        StatsTile(
                          heading: 'Played',
                          value: results[0],
                        ),
                        StatsTile(
                          heading: 'Win %',
                          value: results[2].toInt(),
                        ),
                        StatsTile(
                          heading: 'Current\nStreak',
                          value: results[3].toInt(),
                        ),
                        StatsTile(
                          heading: 'Max\nStreak',
                          value: results[4].toInt(),
                        ),
                      ],
                    );
              },
            ),
          ),
          const Expanded(
            flex: 8,
            child: StatsChart(),
          ),
           Expanded(
            flex: 2,
              child: FutureBuilder(
                future: getStats(),
                builder: (context, snapshot) {
                  List<int> results = [0, 0, 0, 0, 0,0]; // Default values as integers
                  if (snapshot.hasData) {
                    results=snapshot.data as List<int>;

                  }
                  return Text(
                    "level ${results[5].toInt()}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),

                    textAlign: TextAlign.center,
                  );
                }
              )
          ),
          Expanded(
              flex: 2,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    keysMap.updateAll(
                            (key, value) => value = AnswerStage.notAnswered);

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const MyApp()),
                            (route) => false);
                  },
                  child: const Text(
                    'Replay',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )))
        ],
      ),
    );
  }
}