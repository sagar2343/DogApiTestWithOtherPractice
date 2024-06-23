import 'package:flutter/material.dart';

class DogCartPage extends StatefulWidget {
  const DogCartPage({super.key});

  @override
  State<DogCartPage> createState() => _DogCartPageState();
}

class _DogCartPageState extends State<DogCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'),),
      body: Column(
        children: [],
      ),
    );
  }
}
