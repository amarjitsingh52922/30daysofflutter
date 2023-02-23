import 'package:day2/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int days = 30;
  final String name = "Amarjit Singh";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
        ),
      ),
      body: Center(
        child: Text("Welcome to my  $days of Flutter by $name"),
      ),
      drawer: const MyDrawer(),
    );
  }
}
