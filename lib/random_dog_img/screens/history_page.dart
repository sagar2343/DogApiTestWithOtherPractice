import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test4/random_dog_img/dog_provider.dart';

class DogHistoryPage extends StatefulWidget {
  const DogHistoryPage({super.key});

  @override
  State<DogHistoryPage> createState() => _DogHistoryPageState();
}

class _DogHistoryPageState extends State<DogHistoryPage> {
  @override
  Widget build(BuildContext context) {
    DogProvider dogProvider = Provider.of<DogProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        actions: [
          TextButton(
            onPressed: () {
              dogProvider.clearHistory();
            },
            child: const Text('Clear All',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
          )
        ],
      ),
      body: Container(
        color: Colors.red,
        child: Consumer<DogProvider>(
          builder: (context, value, child) {
            return value.history.isEmpty
                ? const Center(
                    child: Text(
                    'No History Recorded',
                    style: TextStyle(fontSize: 20),
                  ))
                : ListView.builder(
                    itemCount: value.history.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        child: Image.network(value.history[index].imageUrl),
                      );
                    });
          },
        ),
      ),
    );
  }
}
