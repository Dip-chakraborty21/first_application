import 'package:flutter/material.dart';

void main() => runApp(ProfilePage());

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  bool flag = true;
  late Function nameSetState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 237),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 130, bottom: 20),
              child: Image.asset(
                'lib/assets/my_logo.JPG',
                height: 150,
                width: 150,
              ),
            ),
            StatefulBuilder(
              builder: (
                BuildContext context,
                void Function(void Function()) setState,
              ) {
                nameSetState = setState;
                return Text(
                  'Dip Chakraborty',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: flag
                        ? Color.fromARGB(255, 119, 110, 234)
                        : Color.fromARGB(255, 163, 88, 133),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Email - dipchakraborty@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 6, 0, 91),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Contact - 0123456789',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 6, 0, 91),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Address - Coochbehar, West Bengal',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 6, 0, 91),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            ),
            ElevatedButton(
              onPressed: () {
                nameSetState(() {
                  flag = !flag;
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 1, 90, 153),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  )),
              child: Text(
                'Click Me',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Image.asset(
              'lib/assets/sample.jpeg',
              height: 295,
              width: 450,
            ),
          ],
        ),
      ),
    );
  }
}
