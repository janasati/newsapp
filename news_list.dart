import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'news_detail.dart';
import 'news_model.dart';

class NewsList extends StatelessWidget {
  final Map<String, dynamic> author;

  const NewsList({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
      future: fetchNews(author['author_id']),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(
              child: Text('Error fetching data. Please try again later.'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data![index].text),
                subtitle: Text(snapshot.data![index].author),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NewsDetail(news: snapshot.data![index]),
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }

  Future<List<News>> fetchNews(int authorId) async {
    var url = Uri.parse(
        'https://cyclical-scene.000webhostapp.com/get_news.php?author_id=$authorId');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> newsJson = json.decode(response.body);
      return newsJson.map((json) => News.fromJson(json)).toList();
    } else {
      throw http.Response(
          'Failed to load news. Error: ${response.body}', response.statusCode);
    }
  }
}
