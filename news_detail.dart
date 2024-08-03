import 'package:flutter/material.dart';

import 'news_model.dart';

class NewsDetail extends StatelessWidget {
  final News news;

  const NewsDetail({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.text,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),

            Text(
              'image test: ${news.imageUrl}',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16.0),
            _buildImageWidget(news.imageUrl),
            const SizedBox(height: 16.0),
            // Add more details as needed
          ],
        ),
      ),
    );
  }

  Widget _buildImageWidget(String imageUrl) {
    if (imageUrl != 'No Image URL') {
      return Image.network(
        imageUrl,
        height: 200.0,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          // Display a default image from a network URL if there's an error loading the image
          return Image.network(
            'https://cyclical-scene.000webhostapp.com/2.jpg', // ma 3am temshe 8er hay
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          );
        },
      );
    } else {
      // Display a default image from a network URL if the URL is not available
      return Image.network(
        'https://cyclical-scene.000webhostapp.com/1.jpg', // Replace with your default image URL
        height: 200.0,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }
  }
}
