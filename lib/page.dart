import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Meet Page',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromARGB(255, 24, 24, 24),
      ),
      home: ProfileScrollView(),
    );
  }
}

class ProfileScrollView extends StatelessWidget {
  const ProfileScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Meet Page'),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                child: Row(
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('lib/assets/dip_logo.JPG'),
                          ),
                          //SizedBox(height: 5),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(                         
                              'Dip Chakraborty',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 300,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(12),
                      ),
                     child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           SizedBox(),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('lib/assets/my_logo.JPG'),
                          ),
                          //SizedBox(height: 5),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Dip Chakraborty',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 300,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           SizedBox(),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('lib/assets/sample.jpeg'),
                          ),
                          //SizedBox(height: 5),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Dip Chakraborty',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.red,
                      child: Icon(Icons.mic_off),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Mute',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.red,
                      child: Icon(Icons.videocam_off),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Video',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.red,
                      child: Icon(Icons.call_end),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'End',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
