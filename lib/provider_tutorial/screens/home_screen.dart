import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      count++;

    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(title: const Text('Home'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second}",
          style: const TextStyle(fontSize: 50),
          ),
          Center(
            child: Text(count.toString(),
              style: const TextStyle(fontSize: 50),),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          count++;
          print(count);
          setState(() {

          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
