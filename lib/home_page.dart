import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int days = 30;
  final String name = "Amarjit Singh";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day2"),
      ),
      body: Center(
        child: Text("Welcome to $days of Flutter by $name"),
      ),
      drawer: const Drawer(),
    );
  }
}
