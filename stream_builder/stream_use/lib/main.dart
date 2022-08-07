import 'package:flutter/material.dart';
import 'package:stream_use/counter_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CounterController _counterController;
  @override
  void initState() {
    _counterController = CounterController();
    super.initState();
  }

  @override
  void dispose() {
    _counterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Streams"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(),
          Center(
              child: StreamBuilder<int>(
                  stream: _counterController.counterStream,
                  initialData: 0,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<int> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      return Text(
                        '${_counterController.counter}',
                        style: Theme.of(context).textTheme.headline4,
                      );
                    } else {
                      return Text(
                        'Empty data',
                        style: Theme.of(context).textTheme.headline4,
                      );
                    }
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () =>
                    _counterController.eventSink.add(Event.decrement),
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () =>
                    _counterController.eventSink.add(Event.increment),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
