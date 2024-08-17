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
      title: 'List Tile Page',
      home: ListTilePage(),
    );
  }
}

class ListTilePage extends StatelessWidget {
  ListTilePage({super.key});

  final List<Map<String, String>> items = List.generate(
      21,
      (index) => {
            'title': 'Item ${index + 1}',
            'description': 'This is the description for item ${index + 1}',
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text('List Tile Page'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 245, 179, 179),
        child: ListView.separated(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                child: Text('${index + 1}'),
              ),
              title: Text(items[index]['title']!),
              subtitle: Text(items[index]['description']!),
              trailing: const Icon(Icons.more_vert),
            );
          },
          separatorBuilder: (context, index) => const Divider(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
