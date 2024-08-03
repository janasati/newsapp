import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'add_author.dart';
import 'news_list.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  late List<Map<String, dynamic>> authors;
  String error = '';

  @override
  void initState() {
    super.initState();
    fetchAuthors();
  }

  Future<void> fetchAuthors() async {
    try {
      var url =
          Uri.parse('https://cyclical-scene.000webhostapp.com/get_authors.php');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> fetchedAuthors =
            (json.decode(response.body) as List).cast<Map<String, dynamic>>();

        setState(() {
          authors = fetchedAuthors;
          error = '';
        });
      } else {
        print('Failed to fetch authors and news. Error: ${response.body}');
        setState(() {
          error = 'Failed to fetch authors and news. Error: ${response.body}';
        });
      }
    } catch (error) {
      print('An error occurred while fetching authors and news: $error');
      setState(() {
        // error = 'An error occurred while fetching authors and news: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: authors.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: const Text('News App'),
          bottom: TabBar(
            tabs: authors
                .map((author) => Tab(text: author['author_name'] as String))
                .toList(),
          ),
        ),
        body: Column(
          children: [
            if (error.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.red,
                child: Text(
                  error,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            Expanded(
              child: TabBarView(
                children:
                    authors.map((author) => NewsList(author: author)).toList(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddAuthor(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
