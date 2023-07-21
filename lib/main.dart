import 'package:flutter/material.dart';
import 'package:pravda_or_deistvie/screens/Home.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: const Color.fromARGB(244, 255, 255, 255)),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
      },
      debugShowCheckedModeBanner: false,
    ));
