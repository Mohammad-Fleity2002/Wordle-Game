import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_1_1/Components/stats_box.dart';
import 'package:test_flutter_1_1/Pages/settings_page.dart';
import 'package:test_flutter_1_1/Themes/theme_provider.dart';
import 'package:test_flutter_1_1/data/keys_map.dart';

import '../Components/grid.dart';
import '../Components/keyboard_row.dart';
import '../Constants/words.dart';
import '../Controllers/Controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late String _word;

  @override
  void initState() {
    // TODO: implement initState
    final r = Random().nextInt(words.length);
    _word = words[r];
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
          IconButton(
              onPressed: (){
                showDialog(context: context, builder: (_)=>StatsBox());
              },
              icon: Icon(Icons.bar_chart_outlined),
          ),
          IconButton(
              onPressed: () {
                // Provider.of<ThemeProvider>(context,listen: false).setTheme();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Settings()));
                // push on the setting page when pressing the setting icon
              },
              icon: const Icon(Icons.settings))
        ],
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

  
