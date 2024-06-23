import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/favourite_provider.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({super.key});

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favourites'),
      ),
      body: Column(
        children: [
          Consumer<FavouriteItemProvider>(
            builder: (context, value, child) {
              return value.dogBreeds.isEmpty
                  ? const Center(child: Text('No favourite items yet'))
                  : Expanded(
                      child: ListView.builder(
                        itemCount: value.dogBreeds.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              title: Text(value.dogBreeds[index]),
                              trailing: InkWell(
                                onTap: () {
                                  value.removeItem(value.dogBreeds[index]);
                                },
                                child: const Icon(
                                  Icons.remove_circle_outline,
                                  color: Colors.red,
                                ),
                              ));
                        },
                      ),
                    );
            },
          )
        ],
      ),
    );
  }
}
