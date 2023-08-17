import 'package:app_list_members/pages/home_page.dart';
import 'package:app_list_members/repositorys/color_repositori.dart';
import 'package:app_list_members/repositorys/persons_repositor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => MembersRepository())
    ], child: const MyApp(),)
    );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final  ColorRepository cores = ColorRepository();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:  ThemeData(
        colorScheme: ColorScheme.dark(primary: cores.corPrincipal, onPrimary: Colors.white, secondary: cores.corPrincipal)
          
        ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

