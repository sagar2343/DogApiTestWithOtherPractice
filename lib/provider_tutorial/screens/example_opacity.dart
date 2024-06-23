import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/example_opacity_provider.dart';

class ExampleOpacity extends StatefulWidget {
  const ExampleOpacity({super.key});

  @override
  State<ExampleOpacity> createState() => _ExampleOpacityState();
}

class _ExampleOpacityState extends State<ExampleOpacity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opacity Slider Control'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOpacityProvider>(builder: (context, value, child) {
            return Slider(
                value: value.value, onChanged: (val) {
              value.setValue(val);
            });
          },),
          Consumer<ExampleOpacityProvider>(builder: (context, value, child) {
            return  Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration:
                    BoxDecoration(color: Colors.green.withOpacity(value.value)),
                    child: const Center(child: Text('Container 1')),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration:
                    BoxDecoration(color: Colors.red.withOpacity(value.value)),
                    child: const Center(child: Text('Container 2')),
                  ),
                )
              ],
            );
          },)

        ],
      ),
    );
  }
}
