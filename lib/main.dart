import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'FormPage.dart';
import 'TablePage.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Karyawan',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/form': (context) => FormPage(),
        '/table': (context) => TablePage(),
      },
    );
  }
}