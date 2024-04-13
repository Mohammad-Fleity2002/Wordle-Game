import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_1_1/Themes/theme_provider.dart';

import '../Themes/theme_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Settings'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.maybePop(context);
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      body: Column(
        children: [
          Consumer<ThemeProvider>(
            builder:(_,notifier,__) {
              bool _isSwitched=false;
              _isSwitched=notifier.isDark;
              return SwitchListTile(
                title: const Text("Dark Theme"),
                  value: _isSwitched,
                  onChanged: (value){
                    // print("value: $value");

                    setState(() {
                      _isSwitched=value;
                    });
                    ThemePreferences.saveTheme(isDark: _isSwitched);
                    Provider.of<ThemeProvider>(context,listen: false).setTheme(turnOn: _isSwitched);
                    // print("_isSwitched: $_isSwitched");
                  },
              );
            },
          )
        ],
      ),
    );
  }
}
