import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_1_1/Constants/colors.dart';
import 'package:test_flutter_1_1/Controllers/Controller.dart';
import 'package:test_flutter_1_1/Pages/settings_page.dart';
import 'package:test_flutter_1_1/Themes/theme_preferences.dart';
import 'package:test_flutter_1_1/Themes/theme_provider.dart';
import 'package:test_flutter_1_1/Themes/themes.dart';
// import 'package:test_flutter_1_1/Themes/theme_provider.dart';
import 'Pages/home_page.dart';

void main() {
  // runApp(MaterialApp(
  //   home: MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (_)=>Controller()),
  //       ChangeNotifierProvider(create: (_)=>ThemeProvider()),
  //     ],
  //       child: const MyApp()
  //   )
  // ));
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Controller()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: FutureBuilder(
          initialData: false,
          future: ThemePreferences.getTheme(),
          builder:(context,snapshot) {
            if(snapshot.hasData){
              WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                Provider.of<ThemeProvider>(context,listen:false).setTheme(turnOn: snapshot.data as bool);
              });
            }
            return
              Consumer<ThemeProvider>(
            builder: (_,notifier,__)=>MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Wordle Clone",
              theme: notifier.isDark?darkTheme:lightTheme,
              home: const HomePage(),
            ),
          );
          },
        ),
      );
  }
}
