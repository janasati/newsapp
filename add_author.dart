import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'news_app.dart';

class AddAuthor extends StatefulWidget {
  const AddAuthor({super.key});

  @override
  _AddAuthorState createState() => _AddAuthorState();
}

class _AddAuthorState extends State<AddAuthor> {
  final TextEditingController _authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Author'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _authorController,
              decoration: const InputDecoration(labelText: 'Author Name'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                addAuthor(_authorController.text);
              },
              child: const Text('Add Author'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addAuthor(String authorName) async {
    try {
      var url =
          Uri.parse('https://cyclical-scene.000webhostapp.com/add_author.php');
      var response = await http.post(url, body: {'author_name': authorName});

      if (response.statusCode == 200) {
        print('Author added successfully');

        // Pop the current screen (AddAuthor)
        Navigator.pop(context);

        // Push a replacement for the entire app (NewsApp)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const NewsApp(),
          ),
        );
      } else {
        print('Failed to add author. Error: ${response.body}');
      }
    } catch (error) {
      print('An error occurred while adding author: $error');
    }
  }
}
