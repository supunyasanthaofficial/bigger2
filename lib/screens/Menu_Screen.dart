import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: const Color.fromARGB(255, 127, 38, 150),
      ),
      body: const Center(
        child: Text('Menu Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
