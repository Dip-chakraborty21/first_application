import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(Counter());

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => CounterState();
}

class CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  CounterScreenState createState() => CounterScreenState();
}

class CounterScreenState extends State<CounterScreen> {
  int counter = 0;
  late final StreamController<int> timerController =
      StreamController<int>.broadcast();
  late final StreamController<List<int>> lapsController =
      StreamController<List<int>>.broadcast();
  List<int> lapTimes = [];
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    timerController.close();
    lapsController.close();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      counter++;
      timerController.add(counter);
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  void resetCounter() {
    counter = 0;
    lapTimes.clear();
    timerController.add(counter);
    lapsController.add(lapTimes);
    timer?.cancel();
  }

  void recordLapTime() {
    lapTimes.add(counter);
    lapsController.add(lapTimes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countdown Timer'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<int>(
                stream: timerController.stream,
                initialData: counter,
                builder: (context, snapshot) {
                  return Text(
                    'Counter: ${snapshot.data}',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black26,
                          offset: Offset(3, 3),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: startTimer,
                    icon: Icon(Icons.play_arrow),
                    label: Text('Start Timer'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(fontSize: 18),
                      elevation: 5,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: stopTimer,
                    icon: Icon(Icons.pause),
                    label: Text('Stop Timer'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(fontSize: 18),
                      elevation: 5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: resetCounter,
                    icon: Icon(Icons.refresh),
                    label: Text('Reset Counter'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(fontSize: 18),
                      elevation: 5,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: recordLapTime,
                    icon: Icon(Icons.flag),
                    label: Text('Lap Time'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 124, 57, 160),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(fontSize: 18),
                      elevation: 5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: StreamBuilder<List<int>>(
                  stream: lapsController.stream,
                  initialData: lapTimes,
                  builder: (context, snapshot) {
                    final laps = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: laps.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 179, 205, 33).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'Lap ${index + 1}: ${laps[index]} seconds',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
