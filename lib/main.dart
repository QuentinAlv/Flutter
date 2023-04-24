import 'package:flutter/material.dart';

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "museum", // in logical pixels
      theme: ThemeData(primaryColor: Color.fromARGB(255, 255, 255, 255)),
      home: const Artwork(),
    );
  }
}

class Artwork extends StatelessWidget {
  const Artwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Museum'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/Mona_Lisa.jpg',
          ),
          const Text("Mona Lisa",
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Merriweather',
                color: Colors.brown,
              )),
        ]),
      ),
    );
  }
}

void main() {
  runApp(
    const MuseumApp(),
  );
}
