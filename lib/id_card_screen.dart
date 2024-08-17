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
          title: Text('Identity Card Container '),
        ),
        body: Center(
          child: IdCardScreen(),
        ),
      ),
    );
  }
}

class IdCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 237, 162, 162),
        border: Border.all(
          color: Colors.blue,
          
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Name - Dip Chakraborty',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 10.0,),
        
          Text(
            'Address - Rabindra Nagar, Chakdaha',
            style: TextStyle(fontSize: 16.0),
          ),
           SizedBox(height: 10.0,),
          Text(
            'Phone.no - 1234567890',
            style: TextStyle(fontSize: 16.0),
            
          ),
          Text(
            'Email - abc@gmail.com',
            style: TextStyle(fontSize: 16.0),
            
          ),
        ],
      ),
    );
  }
}
