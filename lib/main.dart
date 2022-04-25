import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:magic_sdk/magic_sdk.dart';

import 'Home.dart';

void main() async {
  runApp(const MyApp());
  await dotenv.load();
  Magic.instance = Magic(dotenv.get('api', fallback: 'Not found'));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Demo',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: Stack(
        children: [
          const Home(),
          Magic.instance.relayer,
        ],
      ),
    );
  }
}
