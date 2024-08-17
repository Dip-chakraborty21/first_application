import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Google Meet Style',)
          ,
          backgroundColor: Color.fromARGB(255, 127, 141, 184),
        ),
        body: Container(
          color: Color(0xFF202124), 
          child: PageView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              CircleAvatar(
                name: 'Ristu Adhikary',
                imagePath: 'lib/assets/dip_logo.JPG',
              ),
              CircleAvatar(
                name: 'Dip Chakraborty',
                imagePath: 'lib/assets/my_logo.JPG',
              ),
              CircleAvatar(
                name: 'Bhaskar Narayan',
                imagePath: 'lib/assets/sample.jpeg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleAvatar extends StatelessWidget {
  final String name;
  final String imagePath;

  CircleAvatar({required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                imagePath,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
