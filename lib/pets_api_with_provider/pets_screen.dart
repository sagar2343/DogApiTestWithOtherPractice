import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:test4/pets_api_with_provider/pets_provider.dart';

import 'PetsModel.dart';

class PetsHomeScreen extends StatefulWidget {
  const PetsHomeScreen({super.key});

  @override
  State<PetsHomeScreen> createState() => _PetsHomeScreenState();
}

class _PetsHomeScreenState extends State<PetsHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    final provider = Provider.of<PetsProvider>(context, listen:  false);
    provider.getDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PetsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('PetsData'),
      ),
      body: provider.isLoading
          ? getLoadingUi()
          : provider.error.isNotEmpty
              ? getErrorUi(provider.error)
              : getBodyUi(provider.pets),
    );
  }

  Widget getLoadingUi() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitFadingCircle(
            color: Colors.black,
            size: 80,
          ),
          Text(
            'Loading...',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }

  Widget getErrorUi(String error) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          error.toString(),
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  Widget getBodyUi(PetsModel pets) {
    return ListView.builder(
      itemCount: pets.data!.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(pets.data![index].petImage.toString()),
          ),
          title: Text(pets.data![index].userName.toString()),
          trailing: pets.data![index].isFriendly == true ? const Icon(Icons.gpp_good) : const Icon(Icons.dangerous),
        );
      },
    );
  }
}
