import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = "Pawtal";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: Text(widget.title),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: [
          IconButton(icon: Icon(Icons.person), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.purple[50],
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Text(
              'Hello, User.',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.health_and_safety),
          shape: CircleBorder(),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
