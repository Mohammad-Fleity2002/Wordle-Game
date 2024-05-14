import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_1_1/API_Connections/api_connection.dart';
import 'package:test_flutter_1_1/Components/stats_box.dart';
import 'package:test_flutter_1_1/Pages/settings_page.dart';
import 'package:test_flutter_1_1/utils/quick_box.dart';

import '../Components/grid.dart';
import '../Components/keyboard_row.dart';
import '../Controllers/Controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late String _word;
  late String _description;
  int currentRow=0;

  @override
  void initState() {

    // TODO: implement initState
    // final r = Random().nextInt(words.length);
    // _word = words[r];
    if(first_Time) {
      print_data();
    }else{
      choose_word();
    }
    _word=chosenWord;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Controller>(context, listen: false)
          .setCorrectWord(word: _word);
    });
    // to avoid an unwanted exception
    // the ? to tell the ide that this method
    // will only run ig the previous value is not null
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wordle'
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Consumer<Controller>(
            builder: (_, notifier, __) {
              if (notifier.notEnoughLetters) {
                // runQuickBox(context: context, message: 'Not Enough Letters');
                runQuickBox(context: context, message: notifier.description,duration: 3);
                // firstTime=false;

              }
              if(notifier.needHint && currentRow!=notifier.currentRow &&!notifier.gameWon&&!notifier.gameCompleted){
                runQuickBox(context: context, message: notifier.description,duration: 2);
                currentRow= notifier.currentRow;
              }
              if (notifier.gameCompleted) {
                if (notifier.gameWon) {
                  if (notifier.currentRow == 6) {
                    runQuickBox(context: context, message: 'Phew!');
                  } else {
                    runQuickBox(context: context, message: 'Congrats!');
                  }
                }else {
                  runQuickBox(context: context, message: notifier.correctWord);
                }
                Future.delayed(
                  const Duration(milliseconds: 4000),
                      () {
                    if (mounted) {
                      showDialog(
                          context: context, builder: (_) => const StatsBox());
                    }
                  },
                );
              }
              return IconButton(
                  onPressed: () async {
                    showDialog(
                        context: context, builder: (_) => const StatsBox());
                  },
                  icon: const Icon(Icons.bar_chart_outlined));
            },
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Settings()));
              },
              icon: const Icon(Icons.settings))        ],
      ),
      body:   const Column(
        children: [
          Divider(
            height: 1,
            thickness: 2,
          ),
          Expanded(
              flex: 7,
              child: Grid(),
          ),
          Expanded(
              flex: 4,
            child: Column(
              children: [
              KeyboardRow(
                MIN: 1,
                MAX: 10,
              ),
              KeyboardRow(
                MIN: 11,
                MAX: 19,
              ),
              KeyboardRow(
                MIN: 20,
                MAX: 29,
              ),
              ],
          ),
          ),
      ],
      ),
    );
  }
}

  
