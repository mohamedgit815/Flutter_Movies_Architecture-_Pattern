import 'package:flutter/material.dart';
import 'package:flutter_movies_app/Core/Services/service_locator.dart';
import 'package:flutter_movies_app/Movies/Presentation/Screens/movies_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() async {
  ServiceLocator().init();
  runApp(const ProviderScope(child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900
      ),
      home: const MainMoviesScreen()
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar()
    );
  }
}
