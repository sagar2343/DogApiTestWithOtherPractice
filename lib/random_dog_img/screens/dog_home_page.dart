import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test4/random_dog_img/dog_provider.dart';
import 'package:test4/random_dog_img/screens/cart_page.dart';
import 'package:test4/random_dog_img/screens/history_page.dart';

class DogHomePage extends StatefulWidget {
  const DogHomePage({super.key});

  @override
  State<DogHomePage> createState() => _DogHomePageState();
}

class _DogHomePageState extends State<DogHomePage> {
  @override
  Widget build(BuildContext context) {
    var dogProvider = Provider.of<DogProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Dogs'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DogHistoryPage()));
              },
              icon: const Icon(Icons.history)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DogCartPage()));
              },
              icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Consumer<DogProvider>(
                builder: (context, value, child) {
                  return SizedBox(
                    height: 450,
                    width: 350,
                    child: Center(
                      child: value.currentDog == null
                          ? const CircularProgressIndicator()
                          : Image.network(value.currentDog!.imageUrl),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  await dogProvider.fetchRandomDog();
                },
                child: const Text('Fetch New Dog'))
          ],
        ),
      ),
    );
  }
}
