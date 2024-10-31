import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/my_home_page.dart';
import 'package:state/pages/dictionary/dictionary_page.dart';
import 'package:state/pages/drink/drink_detail_page.dart';
import 'package:state/pages/drink/drink_home_page.dart';
import 'package:state/pages/frist_page.dart';
import 'package:state/pages/second_page.dart';
import 'package:state/providers/bottle_provider.dart';
import 'package:state/providers/dictionary_provider.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BottleProvider()),
          ChangeNotifierProvider(create: (_) => DictionaryProvider()),
        ],
        child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const FirstPage(),
      initialRoute: FirstPage.routeName,
      routes: {
        FirstPage.routeName : (context) => FirstPage(),
        SecondPage.routeName : (context) => SecondPage(),
        DrinkHomePage.routeName : (context) => DrinkHomePage(),
        DrinkDetailPage.routeName : (context) => DrinkDetailPage(),
        DictionaryPage.routeName : (context) => DictionaryPage()
      },
    );
  }
}

