import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: IPhone15ProBack(),
        ),
      ),
    );
  }
}

class IPhone15ProBack extends StatelessWidget {
  const IPhone15ProBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 400,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 243, 102, 102),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 15,
            child: CameraModule(),
          ),
          Positioned(
            top: 160,
            left: 80,
            child: Image.asset(
              'lib/assets/apple_fill.png',
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class CameraModule extends StatelessWidget {
  const CameraModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 243, 102, 102),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: CameraLens(),
          ),
          Positioned(
            top: 35,
            right: 25,
            child: CameraLens(),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: CameraLens(),
          ),
        ],
      ),
    );
  }
}

class CameraLens extends StatelessWidget {
  const CameraLens({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 8, 8, 8),
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color.fromARGB(255, 65, 61, 61),
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
    );
  }
}
