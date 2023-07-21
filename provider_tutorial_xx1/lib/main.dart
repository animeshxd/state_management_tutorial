import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (context) => Counter(),
      child: Scaffold(
        // Selector will check the counter value, if the previous value is same with current then don't rebuild
        body: Selector<Counter, int>(
          selector: (context, value) => value.counter,
          builder: (context, value, child) {
            print("rebuild: Selector");
            return Center(
              child: Text(
                "$value",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            );
          },
        ),
        floatingActionButton: Consumer<Counter>(
          builder: (context, value, child) => Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: value.increament,
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 5),
              FloatingActionButton(
                onPressed: value.decreament,
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int counter = 0;
  double _counter = 0;

  void increament() {
    _counter += .5;
    counter = _counter.toInt();
    notifyListeners();
  }

  void decreament() {
    counter--;
    notifyListeners();
  }
}
