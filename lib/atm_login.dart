import 'package:flutter/material.dart';

void main() => runApp(WelcomeLoginApp());

class WelcomeLoginApp extends StatelessWidget {
  const WelcomeLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeLoginScreen(),
    );
  }
}

class WelcomeLoginScreen extends StatefulWidget {
  @override
  _WelcomeLoginScreenState createState() => _WelcomeLoginScreenState();
}

class _WelcomeLoginScreenState extends State<WelcomeLoginScreen> {
  bool _showPassword = false;
  bool flag = true;
  Color _backgroundColor = Colors.white;
  late Function welcomeSetTextState;

  void _changeBackgroundColor() {
    flag = !flag;
    _backgroundColor = flag
        ? Color.fromARGB(255, 165, 176, 117)
        : Color.fromARGB(255, 122, 46, 46);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatefulBuilder(
                builder: (context, setState) {
                  welcomeSetTextState = setState;
                  return Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: _backgroundColor,
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              Text(
                'Please login to your account',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 8, 0, 0),
                ),
              ),
              SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: !_showPassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _changeBackgroundColor();
                  welcomeSetTextState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 179, 98, 137),
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'CHANGE',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
