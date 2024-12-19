import 'dart:convert';
import 'package:http/http.dart' as http;
import 'posts_model.dart';

Future<Posts> fetchPosts(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
  if (response.statusCode == 200) {
    return Posts.fromJson(jsonDecode(response.body));
  } else {
    // Jika status code tidak 200, kita buat exception dengan pesan yang sesuai
    throw Exception(
        'Failed to load posts. Status code: ${response.statusCode}');
  }
}
