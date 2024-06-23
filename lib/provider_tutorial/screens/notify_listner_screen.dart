import 'package:flutter/material.dart';

class NotifyListnerScreen extends StatelessWidget {
  NotifyListnerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _secure = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notify Listener'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: _secure,
            builder: (context, value, child) {
              return TextFormField(
                obscureText: _secure.value,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffix: InkWell(
                    onTap: () {
                      _secure.value = !_secure.value;
                    },
                    child: Icon(_secure.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context, value, child) {
              return Center(
                child: Text(
                  _counter.value.toString(),
                  style: const TextStyle(fontSize: 50),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
