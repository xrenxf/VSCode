import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:smarthome/mock/api_service.dart';
import 'package:smarthome/mock/posts_model.dart'; // Sesuaikan dengan struktur proyek Anda

void main() {
  test('Test fetchPosts success case', () async {
    // Arrange
    final client = http.Client();

    // Act
    final result = await fetchPosts(client);

    // Assert
    expect(result, isA<Posts>());
    expect(result.userId, isNotNull);
    expect(result.id, isNotNull);
    expect(result.title, isNotNull);
    expect(result.body, isNotNull);

    // Print statement setelah sukses
    print('Test fetchPosts success! Result: $result');

    // Print statement untuk menampilkan JSON
    print('Fetched JSON: ${result.toJson()}');
  });
  test('Test Posts.fromJson', () {
    // Arrange
    final jsonData = {
      "userId": 1,
      "id": 1,
      "title": "Test Title",
      "body": "Test Body",
    };

    // Act
    final result = Posts.fromJson(jsonData);

    // Assert
    expect(result, isA<Posts>());
    expect(result.userId, jsonData["userId"]);
    expect(result.id, jsonData["id"]);
    expect(result.title, jsonData["title"]);
    expect(result.body, jsonData["body"]);
  });

  test('Test Posts.toJson - Display userId and id only', () {
    // Arrange
    final posts = Posts(
      userId: 1,
      id: 1,
      title: "Halo Semuanya",
      body: "apakah",
    );

    // Act
    final result = posts.toJson();

    // Assert
    expect(result, isA<Map<String, dynamic>>());
    expect(result.containsKey("userId"), true);
    expect(result.containsKey("id"), true);
    expect(result.containsKey("title"), true);
    expect(result.containsKey("body"), true);

    // Print statement untuk menampilkan JSON
    print('Posts.toJson - Display userId and id only: $result');
  });
}
