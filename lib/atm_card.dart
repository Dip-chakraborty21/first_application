import 'package:flutter/material.dart';

void main() => runApp(ATMCardApp());

class ATMCardApp extends StatelessWidget {
  const ATMCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ATMCardScreen(),
    );
  }
}

class ATMCardScreen extends StatefulWidget {
  const ATMCardScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ATMCardScreenState createState() => _ATMCardScreenState();
}

class _ATMCardScreenState extends State<ATMCardScreen> {
  bool _viewDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ATM Card UI'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height: 200,
              decoration: BoxDecoration(
                color: _viewDetails ? Colors.green : Colors.blue,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Name of Card Holder - Dip Chakraborty',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _viewDetails
                          ? '6059 8562 8947 0005'
                          : 'xxxx xxxx xxxx 0005',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'CVV: ${_viewDetails ? '100' : 'xxx'}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _viewDetails = !_viewDetails;
                });
              },
              child: Text('View Details'),
            ),
          ],
        ),
      ),
    );
  }
}
