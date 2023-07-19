import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => CounterModel(),
        child: const Page(),
      ),
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    print('rebuild: Page');
    // try uncommenting
    // var counter = Provider.of<CounterModel>(context);
    return const Scaffold(
      body: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    print('rebuild: MyWidget');
    var counter = Provider.of<CounterModel>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("${counter.counter}"),
          TextButton.icon(
            onPressed: counter.increament,
            icon: const Icon(Icons.plus_one),
            label: const Text("Increament"),
          ),
        ],
      ),
    );
  }
}

class CounterModel with ChangeNotifier {
  int counter = 0;

  void increament() {
    counter++;
    notifyListeners();
  }
}
