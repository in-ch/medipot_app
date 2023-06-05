import 'package:flutter/material.dart';
import 'package:medipot_app/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isChecked = false;
  void _handleFloating() {
    setState(() {
      print('handleFloating');
    });
  }

  void _handleCheckbox(value) {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('headlineLarge',
                  style: Theme.of(context).textTheme.headlineLarge),
              Text('headlineMedium',
                  style: Theme.of(context).textTheme.headlineMedium),
              Text('headlineSmall',
                  style: Theme.of(context).textTheme.headlineSmall),
              Text('bodyLarge', style: Theme.of(context).textTheme.bodyLarge),
              Text('bodyMedium', style: Theme.of(context).textTheme.bodyMedium),
              Text('bodySmall', style: Theme.of(context).textTheme.bodySmall),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Outline Button'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevate Button'),
              ),
              Checkbox(value: _isChecked, onChanged: _handleCheckbox),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Text Field',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleFloating,
        child: const Icon(Icons.add),
      ),
    );
  }
}
