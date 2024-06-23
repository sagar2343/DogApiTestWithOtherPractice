import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_provider.dart';
import 'my_favourite_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItem = [];
  List<String> dogBreeds =['Pug','German Shepered','PitBull','Rotwiller','Dalmetian','Siberian Husky','Bull Mastiff','Doberman Pincher','Great Dane','Labro Doodle','Labrodor Retriever','Permelion'];

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyFavouriteScreen()));
            },
              child: const Icon(Icons.shop))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dogBreeds.length,
              itemBuilder: (context, index) {
                return Consumer<FavouriteItemProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      title: Text(dogBreeds[index]),
                      trailing: InkWell(
                        onTap: () {
                          if(value.dogBreeds.contains(dogBreeds[index])){
                            value.removeItem(dogBreeds[index]);
                          }
                          else{
                            value.addItem(dogBreeds[index]);
                          }
                        },
                        child: Icon(
                            value.dogBreeds.contains(dogBreeds[index])
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                          color: value.dogBreeds.contains(dogBreeds[index]) ? Colors.red : Colors.grey,
                        ),

                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
